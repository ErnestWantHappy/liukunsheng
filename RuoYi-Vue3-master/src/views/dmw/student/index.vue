<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="24" :xs="24">
        <!-- 搜索区域 -->
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="88px">
          <template v-if="!isHeadTeacher">
            <el-form-item label="学部" prop="deptType">
              <el-select v-model="queryParams.deptType" placeholder="请选择学部" clearable style="width: 160px">
                <el-option v-for="dict in dmw_dept_type" :key="dict.value" :label="dict.label" :value="dict.value"/>
              </el-select>
            </el-form-item>
            <el-form-item label="年级" prop="gradeId">
              <el-select v-model="queryParams.gradeId" placeholder="请选择年级" clearable style="width: 160px">
                <el-option v-for="item in gradeOptions" :key="item.value" :label="item.label" :value="item.value"/>
              </el-select>
            </el-form-item>
            <el-form-item label="班级" prop="classId">
              <el-select v-model="queryParams.classId" placeholder="请选择班级" clearable style="width: 160px">
                <el-option v-for="item in classOptions" :key="item.value" :label="item.label" :value="item.value"/>
              </el-select>
            </el-form-item>
          </template>
          <el-form-item label="学生姓名" prop="studentName">
            <el-input v-model="queryParams.studentName" placeholder="请输入姓名" clearable style="width: 160px" @keyup.enter="handleQuery"/>
          </el-form-item>
          <el-form-item label="困难类型" prop="hardshipType">
            <el-select v-model="queryParams.hardshipType" placeholder="请选择类型" clearable style="width: 160px">
              <el-option v-for="dict in dmw_hardship_type" :key="dict.value" :label="dict.label" :value="dict.value"/>
            </el-select>
          </el-form-item>
           <el-form-item label="学生状态" prop="studentStatus">
            <el-select v-model="queryParams.studentStatus" placeholder="请选择状态" clearable style="width: 160px">
              <el-option v-for="dict in dmw_student_status" :key="dict.value" :label="dict.label" :value="dict.value"/>
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
            <el-button icon="Refresh" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <!-- 按钮工具栏 -->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['dmw:student:add']">新增</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="info" plain icon="Upload" @click="handleImport" v-hasPermi="['dmw:student:import']">导入</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['dmw:student:export']">导出</el-button>
          </el-col>
          <!-- 【新增】全员升级按钮，仅管理员可见 -->
      <el-col :span="1.5" v-if="!isHeadTeacher">
         <el-button
          type="danger"
          plain
          icon="Promotion"
          @click="handleUpgradeAll"
          v-hasPermi="['dmw:student:edit']"
        >全员升级</el-button>
      </el-col>
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <!-- 数据表格 -->
        <el-table v-loading="loading" :data="studentList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center" />
          <el-table-column label="姓名" align="center" prop="studentName" />
          <el-table-column label="班级" align="center">
             <template #default="scope"><span>{{ scope.row.gradeId }}年级 {{ scope.row.classId }}班</span></template>
          </el-table-column>
          <el-table-column label="六困生类型" align="center" prop="hardshipType">
            <template #default="scope"><dict-tag :options="dmw_hardship_type" :value="scope.row.hardshipType" /></template>
          </el-table-column>
          <el-table-column label="当前状态" align="center" prop="studentStatus">
            <template #default="scope"><dict-tag :options="dmw_student_status" :value="scope.row.studentStatus" /></template>
          </el-table-column>
          <el-table-column label="状态原因" align="center" prop="currentStatusReason" show-overflow-tooltip />
          <el-table-column label="记录人员" align="center" prop="createBy" />
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="320">
            <template #default="scope">
              <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['dmw:student:edit']">修改</el-button>
              <el-button link type="primary" icon="ChatDotRound" @click="handleInterviewAdd(scope.row)" >新增约谈</el-button>
              <el-button link type="primary" icon="Download" @click="handleDownload(scope.row)">下载</el-button>
              <el-dropdown>
                <el-button link type="primary" icon="MoreFilled">更多</el-button>
                <template #dropdown>
                  <el-dropdown-menu>
                    <template v-if="scope.row.studentStatus === '01'">
                      <el-dropdown-item @click="handleStatusChange(scope.row, '02')">转请长假</el-dropdown-item>
                      <el-dropdown-item @click="handleStatusChange(scope.row, '03')">转休学</el-dropdown-item>
                    </template>
                    <template v-else-if="scope.row.studentStatus === '02' || scope.row.studentStatus === '03'">
                       <el-dropdown-item @click="handleStatusChange(scope.row, '01')">恢复在读</el-dropdown-item>
                    </template>
                    <el-dropdown-item @click="handleDelete(scope.row)" v-hasPermi="['dmw:student:remove']" divided>删除</el-dropdown-item>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </template>
          </el-table-column>
        </el-table>
        
        <pagination v-show="total>0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList"/>
      </el-col>
    </el-row>

    <!-- 添加或修改学生信息对话框 (内容与上一版相同，此处为简洁省略) -->
    <!-- 添加或修改学生信息对话框 -->
    <el-dialog :title="title" v-model="open" width="960px" append-to-body>
      <el-form ref="studentRef" :model="form" :rules="rules" label-width="120px">
        <el-divider content-position="center">基本信息</el-divider>

        <!-- 班主任智能表单 -->
        <div v-if="isHeadTeacher">
          <el-row>
            <el-col :span="12">
              <el-form-item label="所属班级" prop="classId">
                 <el-select v-model="teacherClassSelection" placeholder="请选择要添加学生的班级" @change="handleTeacherClassChange" style="width:100%">
                    <el-option
                      v-for="item in teacherClasses"
                      :key="item.id"
                      :label="`${item.gradeId}年级 ${item.classId}班`"
                      :value="item.id"
                    />
                 </el-select>
              </el-form-item>
            </el-col>
            <!-- 【新增】显示自动判断的学部 -->
            <el-col :span="12">
              <el-form-item label="学部" prop="deptType">
                <el-input :value="getDeptTypeName(form.deptType)" disabled />
              </el-form-item>
            </el-col>
          </el-row>
        </div>

        <!-- 管理员表单 -->
        <div v-else>
          <el-row>
            <el-col :span="12">
              <el-form-item label="学部" prop="deptType">
                <el-select v-model="form.deptType" placeholder="请选择学部">
                  <el-option
                    v-for="dict in dmw_dept_type"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="年级" prop="gradeId">
                <el-select v-model="form.gradeId" placeholder="请选择年级" style="width:100%">
                  <el-option
                    v-for="item in gradeOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="班级" prop="classId">
                <el-select v-model="form.classId" placeholder="请选择班级" style="width:100%">
                  <el-option
                    v-for="item in classOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </div>

        <el-row>
          <el-col :span="12">
            <el-form-item label="学生姓名" prop="studentName">
              <el-input v-model="form.studentName" placeholder="请输入学生姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCardNo">
              <el-input v-model="form.idCardNo" placeholder="请输入身份证号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
           <el-col :span="12">
             <el-form-item label="性别" prop="gender">
              <el-radio-group v-model="form.gender">
                <el-radio
                  v-for="dict in sys_user_sex"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否独生" prop="isOnlyChild">
              <el-radio-group v-model="form.isOnlyChild">
                <el-radio
                  v-for="dict in dmw_yes_no"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="身体状况" prop="healthStatus">
              <el-radio-group v-model="form.healthStatus">
                <el-radio
                  v-for="dict in dmw_health_status"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="家庭地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入家庭地址" />
        </el-form-item>

        <el-divider content-position="center">家庭情况</el-divider>
        <el-row>
          <el-col :span="12">
            <el-form-item label="家庭结构" prop="familyStructure">
              <el-select v-model="form.familyStructure" placeholder="请选择家庭结构">
                <el-option
                  v-for="dict in dmw_family_structure"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="家庭氛围" prop="familyAtmosphere">
              <el-select v-model="form.familyAtmosphere" placeholder="请选择家庭氛围">
                <el-option
                  v-for="dict in dmw_family_atmosphere"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="经济情况" prop="economicStatus">
              <el-select v-model="form.economicStatus" placeholder="请选择经济情况">
                <el-option
                  v-for="dict in dmw_economic_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="寄养/留守经历" prop="fosterLeftBehind">
              <el-radio-group v-model="form.fosterLeftBehind">
                 <el-radio
                  v-for="dict in dmw_yes_no"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="父母职业" prop="parentOccupation">
          <el-input v-model="form.parentOccupation" placeholder="请输入父母职业" />
        </el-form-item>

        <el-divider content-position="center">困难情况</el-divider>
        <el-row>
          <el-col :span="12">
            <el-form-item label="六困生类型" prop="hardshipType">
              <el-select v-model="form.hardshipType" placeholder="请选择六困生类型">
                <el-option
                  v-for="dict in dmw_hardship_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="自伤自残史" prop="selfHarmHistory">
              <el-select v-model="form.selfHarmHistory" placeholder="请选择自伤自残史">
                <el-option
                  v-for="dict in dmw_self_harm_history"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="学生详细情况说明" prop="studentDetails">
          <el-input v-model="form.studentDetails" type="textarea" placeholder="如身体/心理/行为/学习等" />
        </el-form-item>
        <el-form-item label="应对措施" prop="countermeasures">
          <el-input v-model="form.countermeasures" type="textarea" placeholder="请输入应对措施" />
        </el-form-item>
        <el-form-item label="教师上报信息" prop="teacherReportInfo">
          <el-input v-model="form.teacherReportInfo" type="textarea" placeholder="时间地点人物事件" />
        </el-form-item>

      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel">取 消</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
        </div>
      </template>
    </el-dialog>
    <!-- 用户导入对话框 -->
     <el-dialog :title="upload.title" v-model="upload.open" width="400px" append-to-body>
      <el-upload
         ref="uploadRef"
         :limit="1"
         accept=".xlsx, .xls"
         :headers="upload.headers"
         :action="upload.url + '?updateSupport=' + upload.updateSupport"
         :disabled="upload.isUploading"
         :on-progress="handleFileUploadProgress"
         :on-success="handleFileSuccess"
         :auto-upload="false"
         drag
      >
         <el-icon class="el-icon--upload"><upload-filled /></el-icon>
         <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
         <template #tip>
            <div class="el-upload__tip text-center">
               <div class="el-upload__tip">
                  <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的用户数据
               </div>
               <span>仅允许导入xls、xlsx格式文件。</span>
               <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>
            </div>
         </template>
      </el-upload>
      <template #footer>
         <div class="dialog-footer">
            <el-button type="primary" @click="submitFileForm">确 定</el-button>
            <el-button @click="upload.open = false">取 消</el-button>
         </div>
      </template>
    </el-dialog>
    <!-- 其他弹窗 -->
    <InterviewForm ref="interviewFormRef" @ok="getList" />
    <StatusChangeDialog ref="statusChangeRef" @ok="getList" />
  </div>
