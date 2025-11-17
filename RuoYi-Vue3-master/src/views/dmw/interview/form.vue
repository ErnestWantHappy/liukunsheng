<template>
  <!-- 添加或修改约谈记录对话框 -->
  <el-dialog :title="title" v-model="open" width="700px" append-to-body>
    <el-form ref="interviewRef" :model="form" :rules="rules" label-width="100px">
      <el-form-item label="关联学生">
        <el-input :value="form.studentName" disabled />
      </el-form-item>
      <el-form-item label="约谈时间" prop="interviewTime">
        <el-date-picker
          clearable
          v-model="form.interviewTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择约谈时间"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="约谈地点" prop="location">
        <el-select v-model="form.location" placeholder="请选择约谈地点">
          <el-option
            v-for="dict in dmw_interview_location"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="参与人员" prop="participants">
        <el-input v-model="form.participants" placeholder="请输入参与人员" />
      </el-form-item>
      <el-form-item label="记录人" prop="recorder">
        <el-input v-model="form.recorder" placeholder="请输入记录人" />
      </el-form-item>
      <el-form-item label="记录内容" prop="content">
        <el-input v-model="form.content" type="textarea" placeholder="请输入内容" />
      </el-form-item>
      <el-form-item label="记录附件">
        <el-upload
          ref="uploadRef"
          :action="upload.url"
          :headers="upload.headers"
          :on-success="handleUploadSuccess"
          :on-remove="handleRemove"
          :before-upload="beforeUpload"
          :file-list="fileList"
          :limit="uploadLimit"
          :on-exceed="handleExceed"
          multiple="true"
          accept=".doc,.docx,.pdf,.jpg,.jpeg,.png,.mp4,.mp3,.zip,.rar,.7z"
        >
          <el-button size="small" type="primary">上传附件</el-button>
          <template #tip>
            <div class="el-upload__tip">
              支持 doc/docx/pdf/jpg/png/mp4/mp3/zip 等格式，单个文件不超过 50MB，最多 10 个。
            </div>
          </template>
        </el-upload>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup>
import { getInterview, addInterview, updateInterview } from "@/api/dmw/interview";
import { getToken } from "@/utils/auth";

const { proxy } = getCurrentInstance();
const emit = defineEmits(['ok']);

const { dmw_interview_location } = proxy.useDict("dmw_interview_location");

const MAX_FILE_COUNT = 10;
const MAX_FILE_SIZE_MB = 50;
const ALLOWED_EXTENSIONS = ['doc', 'docx', 'pdf', 'jpg', 'jpeg', 'png', 'mp4', 'mp3', 'zip', 'rar', '7z'];

const open = ref(false);
const title = ref("");
const uploadRef = ref(null);
const fileList = ref([]);
const attachments = ref([]);
const uploadLimit = MAX_FILE_COUNT;

const upload = reactive({
  headers: { Authorization: "Bearer " + getToken() },
  url: import.meta.env.VITE_APP_BASE_API + "/common/upload"
});

const data = reactive({
  form: {},
  rules: {
    interviewTime: [
      { required: true, message: "约谈时间不能为空", trigger: "blur" }
    ],
    location: [
      { required: true, message: "约谈地点不能为空", trigger: "change" }
    ],
  }
});

const { form, rules } = toRefs(data);

function syncAttachmentField() {
  form.value.attachmentUrl = attachments.value.length ? JSON.stringify(attachments.value) : null;
}

function updateFileListFromAttachments() {
  fileList.value = attachments.value.map(item => ({
    uid: item.uid,
    name: item.name || extractFileName(item.url),
    url: item.url,
    status: 'success'
  }));
}

function extractFileName(path = "") {
  if (!path) return "";
  const segments = path.split("/");
  return segments[segments.length - 1] || path;
}

function getFileExtension(name = "") {
  if (!name) return "";
  const idx = name.lastIndexOf(".");
  return idx > -1 ? name.substring(idx + 1).toLowerCase() : "";
}

