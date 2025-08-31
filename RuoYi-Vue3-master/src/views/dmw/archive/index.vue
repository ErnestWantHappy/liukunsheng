<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生姓名" prop="studentName">
        <el-input
          v-model="queryParams.studentName"
          placeholder="请输入学生姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="studentList">
      <el-table-column label="姓名" align="center" prop="studentName" />
      <el-table-column label="性别" align="center" prop="gender">
        <template #default="scope">
          <dict-tag :options="sys_user_sex" :value="scope.row.gender" />
        </template>
      </el-table-column>
      <el-table-column label="原班级" align="center">
         <template #default="scope">
            <span>{{ scope.row.gradeId }}年级 {{ scope.row.classId }}班</span>
         </template>
      </el-table-column>
      <el-table-column label="归档状态" align="center" prop="studentStatus">
        <template #default="scope">
          <dict-tag :options="dmw_student_status" :value="scope.row.studentStatus" />
        </template>
      </el-table-column>
       <el-table-column label="归档时间" align="center" prop="updateTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="RefreshLeft" @click="handleRestore(scope.row)" v-hasPermi="['dmw:student:edit']">恢复</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 恢复学生对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="学生姓名">
          <el-input :value="form.studentName" disabled />
        </el-form-item>
        <el-form-item label="恢复到年级" prop="gradeId">
          <el-select v-model="form.gradeId" placeholder="请选择年级">
            <el-option
              v-for="item in gradeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="恢复到班级" prop="classId">
          <el-select v-model="form.classId" placeholder="请选择班级">
            <el-option
              v-for="item in classOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel">取 消</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Archive">
import { listArchivedStudent, restoreStudent } from "@/api/dmw/student";

const { proxy } = getCurrentInstance();
const { sys_user_sex, dmw_student_status } = proxy.useDict("sys_user_sex", "dmw_student_status");

const studentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const title = ref("");

// 年级和班级选项
const gradeOptions = ref(
  Array.from({ length: 9 }, (_, i) => {
    const grade = i + 1;
    const gradeMap = ['一', '二', '三', '四', '五', '六', '七', '八', '九'];
    return { value: grade, label: `${gradeMap[i]}年级` };
  })
);
const classOptions = ref(
  Array.from({ length: 12 }, (_, i) => ({
    value: i + 1,
    label: `${i + 1}班`,
  }))
);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    studentName: null,
  },
  rules: {
    gradeId: [{ required: true, message: "恢复年级不能为空", trigger: "change" }],
    classId: [{ required: true, message: "恢复班级不能为空", trigger: "change" }],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询列表 */
function getList() {
  loading.value = true;
  listArchivedStudent(queryParams.value).then(response => {
    studentList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

function cancel() {
  open.value = false;
  reset();
}

function reset() {
  form.value = {
    studentId: null,
    studentName: null,
    gradeId: null,
    classId: null,
  };
  proxy.resetForm("formRef");
}

function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

/** 恢复按钮操作 */
function handleRestore(row) {
  reset();
  form.value.studentId = row.studentId;
  form.value.studentName = row.studentName;
  open.value = true;
  title.value = "恢复学生档案";
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["formRef"].validate(valid => {
    if (valid) {
      restoreStudent(form.value).then(response => {
        proxy.$modal.msgSuccess("恢复成功");
        open.value = false;
        getList();
      });
    }
  });
}

getList();
</script>
