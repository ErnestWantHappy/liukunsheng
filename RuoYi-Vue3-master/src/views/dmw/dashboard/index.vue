<template>
  <div class="dashboard-container">
    <div class="dashboard-header">
      <h2>六困生数据分析仪表盘</h2>
      <p>实时展示六困生数据统计和分析结果</p>
    </div>

    <el-card class="filter-card">
      <el-form :inline="true" :model="filterForm">
        <el-form-item label="学部">
          <el-select v-model="filterForm.deptType" placeholder="全部学部" clearable style="width: 160px">
            <el-option
              v-for="dict in deptOptions"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="年级">
          <el-select v-model="filterForm.gradeId" placeholder="全部年级" clearable style="width: 160px">
            <el-option
              v-for="grade in gradeOptions"
              :key="grade.gradeId"
              :label="grade.gradeName"
              :value="grade.gradeId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="困难类型">
          <el-select v-model="filterForm.hardshipType" placeholder="全部类型" clearable style="width: 160px">
            <el-option
              v-for="dict in hardshipOptions"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="handleFilter">筛选</el-button>
          <el-button icon="Refresh" @click="handleReset">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card class="hierarchy-card">
      <template #header>
        <div class="card-header">全校 / 学部 / 年级困难学生分布</div>
      </template>
      <el-table
        :data="hierarchyTreeData"
        :tree-props="{ children: 'children' }"
        row-key="id"
        border
        v-loading="loading"
      >
        <el-table-column prop="name" label="层级" min-width="220" />
        <el-table-column prop="totalCount" label="总困生数" width="120" align="center" />
        <el-table-column prop="type1Count" label="特困生" width="100" align="center" />
        <el-table-column prop="type2Count" label="学困生" width="100" align="center" />
        <el-table-column prop="type3Count" label="心困生" width="100" align="center" />
        <el-table-column prop="type4Count" label="德困生" width="100" align="center" />
        <el-table-column prop="type5Count" label="身困生" width="100" align="center" />
        <el-table-column prop="type6Count" label="境困生" width="100" align="center" />
      </el-table>
    </el-card>

    <div class="stats-cards">
      <el-row :gutter="20">
        <el-col :span="6">
          <el-card class="stats-card">
            <div class="stats-item">
              <div class="stats-value">{{ statsData.totalStudents }}</div>
              <div class="stats-label">学生总数</div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="stats-card">
            <div class="stats-item">
              <div class="stats-value active">{{ statsData.activeStudents }}</div>
              <div class="stats-label">在读学生</div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="stats-card">
            <div class="stats-item">
              <div class="stats-value archived">{{ statsData.archivedStudents }}</div>
              <div class="stats-label">归档/请假/休学</div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="stats-card">
            <div class="stats-item">
              <div class="stats-value interviews">{{ statsData.totalInterviews }}</div>
              <div class="stats-label">约谈记录</div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>

    

    <div class="charts-section">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card>
            <PieChart
              :data="hardshipDistribution"
              title="六困生类型分布"
              height="400px"
              :colors="hardshipColors"
            />
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card>
            <BarChart
              :xData="gradeDistribution.map(item => item.name)"
              :series="[{ name: '学生数量', data: gradeDistribution.map(item => item.value) }]"
              title="各年级六困生分布"
              xAxisName="年级"
              yAxisName="学生数量"
              height="400px"
            />
          </el-card>
        </el-col>
      </el-row>
    </div>

    <div class="charts-section">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card>
            <BarChart
              :xData="interviewStats.map(item => item.name)"
              :series="[{ name: '约谈次数', data: interviewStats.map(item => item.value) }]"
              title="各困难类型约谈统计"
              xAxisName="困难类型"
              yAxisName="约谈次数"
              height="400px"
              :colors="['#67C23A']"
            />
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card>
            <PieChart
              :data="classDistribution"
              title="班级六困生分布 (TOP 10)"
              height="400px"
              legendPosition="right"
            />
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, getCurrentInstance } from 'vue'

import { PieChart, BarChart } from '@/components/Charts'
import {
  getDashboardStats,
  getHardshipHierarchyStats,
  getHardshipDistribution,
  getGradeDistribution,
  getInterviewStats,
  getClassHardshipDistribution
} from '@/api/dmw/student'

const loading = ref(false)

const gradeOptions = ref([
  { gradeId: 1, gradeName: '一年级' },
  { gradeId: 2, gradeName: '二年级' },
  { gradeId: 3, gradeName: '三年级' },
  { gradeId: 4, gradeName: '四年级' },
  { gradeId: 5, gradeName: '五年级' },
  { gradeId: 6, gradeName: '六年级' },
  { gradeId: 7, gradeName: '七年级' },
  { gradeId: 8, gradeName: '八年级' },
  { gradeId: 9, gradeName: '九年级' }
])

const filterForm = ref({
  deptType: '',
  gradeId: '',
  hardshipType: ''
})

const statsData = ref({
  totalStudents: 0,
  activeStudents: 0,
  archivedStudents: 0,
  totalInterviews: 0
})

const hardshipDistribution = ref([])
const gradeDistribution = ref([])
const interviewStats = ref([])
const classDistribution = ref([])

const hardshipColors = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FECA57', '#FF9FF3']

const { proxy } = getCurrentInstance()
const { dmw_hardship_type, dmw_dept_type } = proxy.useDict('dmw_hardship_type', 'dmw_dept_type')
const hardshipOptions = computed(() => dmw_hardship_type?.value || [])
const deptOptions = computed(() => dmw_dept_type?.value || [])

const hierarchyData = ref([])

