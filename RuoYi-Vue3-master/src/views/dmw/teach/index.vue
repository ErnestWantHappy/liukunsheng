    <template>
      <div class="app-container">
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
          <el-form-item label="教师" prop="userId">
            <el-select v-model="queryParams.userId" filterable placeholder="请选择教师" clearable>
              <el-option
                v-for="item in userList"
                :key="item.userId"
                :label="item.nickName"
                :value="item.userId"
              />
            </el-select>
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
              v-hasPermi="['dmw:teach:add']"
            >新增</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              icon="Delete"
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['dmw:teach:remove']"
            >删除</el-button>
          </el-col>
        </el-row>

        <el-table v-loading="loading" :data="teachList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center" />
          <el-table-column label="教师" align="center" prop="user.nickName" />
          <el-table-column label="年级" align="center" prop="gradeId">
            <template #default="scope">
              <span>{{ gradeOptions.find(g => g.value == scope.row.gradeId)?.label }}</span>
            </template>
          </el-table-column>
          <el-table-column label="班级" align="center" prop="classId">
             <template #default="scope">
              <span>{{ scope.row.classId }}班</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template #default="scope">
              <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['dmw:teach:remove']">删除</el-button>
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

        <!-- 添加任教管理对话框 -->
        <el-dialog :title="title" v-model="open" width="500px" append-to-body>
          <el-form ref="teachRef" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="选择教师" prop="userId">
              <el-select v-model="form.userId" filterable placeholder="请选择教师">
                <el-option
                  v-for="item in userList"
                  :key="item.userId"
                  :label="item.nickName"
                  :value="item.userId"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="选择年级" prop="gradeId">
              <el-select v-model="form.gradeId" placeholder="请选择年级">
                <el-option
                  v-for="item in gradeOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="选择班级" prop="classId">
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
              <el-button type="primary" @click="submitForm">确 定</el-button>
              <el-button @click="cancel">取 消</el-button>
            </div>
          </template>
        </el-dialog>
      </div>
    </template>

    <script setup name="Teach">
    import { listTeach, delTeach, addTeach } from "@/api/dmw/teach";
    import { listUser } from "@/api/system/user";

    const { proxy } = getCurrentInstance();

    const teachList = ref([]);
    const userList = ref([]);
    const open = ref(false);
    const loading = ref(true);
    const showSearch = ref(true);
    const ids = ref([]);
    const multiple = ref(true);
    const total = ref(0);
    const title = ref("");

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
        userId: null,
      },
      rules: {
        userId: [
          { required: true, message: "教师不能为空", trigger: "change" }
        ],
        gradeId: [
          { required: true, message: "年级不能为空", trigger: "change" }
        ],
        classId: [
          { required: true, message: "班级不能为空", trigger: "change" }
        ],
      }
    });

    const { queryParams, form, rules } = toRefs(data);

    /** 查询任教管理列表 */
    function getList() {
      loading.value = true;
      listTeach(queryParams.value).then(response => {
        teachList.value = response.rows;
        total.value = response.total;
        loading.value = false;
      });
    }

    /** 查询所有用户列表 */
    function getUserList() {
      listUser({ pageNum: 1, pageSize: 1000 }).then(response => { // 获取足够多的用户
        userList.value = response.rows;
      });
    }

    function cancel() {
      open.value = false;
      reset();
    }

    function reset() {
      form.value = {
        id: null,
        userId: null,
        gradeId: null,
        classId: null,
      };
      proxy.resetForm("teachRef");
    }

    function handleQuery() {
      queryParams.value.pageNum = 1;
      getList();
    }

    function resetQuery() {
      proxy.resetForm("queryRef");
      handleQuery();
    }

    function handleSelectionChange(selection) {
      ids.value = selection.map(item => item.id)
      multiple.value = !selection.length
    }

    function handleAdd() {
      reset();
      open.value = true;
      title.value = "添加任教关系";
    }

    function submitForm() {
      proxy.$refs["teachRef"].validate(valid => {
        if (valid) {
          addTeach(form.value).then(response => {
            proxy.$modal.msgSuccess("新增成功");
            open.value = false;
            getList();
          });
        }
      });
    }

    function handleDelete(row) {
      const delIds = row.id || ids.value;
      proxy.$modal.confirm('是否确认删除选中的任教关系？').then(function() {
        return delTeach(delIds);
      }).then(() => {
        getList();
        proxy.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }

    getList();
    getUserList();
    </script>
    