</template>

<script setup name="Student">
import { h } from "vue"; // 【新增】直接从vue导入h函数
import { listStudent, getStudent, delStudent, addStudent, updateStudent, downloadProfile, changeStudentStatus, upgradeAllStudents } from "@/api/dmw/student";
import { getMyClasses } from "@/api/dmw/teach";
import { getToken } from "@/utils/auth";
import useUserStore from '@/store/modules/user';
import InterviewForm from "../interview/form.vue";
import StatusChangeDialog from "./StatusChangeDialog.vue";

const { proxy } = getCurrentInstance(); // 【修改】移除 proxy: { $h: h }
const userStore = useUserStore();

// 字典
const { 
  sys_user_sex, 
  dmw_hardship_type, 
  dmw_dept_type,
  dmw_yes_no,
  dmw_health_status,
  dmw_family_structure,
  dmw_family_atmosphere,
  dmw_economic_status,
  dmw_self_harm_history,
  dmw_student_status
} = proxy.useDict(
  "sys_user_sex", 
  "dmw_hardship_type", 
  "dmw_dept_type",
  "dmw_yes_no",
  "dmw_health_status",
  "dmw_family_structure",
  "dmw_family_atmosphere",
  "dmw_economic_status",
  "dmw_self_harm_history",
  "dmw_student_status"
);

