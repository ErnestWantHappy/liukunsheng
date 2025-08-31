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
          :limit="1"
          :on-exceed="handleExceed"
          accept=".zip,.rar,.7z"
        >
          <el-button size="small" type="primary">点击上传</el-button>
          <template #tip>
            <div class="el-upload__tip">
              只能上传一个压缩包文件（.zip/.rar/.7z），且大小不超过 50MB。
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

const open = ref(false);
const title = ref("");
const fileList = ref([]);

// 文件上传相关
const upload = reactive({
  headers: { Authorization: "Bearer " + getToken() },
  url: import.meta.env.VITE_APP_BASE_API + "/common/upload",
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
  fileList.value = [];
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
      if (response.data.attachmentUrl) {
        // 假设附件名就是URL路径的一部分
        const fileName = response.data.attachmentUrl.substring(response.data.attachmentUrl.lastIndexOf('/') + 1);
        fileList.value.push({ name: fileName, url: response.data.attachmentUrl });
      }
    });
  } else {
    title.value = "新增约谈记录";
  }
  open.value = true;
}
defineExpose({
  open: openDialog
});

// 文件上传成功处理
function handleUploadSuccess(response, file, fileList) {
  if (response.code === 200) {
    form.value.attachmentUrl = response.url; // 保存完整的URL
    proxy.$modal.msgSuccess("上传成功");
  } else {
    proxy.$modal.msgError(response.msg);
    // 上传失败时，清空文件列表
    proxy.$refs.uploadRef.clearFiles();
  }
}

// 文件移除处理
function handleRemove(file, fileList) {
  form.value.attachmentUrl = null;
}

// 上传前校验
function beforeUpload(file) {
  const isCompressed = /\.(zip|rar|7z)$/i.test(file.name);
  const isLt50M = file.size / 1024 / 1024 < 50;

  if (!isCompressed) {
    proxy.$modal.msgError('上传附件只能是 .zip, .rar, .7z 格式!');
  }
  if (!isLt50M) {
    proxy.$modal.msgError('上传附件大小不能超过 50MB!');
  }
  return isCompressed && isLt50M;
}

// 文件超出个数限制时的钩子
function handleExceed(files, fileList) {
  proxy.$modal.msgWarning(
    `当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`
  );
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["interviewRef"].validate(valid => {
    if (valid) {
      if (form.value.interviewId != null) {
        updateInterview(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          emit('ok');
        });
      } else {
        addInterview(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          emit('ok');
        });
      }
    }
  });
}
</script>
