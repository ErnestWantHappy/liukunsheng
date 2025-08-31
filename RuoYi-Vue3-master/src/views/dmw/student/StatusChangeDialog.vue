<template>
  <el-dialog :title="title" v-model="open" width="600px" append-to-body>
    <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
      <el-form-item label="学生姓名">
        <el-input :value="form.studentName" disabled />
      </el-form-item>
      <el-form-item label="变更后状态">
        <el-input :value="targetStatusName" disabled />
      </el-form-item>
      <el-form-item v-if="isResuming" label="返校日期" prop="startDate">
        <el-date-picker
          v-model="form.startDate"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择返校日期"
          style="width: 100%;"
        ></el-date-picker>
      </el-form-item>
      <template v-else>
        <el-form-item label="开始日期" prop="startDate">
          <el-date-picker
            v-model="form.startDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择开始日期"
            style="width: 100%;"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="预计结束日期" prop="endDate">
          <el-date-picker
            v-model="form.endDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="选填"
            style="width: 100%;"
          ></el-date-picker>
        </el-form-item>
      </template>
      <el-form-item label="原因/备注" prop="reason">
        <el-input v-model="form.reason" type="textarea" :placeholder="isResuming ? '请输入备注' : '请输入原因'"></el-input>
      </el-form-item>
      <!-- 附件功能可后续添加 -->
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup>
import { changeStudentStatus } from "@/api/dmw/student";

const { proxy } = getCurrentInstance();
const emit = defineEmits(['ok']);

const { dmw_student_status } = proxy.useDict("dmw_student_status");

const open = ref(false);
const title = ref("");
const targetStatusName = ref("");
const isResuming = ref(false); // 是否是恢复正常状态的操作

const data = reactive({
  form: {},
  rules: {
    startDate: [{ required: true, message: "日期不能为空", trigger: "blur" }],
    reason: [{ required: true, message: "原因/备注不能为空", trigger: "blur" }],
  }
});
const { form, rules } = toRefs(data);

function reset() {
  form.value = {
    studentId: null,
    studentName: null,
    currentStatus: null,
    reason: null,
    startDate: null,
    endDate: null,
  };
  proxy.resetForm("formRef");
}

function cancel() {
  open.value = false;
  reset();
}

function openDialog(student, targetStatus) {
  reset();
  form.value.studentId = student.studentId;
  form.value.studentName = student.studentName;
  form.value.currentStatus = targetStatus;

  const statusDict = dmw_student_status.value.find(d => d.value === targetStatus);
  targetStatusName.value = statusDict ? statusDict.label : '';
  
  isResuming.value = targetStatus === '01'; // "01" 是正常状态
  title.value = isResuming.value ? "恢复在读状态" : `变更为'${targetStatusName.value}'`;

  open.value = true;
}
defineExpose({ open: openDialog });

function submitForm() {
  proxy.$refs["formRef"].validate(valid => {
    if (valid) {
      changeStudentStatus(form.value).then(() => {
        proxy.$modal.msgSuccess("操作成功");
        open.value = false;
        emit('ok');
      });
    }
  });
}
</script>