function normalizeAttachment(item) {
  if (!item || !item.url) {
    return null;
  }
  const name = item.name || extractFileName(item.url);
  const uid = item.uid || `${Date.now()}_${Math.random()}`;
  return {
    uid,
    name,
    url: item.url,
    previewUrl: item.previewUrl || item.url,
    type: item.type || getFileExtension(name),
    size: item.size || 0
  };
}

function parseAttachmentValue(raw) {
  if (!raw) {
    return [];
  }
  try {
    const parsed = JSON.parse(raw);
    if (Array.isArray(parsed)) {
      return parsed
        .map(normalizeAttachment)
        .filter(Boolean);
    }
  } catch (e) {
    // ignore json parse error and fallback
  }
  const fallback = normalizeAttachment({ url: raw });
  return fallback ? [fallback] : [];
}

function handleUploadSuccess(response, file) {
  if (response.code !== 200) {
    proxy.$modal.msgError(response.msg || "上传失败");
    return;
  }
  const meta = normalizeAttachment({
    uid: file.uid,
    name: response.originalFilename || response.newFileName || file.name,
    url: response.url,
    previewUrl: response.previewUrl || response.url,
    type: getFileExtension(file.name),
    size: file.size
  });
  if (meta) {
    attachments.value.push(meta);
    syncAttachmentField();
    proxy.$modal.msgSuccess("上传成功");
  }
}

/** 表单重置 */
function reset() {
  form.value = {
    interviewId: null,
    studentId: null,
    studentName: null,
    interviewTime: null,
    location: null,
    participants: null,
    recorder: null,
    content: null,
    attachmentUrl: null,
  };
  attachments.value = [];
  updateFileListFromAttachments();
  if (uploadRef.value) {
    uploadRef.value.clearFiles();
  }
  proxy.resetForm("interviewRef");
}

/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}

/** 暴露 open 方法 */
function openDialog(id, studentId, studentName) {
  reset();
  form.value.studentId = studentId;
  form.value.studentName = studentName;
  if (id) {
    title.value = "修改约谈记录";
    getInterview(id).then(response => {
      form.value = response.data;
      form.value.studentName = studentName;
      attachments.value = parseAttachmentValue(response.data.attachmentUrl);
      updateFileListFromAttachments();
      syncAttachmentField();
    });
  } else {
    title.value = "新增约谈记录";
  }
  open.value = true;
}
defineExpose({
  open: openDialog
});

// 文件移除处理
function handleRemove(file) {
  attachments.value = attachments.value.filter(item => item.uid !== file.uid);
  syncAttachmentField();
}

// 上传前校验
function beforeUpload(file) {
  const ext = getFileExtension(file.name);
  if (!ALLOWED_EXTENSIONS.includes(ext)) {
    proxy.$modal.msgError('文件格式不支持，请上传 doc/ppt/pdf/jpg/png/mp4/mp3/zip 等类型。');
    return false;
  }
  const isLtSize = file.size / 1024 / 1024 < MAX_FILE_SIZE_MB;
  if (!isLtSize) {
    proxy.$modal.msgError(`单个文件不能超过 ${MAX_FILE_SIZE_MB}MB!`);
    return false;
  }
  if (attachments.value.length >= uploadLimit) {
    proxy.$modal.msgWarning(`最多只能上传 ${uploadLimit} 个附件`);
    return false;
  }
  return true;
}

// 文件超出个数限制时的钩子
function handleExceed(files, fileList) {
  proxy.$modal.msgWarning(
    `最多只能上传 ${uploadLimit} 个附件，本次共选择了 ${files.length + fileList.length} 个文件`
  );
}

/** 提交按钮 */
function submitForm() {
  syncAttachmentField();
  proxy.$refs["interviewRef"].validate(valid => {
    if (valid) {
      if (form.value.interviewId != null) {
        updateInterview(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          emit('ok');
        });
      } else {
        addInterview(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          emit('ok');
        });
      }
    }
  });
}
</script>
