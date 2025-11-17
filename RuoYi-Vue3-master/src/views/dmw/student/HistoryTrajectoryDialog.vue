<template>
  <el-dialog
    v-model="visible"
    :title="dialogTitle"
    width="900px"
    append-to-body
    class="timeline-dialog"
  >
    <div v-loading="loading" class="timeline-body">
      <el-timeline v-if="timeline.length">
        <el-timeline-item
          v-for="item in timeline"
          :key="item.eventId"
          :timestamp="formatTime(item.eventTime)"
          :color="eventColor(item.eventType)"
        >
          <div class="timeline-card">
            <div class="timeline-card__header">
              <el-tag size="small" :type="eventTagType(item.eventType)">
                {{ eventTypeLabel(item.eventType) }}
              </el-tag>
              <span class="timeline-card__title">{{ item.eventTitle || '历史事件' }}</span>
              <span class="timeline-card__operator">由 {{ item.operator || '系统' }} 记录</span>
            </div>
            <div class="timeline-card__content">
              <template v-if="item.eventType === 'studentLog'">
                <p>变更字段：{{ item.changeFieldLabel || item.changeField || '-' }}</p>
                <p>变更前：{{ item.previousLabel || item.previousValue || '-' }}</p>
                <p>变更后：{{ item.currentLabel || item.currentValue || '-' }}</p>
              </template>
              <template v-else-if="item.eventType === 'statusLog'">
                <p>调整前：{{ item.previousLabel || item.previousValue || '-' }}</p>
                <p>调整后：{{ item.currentLabel || item.currentValue || '-' }}</p>
                <p v-if="item.remark">原因：{{ item.remark }}</p>
              </template>
              <template v-else>
                <p>参与人员：{{ item.participants || '-' }}</p>
                <p>记录人：{{ item.operator || '-' }}</p>
                <p>约谈地点：{{ item.locationLabel || item.location || '-' }}</p>
                <p>记录内容：{{ item.content || '-' }}</p>
              </template>
            </div>
            <div v-if="item.attachments && item.attachments.length" class="timeline-card__attachments">
              <div class="attachment-item" v-for="file in item.attachments" :key="file.url">
                <el-icon class="attachment-icon">
                  <Paperclip />
                </el-icon>
                <span class="attachment-name">{{ file.name || extractFileName(file.url) }}</span>
                <div class="attachment-actions">
                <el-button link type="primary" size="small" @click="previewAttachment(file)">预览</el-button>
                  <el-button link type="primary" size="small" @click="downloadAttachment(file)">下载</el-button>
                </div>
              </div>
            </div>
          </div>
        </el-timeline-item>
      </el-timeline>
      <el-empty v-else description="暂无历史记录" />
    </div>
    <template #footer>
      <el-button @click="visible = false">关 闭</el-button>
    </template>
  </el-dialog>

  <el-dialog
    v-model="previewVisible"
    :title="previewFile?.name || '附件预览'"
    width="70%"
    append-to-body
    class="preview-dialog"
  >
    <div class="preview-content">
      <img v-if="isImage(previewFile)" :src="getPreviewUrl(previewFile)" alt="图片预览" class="preview-image" />
      <iframe
        v-else-if="isPdf(previewFile)"
        :src="getPreviewUrl(previewFile)"
        class="preview-iframe"
        frameborder="0"
      ></iframe>
      <video v-else-if="isVideo(previewFile)" :src="getPreviewUrl(previewFile)" controls class="preview-media"></video>
      <audio v-else-if="isAudio(previewFile)" :src="getPreviewUrl(previewFile)" controls class="preview-audio"></audio>
      <el-empty v-else description="暂不支持预览，请下载后查看" />
    </div>
    <template #footer>
      <el-button @click="previewVisible = false">关 闭</el-button>
      <el-button type="primary" @click="downloadAttachment(previewFile)">下载</el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, computed, getCurrentInstance } from "vue";
import { Paperclip } from "@element-plus/icons-vue";
import { getStudentTimeline } from "@/api/dmw/student";

const { proxy } = getCurrentInstance();

const visible = ref(false);
const loading = ref(false);
const timeline = ref([]);
const studentName = ref("");
const previewVisible = ref(false);
const previewFile = ref(null);

const dialogTitle = computed(() => `历史轨迹 - ${studentName.value || ""}`);

const eventColors = {
  studentLog: "#409EFF",
  statusLog: "#E6A23C",
  interview: "#67C23A"
};

const tagTypes = {
  studentLog: "info",
  statusLog: "warning",
  interview: "success"
};

const eventLabels = {
  studentLog: "资料变更",
  statusLog: "状态调整",
  interview: "约谈记录"
};

