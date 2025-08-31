<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="学生姓名" prop="studentName">
        <el-input
          v-model="queryParams.studentName"
          placeholder="请输入关联学生姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['dmw:interview:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['dmw:interview:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['dmw:interview:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="interviewList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学生姓名" align="center" prop="studentName" />
      <el-table-column label="约谈时间" align="center" prop="interviewTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.interviewTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="约谈地点" align="center" prop="location">
        <template #default="scope">
          <dict-tag :options="dmw_interview_location" :value="scope.row.location"/>
        </template>
      </el-table-column>
      <el-table-column label="参与人员" align="center" prop="participants" />
      <el-table-column label="记录人" align="center" prop="recorder" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['dmw:interview:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['dmw:interview:remove']">删除</el-button>
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

    <!-- 使用独立的表单组件 -->
    <InterviewForm ref="formRef" @ok="getList" />
  </div>
</template>

<script setup name="Interview">
import { listInterview, delInterview } from "@/api/dmw/interview";
import InterviewForm from "./form.vue"; // 导入表单组件

const { proxy } = getCurrentInstance();
const { dmw_interview_location } = proxy.useDict("dmw_interview_location");

const interviewList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);

const formRef = ref(null); // 创建对表单组件的引用

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    studentName: null, // 修改为按姓名搜索
  }
});

const { queryParams } = toRefs(data);

/** 查询约谈记录列表 */
function getList() {
  loading.value = true;
  listInterview(queryParams.value).then(response => {
    interviewList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.interviewId)
  single.value = selection.length!==1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  // 新增时，学生ID和姓名都是null
  proxy.$refs.formRef.open(null, null, '请先在学生列表选择学生并新增约谈');
}

/** 修改按钮操作 */
function handleUpdate(row) {
  const interviewId = row.interviewId || ids.value[0]
  proxy.$refs.formRef.open(interviewId, row.studentId, row.studentName);
}

/** 删除按钮操作 */
function handleDelete(row) {
  const interviewIds = row.interviewId || ids.value;
  proxy.$modal.confirm('是否确认删除约谈记录编号为"' + interviewIds + '"的数据项？').then(function() {
    return delInterview(interviewIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

getList();
</script>