// 响应式数据
const studentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const dateRange = ref([]);
const teacherClasses = ref([]); // 存放班主任的任教班级
const teacherClassSelection = ref(null); // 班主任选择的班级

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

// 计算属性，判断当前用户是否为班主任 (非admin)
const isHeadTeacher = computed(() => {
  return !userStore.roles.includes("admin");
});

/*** 用户导入参数 */
const upload = reactive({
  open: false,
  title: "",
  isUploading: false,
  updateSupport: 0,
  headers: { Authorization: "Bearer " + getToken() },
  url: import.meta.env.VITE_APP_BASE_API + "/dmw/student/importData"
});

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    studentName: null,
    hardshipType: null,
    deptType: null,
    gradeId: null,
    classId: null,
    gender: null,
    studentStatus: null
  },
  rules: {
    studentName: [ { required: true, message: "学生姓名不能为空", trigger: "blur" } ],
    idCardNo: [ { required: true, message: "身份证号不能为空", trigger: "blur" } ],
    deptType: [ { required: true, message: "学部不能为空", trigger: "change" } ],
    gradeId: [ { required: true, message: "年级不能为空", trigger: "change" } ],
    classId: [ { required: true, message: "班级不能为空", trigger: "change" } ],
    gender: [ { required: true, message: "性别不能为空", trigger: "change" } ],
    isOnlyChild: [ { required: true, message: "是否独生不能为空", trigger: "change" } ],
    healthStatus: [ { required: true, message: "身体状况不能为空", trigger: "change" } ],
    familyStructure: [ { required: true, message: "家庭结构不能为空", trigger: "change" } ],
    familyAtmosphere: [ { required: true, message: "家庭氛围不能为空", trigger: "change" } ],
    economicStatus: [ { required: true, message: "经济情况不能为空", trigger: "change" } ],
    fosterLeftBehind: [ { required: true, message: "寄养/留守经历不能为空", trigger: "change" } ],
    selfHarmHistory: [ { required: true, message: "自伤自残史不能为空", trigger: "change" } ],
    hardshipType: [ { required: true, message: "六困生类型不能为空", trigger: "change" } ],
  }
});
const { queryParams, form, rules } = toRefs(data);