function eventColor(type) {
  return eventColors[type] || "#909399";
}

function eventTagType(type) {
  return tagTypes[type] || "info";
}

function eventTypeLabel(type) {
  return eventLabels[type] || "系统事件";
}

function formatTime(time) {
  if (!time) {
    return "时间未知";
  }
  return proxy?.parseTime ? proxy.parseTime(time, "{y}-{m}-{d} {h}:{i}") : time;
}

function open(studentId, name) {
  if (!studentId) {
    return;
  }
  studentName.value = name || "";
  visible.value = true;
  loading.value = true;
  timeline.value = [];
  getStudentTimeline(studentId)
    .then(res => {
      const list = Array.isArray(res.data) ? res.data : [];
      timeline.value = list.map(event => ({
        ...event,
        attachments: normalizeEventAttachments(event.attachments, event.attachmentUrl)
      }));
    })
    .finally(() => {
      loading.value = false;
    });
}

defineExpose({ open });

function previewAttachment(file) {
  const previewUrl = resolvePreviewUrl(file);
  if (!previewUrl) {
    proxy?.$modal?.msgError?.("该附件无法预览");
    return;
  }
  if (isInlinePreviewable(file)) {
    previewFile.value = file;
    previewVisible.value = true;
    return;
  }
  window.open(previewUrl, "_blank");
}

function downloadAttachment(file) {
  if (!file?.url) {
    return;
  }
  const link = document.createElement("a");
  link.href = file.url;
  link.download = file.name || extractFileName(file.url);
  link.target = "_blank";
  link.click();
}

function extractFileName(url = "") {
  if (!url) return "";
  const segments = url.split("/");
  return segments[segments.length - 1] || url;
}

function normalizeEventAttachments(existing, attachmentUrl) {
  if (Array.isArray(existing) && existing.length) {
    return existing;
  }
  if (typeof attachmentUrl === "string" && attachmentUrl.trim()) {
    try {
      const parsed = JSON.parse(attachmentUrl);
      if (Array.isArray(parsed)) {
        return parsed.map(item => ({
          name: item.name || extractFileName(item.url),
          url: item.url,
          previewUrl: item.previewUrl || item.url,
          type: item.type,
          size: item.size
        })).filter(file => file.url);
      }
    } catch (error) {
      console.warn("解析附件 JSON 失败", error);
    }
  }
  return [];
}

function resolvePreviewUrl(file) {
  if (!file) {
    return "";
  }
  return file.previewUrl || file.url || "";
}

function getExtByUrl(url) {
  if (!url) {
    return "";
  }
  const idx = url.lastIndexOf(".");
  return idx > -1 ? url.substring(idx + 1).toLowerCase() : "";
}

function isImage(file) {
  const ext = getExtByUrl(resolvePreviewUrl(file));
  return ["jpg", "jpeg", "png", "gif", "bmp", "webp"].includes(ext);
}

function isPdf(file) {
  return getExtByUrl(resolvePreviewUrl(file)) === "pdf";
}

function isVideo(file) {
  const ext = getExtByUrl(resolvePreviewUrl(file));
  return ["mp4", "mov", "avi", "mkv", "webm"].includes(ext);
}

function isAudio(file) {
  const ext = getExtByUrl(resolvePreviewUrl(file));
  return ["mp3", "wav", "aac", "m4a"].includes(ext);
}

function getPreviewUrl(file) {
  return resolvePreviewUrl(file);
}

function isInlinePreviewable(file) {
  return isImage(file);
}
</script>

<style scoped>
.timeline-body {
  max-height: 520px;
  overflow-y: auto;
  padding-right: 4px;
}

.timeline-card {
  background-color: #f8fafc;
  border-radius: 8px;
  padding: 12px 16px;
  border: 1px solid #e4e7ed;
}

.timeline-card__header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 10px;
  font-size: 14px;
  color: #606266;
}

.timeline-card__title {
  font-weight: 600;
  color: #303133;
}

.timeline-card__operator {
  margin-left: auto;
  font-size: 12px;
  color: #909399;
}

.timeline-card__content p {
  margin: 4px 0;
  color: #606266;
  line-height: 20px;
}

.timeline-card__attachments {
  margin-top: 10px;
  border-top: 1px dashed #ebeef5;
  padding-top: 10px;
}

.attachment-item {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 13px;
  color: #606266;
  margin-bottom: 4px;
}

.attachment-icon {
  color: #909399;
}

.attachment-name {
  flex: 1;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.attachment-actions {
  display: flex;
  gap: 6px;
}

.preview-content {
  min-height: 360px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.preview-image,
.preview-media,
.preview-iframe {
  width: 100%;
  max-height: 520px;
}

.preview-audio {
  width: 100%;
}
</style>