const buildHierarchyTree = (rows = []) => {
  if (!rows.length) {
    return []
  }

  const grouped = rows.reduce((acc, row) => {
    const level = row.level || 'unknown'
    if (!acc[level]) {
      acc[level] = []
    }
    acc[level].push(row)
    return acc
  }, {})

  const convertRow = (row) => ({
    id: `${row.level || 'node'}-${row.deptType || 'all'}-${row.gradeId || 'all'}`,
    name: row.nodeName || row.name || '',
    level: row.level,
    deptType: row.deptType,
    gradeId: row.gradeId,
    totalCount: Number(row.totalCount || 0),
    type1Count: Number(row.type1Count || 0),
    type2Count: Number(row.type2Count || 0),
    type3Count: Number(row.type3Count || 0),
    type4Count: Number(row.type4Count || 0),
    type5Count: Number(row.type5Count || 0),
    type6Count: Number(row.type6Count || 0),
    children: []
  })

  const deptNodes = (grouped.dept || []).map(item => convertRow(item))
  const gradeNodes = (grouped.grade || []).map(item => convertRow(item))

  const attachGrades = (node) => {
    node.children = gradeNodes
      .filter(grade => (grade.deptType || '') === (node.deptType || ''))
      .map(grade => ({ ...grade }))
    return node
  }

  const schoolNodes = (grouped.school || []).map(school => {
    const node = convertRow(school)
    node.children = deptNodes.map(dept => attachGrades({ ...dept }))
    return node
  })

  if (schoolNodes.length) {
    return schoolNodes
  }

  if (deptNodes.length) {
    return deptNodes.map(dept => attachGrades({ ...dept }))
  }

  return gradeNodes
}

const hierarchyTreeData = computed(() => buildHierarchyTree(hierarchyData.value))

const transformDistribution = (list = [], { nameKey = 'name', valueKey = 'value' } = {}) => {
  return list.map(item => {
    const name = item[nameKey] ?? item.name ?? item.gradeName ?? item.className ?? ''
    const value = item[valueKey] ?? item.value ?? item.studentCount ?? item.totalStudents ?? 0
    return {
      name,
      value: Number(value)
    }
  })
}

const buildQueryParams = () => {
  const params = {}
  const current = filterForm.value
  if (current.deptType) {
    params.deptType = current.deptType
  }
  if (current.gradeId) {
    params.gradeId = current.gradeId
  }
  if (current.hardshipType) {
    params.hardshipType = current.hardshipType
  }
  return params
}

const fetchAllData = async () => {
  loading.value = true
  const query = buildQueryParams()
  try {
    const [statsRes, hierarchyRes, hardshipRes, gradeRes, interviewRes, classRes] = await Promise.all([
      getDashboardStats(query),
      getHardshipHierarchyStats(query),
      getHardshipDistribution(query),
      getGradeDistribution(query),
      getInterviewStats(query),
      getClassHardshipDistribution(query)
    ])

    const stats = statsRes?.data || {}
    const totalStudents = Number(stats.totalStudents || 0)
    const longLeave = Number(stats.longLeaveTotal || 0)
    const suspension = Number(stats.suspensionTotal || 0)
    const activeStudents = Math.max(totalStudents - longLeave - suspension, 0)

    statsData.value = {
      totalStudents,
      activeStudents,
      archivedStudents: longLeave + suspension,
      totalInterviews: 0
    }

    hierarchyData.value = hierarchyRes?.data || []

    hardshipDistribution.value = transformDistribution(hardshipRes?.data || [], { nameKey: 'name', valueKey: 'value' })
    gradeDistribution.value = transformDistribution(gradeRes?.data || [], { nameKey: 'name', valueKey: 'value' })
    interviewStats.value = transformDistribution(interviewRes?.data || [], { nameKey: 'name', valueKey: 'value' })
    classDistribution.value = transformDistribution(classRes?.data || [], { nameKey: 'className', valueKey: 'totalStudents' }).slice(0, 10)

    const interviewTotal = interviewStats.value.reduce((sum, item) => sum + (Number(item.value) || 0), 0)
    statsData.value.totalInterviews = interviewTotal
  } catch (error) {
    console.error('获取仪表盘数据失败', error)
  } finally {
    loading.value = false
  }
}

const handleFilter = () => {
  fetchAllData()
}

const handleReset = () => {
  filterForm.value.deptType = ''
  filterForm.value.gradeId = ''
  filterForm.value.hardshipType = ''
  fetchAllData()
}

onMounted(() => {
  fetchAllData()
})
</script>

<style lang="scss" scoped>
.dashboard-container {
  padding: 20px;
  background-color: #f5f5f5;
  min-height: calc(100vh - 84px);
}

.dashboard-header {
  text-align: center;
  margin-bottom: 20px;

  h2 {
    color: #303133;
    margin: 0 0 8px 0;
    font-size: 24px;
    font-weight: bold;
  }

  p {
    color: #606266;
    margin: 0;
    font-size: 14px;
  }
}

.filter-card {
  margin-bottom: 20px;
}

.hierarchy-card {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  align-items: center;
  font-weight: 600;
  color: #303133;
}

.stats-cards {
  margin-bottom: 20px;

  .stats-card {
    text-align: center;

    .stats-item {
      .stats-value {
        font-size: 32px;
        font-weight: bold;
        color: #409EFF;
        margin-bottom: 8px;

        &.active {
          color: #67C23A;
        }

        &.archived {
          color: #E6A23C;
        }

        &.interviews {
          color: #F56C6C;
        }
      }
      .stats-label {
        color: #909399;
      }
    }
  }
}

.charts-section {
  margin-bottom: 20px;

  .el-card {
    height: 100%;
  }
}
</style>