/** 查询学生信息列表 */
function getList() {
  loading.value = true;
  proxy.addDateRange(queryParams.value, dateRange.value);
  listStudent(queryParams.value).then(response => {
    studentList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 获取当前登录教师的班级列表 */
function fetchTeacherClasses() {
  if (isHeadTeacher.value) {
    getMyClasses().then(response => {
      teacherClasses.value = response.data;
    });
  }
}

/** 班主任选择班级后的处理函数 */
function handleTeacherClassChange(selectedId) {
  const selectedClass = teacherClasses.value.find(c => c.id === selectedId);
  if (selectedClass) {
    form.value.gradeId = selectedClass.gradeId;
    form.value.classId = selectedClass.classId;
    form.value.deptType = selectedClass.gradeId <= 6 ? '1' : '2';
  }
}

/** 根据学部代码获取名称 */
function getDeptTypeName(deptType) {
  if (!deptType || !dmw_dept_type.value) return '';
  const dept = dmw_dept_type.value.find(d => d.value === deptType);
  return dept ? dept.label : '';
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    studentId: null,
    studentName: null,
    idCardNo: null,
    deptType: null,
    gradeId: null,
    classId: null,
    gender: "0",
    isOnlyChild: "N",
    healthStatus: null,
    address: null,
    familyStructure: null,
    familyAtmosphere: null,
    economicStatus: null,
    parentOccupation: null,
    fosterLeftBehind: "N",
    selfHarmHistory: null,
    hardshipType: null,
    studentDetails: null,
    countermeasures: null,
    teacherReportInfo: null,
  };
  teacherClassSelection.value = null;
  proxy.resetForm("studentRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  dateRange.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.studentId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  if (isHeadTeacher.value && teacherClasses.value.length === 1) {
      teacherClassSelection.value = teacherClasses.value[0].id;
      handleTeacherClassChange(teacherClassSelection.value);
  }
  open.value = true;
  title.value = "添加学生信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _studentId = row.studentId || ids.value[0];
  getStudent(_studentId).then(response => {
    form.value = response.data;
    if (isHeadTeacher.value) {
        const targetClass = teacherClasses.value.find(c => c.gradeId == form.value.gradeId && c.classId == form.value.classId);
        if(targetClass) {
            teacherClassSelection.value = targetClass.id;
        }
    }
    open.value = true;
    title.value = "修改学生信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["studentRef"].validate(valid => {
    if (valid) {
      if (form.value.studentId != null) {
        updateStudent(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addStudent(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _studentIds = row.studentId || ids.value;
  proxy.$modal.confirm('是否确认删除学生姓名为"' + row.studentName + '"的数据项？').then(function() {
    return delStudent(_studentIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download("dmw/student/export", {
    ...queryParams.value
  }, `student_${new Date().getTime()}.xlsx`);
}

/** 导入按钮操作 */
function handleImport() {
  upload.title = "学生数据导入";
  upload.open = true;
};
/** 下载模板操作 */
function importTemplate() {
  proxy.download("dmw/student/importTemplate", {
  }, `student_template_${new Date().getTime()}.xlsx`);
};
/**文件上传中处理 */
const handleFileUploadProgress = (event, file, fileList) => {
  upload.isUploading = true;
};
/** 文件上传成功处理 */
const handleFileSuccess = (response, file, fileList) => {
  upload.open = false;
  upload.isUploading = false;
  proxy.$refs["uploadRef"].handleRemove(file);
  proxy.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
  getList();
};
/** 提交上传文件 */
function submitFileForm() {
  proxy.$refs["uploadRef"].submit();
};

/** 新增约谈按钮操作 */
const interviewFormRef = ref(null);
function handleInterviewAdd(row) {
    interviewFormRef.value.open(null, row.studentId, row.studentName);
}

/** 下载按钮操作 */
function handleDownload(row) {
    proxy.download('/dmw/student/downloadProfile/' + row.studentId, {}, `学生档案_${row.studentName}.zip`, { method: 'post' })
}

const statusChangeRef = ref(null);
/** 状态变更按钮操作 */
function handleStatusChange(row, targetStatus) {
  statusChangeRef.value.open(row, targetStatus);
}

/** 全员升级按钮操作 */
function handleUpgradeAll() {
  let confirmInput = '';
  proxy.$msgbox({
    title: '高危操作确认',
    message: h('div', null, [
      h('p', null, '您确定要执行全员升级吗？'),
      h('p', { style: 'color: red; font-weight: bold;' }, '此操作不可逆，将影响所有"正常在读"学生！'),
      h('p', null, '毕业班学生将归档，其他学生将升入下一年级。'),
      h('p', { style: 'margin-top: 15px;' }, '请输入 "确认升级" 以继续操作：'),
      h('input', {
        style: 'margin-top: 5px; border: 1px solid #dcdfe6; border-radius: 4px; padding: 5px 10px; width: 95%;',
        onInput: (e) => {
          confirmInput = e.target.value;
        }
      })
    ]),
    showCancelButton: true,
    confirmButtonText: '执行升级',
    cancelButtonText: '取消',
    beforeClose: (action, instance, done) => {
      if (action === 'confirm') {
        if (confirmInput === '确认升级') {
          instance.confirmButtonLoading = true;
          instance.confirmButtonText = '升级中...';
          upgradeAllStudents().then((res) => {
            // 【核心修正】明确使用 res.data 来构造提示信息
            const successMsg = typeof res.data === 'number' ? `${res.data}名学生已成功升级/归档` : '操作成功';
            proxy.$modal.msgSuccess(successMsg);
            getList();
            done();
          }).catch(() => {
             done();
          }).finally(() => {
            instance.confirmButtonLoading = false;
            instance.confirmButtonText = '执行升级';
          });
        } else {
          proxy.$modal.msgError("输入内容不正确，操作已取消");
          done();
        }
      } else {
        done();
      }
    }
  }).catch(() => {});
}

// 初始化
getList();
fetchTeacherClasses();
</script>

