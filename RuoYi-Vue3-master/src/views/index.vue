<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>大目湾实验学校六困生信息管理系统</h2>
        <p>
          秉持“为每一位学生健康成长护航”的教育理念，针对当前学生管理工作中信息分散、追踪困难、交接不便的现状，我们独立研发了象山县首个“六困生”数字化信息管理系统。本系统致力于将传统的纸质档案全面数字化，实现对特困、学困、心困、德困、身困、境困等各类学生的精准识别、动态追踪与科学管理，为学校德育工作提供强有力的技术支撑，确保对每一位需要帮助的学生都能做到及时发现、有效干预、持续关怀。
        </p>
        <p>
          <b>当前版本:</b> <span>v1.0.0</span>
        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>MyBatis</li>
              <li>MySQL</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Pinia</li>
              <li>Element Plus</li>
              <li>Axios</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    
    <!-- 数据统计 -->
    <el-row :gutter="20" class="dashboard-stats">
        <el-col :span="6">
            <el-card class="stat-card" shadow="hover" style="background-color: #409EFF;">
                <div class="stat-title">在读学生总数</div>
                <div class="stat-value">{{ stats.totalStudents || 0 }}</div>
            </el-card>
        </el-col>
        <el-col :span="6">
            <el-card class="stat-card" shadow="hover" style="background-color: #67C23A;">
                <div class="stat-title">小学部总人数</div>
                <div class="stat-value">{{ stats.primarySchoolTotal || 0 }}</div>
            </el-card>
        </el-col>
        <el-col :span="6">
            <el-card class="stat-card" shadow="hover" style="background-color: #E6A23C;">
                <div class="stat-title">初中部总人数</div>
                <div class="stat-value">{{ stats.middleSchoolTotal || 0 }}</div>
            </el-card>
        </el-col>
        <el-col :span="6">
             <el-card class="stat-card" shadow="hover" style="background-color: #909399;">
                <div class="stat-title">休学/长假人数</div>
                <div class="stat-value">{{ (stats.longLeaveTotal || 0) + (stats.suspensionTotal || 0) }}</div>
            </el-card>
        </el-col>
    </el-row>
    <el-row :gutter="20" class="dashboard-stats">
        <el-col :span="4"><el-card shadow="hover"><div class="stat-label">特困生</div><div class="stat-count">{{ stats.type1Total || 0 }}</div></el-card></el-col>
        <el-col :span="4"><el-card shadow="hover"><div class="stat-label">学困生</div><div class="stat-count">{{ stats.type2Total || 0 }}</div></el-card></el-col>
        <el-col :span="4"><el-card shadow="hover"><div class="stat-label">心困生</div><div class="stat-count">{{ stats.type3Total || 0 }}</div></el-card></el-col>
        <el-col :span="4"><el-card shadow="hover"><div class="stat-label">德困生</div><div class="stat-count">{{ stats.type4Total || 0 }}</div></el-card></el-col>
        <el-col :span="4"><el-card shadow="hover"><div class="stat-label">身困生</div><div class="stat-count">{{ stats.type5Total || 0 }}</div></el-card></el-col>
        <el-col :span="4"><el-card shadow="hover"><div class="stat-label">境困生</div><div class="stat-count">{{ stats.type6Total || 0 }}</div></el-card></el-col>
    </el-row>

    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="24" :lg="24">
        <el-card class="update-log">
          <template v-slot:header>
            <div class="clearfix">
              <span>系统使用指南</span>
            </div>
          </template>
          <el-collapse accordion>
            <el-collapse-item title="1. 学生信息管理">
              <div class="guide-content">
                <p><b>核心功能：</b>此模块用于管理所有在读学生（正常、请长假、休学）的档案信息。</p>
                <p><b>新增学生：</b>管理员可为任意班级添加；班主任登录后，系统会自动为其指定班级。</p>
                <p><b>修改与下载：</b>可修改学生详细信息，或将学生的完整档案（含约谈记录和附件）下载为ZIP压缩包。</p>
              </div>
            </el-collapse-item>
            <el-collapse-item title="2. 新增约谈与状态变更">
              <div class="guide-content">
                <p><b>新增约谈：</b>在学生列表的操作列，可为指定学生快速添加约谈记录，并上传附件。</p>
                <p><b>状态变更：</b>在操作列的“更多”选项中，可将学生状态在“正常”、“请长假”、“休学”之间流转，所有变更都会被记录。</p>
              </div>
            </el-collapse-item>
            <el-collapse-item title="3. 历史档案">
               <div class="guide-content">
                <p><b>功能说明：</b>此模块用于查看所有已“归档”的学生，包括被删除、已毕业或已转学的学生。</p>
                <p><b>恢复功能：</b>对于归档的学生，可以通过“恢复”按钮，将其重新分配到新的班级，使其变为在读状态。</p>
              </div>
            </el-collapse-item>
             <el-collapse-item title="4. 全员升级 (仅管理员)">
               <div class="guide-content">
                <p><b>功能说明：</b>在学年结束时，管理员可使用此功能对全体在读学生进行升级。</p>
                <p><b>安全机制：</b>操作前需要二次输入“确认升级”以防误触，操作会跳过所有休学和请长假的学生。</p>
              </div>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Index">
import { getDashboardStats } from "@/api/dmw/student";
const stats = ref({});

function getStats() {
  getDashboardStats().then(res => {
    stats.value = res.data;
  });
}

getStats();
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;

  .dashboard-stats {
    margin-bottom: 20px;
    .stat-card {
      color: #fff;
      border-radius: 8px;
      .stat-title {
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
      }
      .stat-value {
        font-size: 28px;
        font-weight: bold;
        margin-top: 5px;
      }
    }
    .stat-label {
        font-size: 16px;
        color: #606266;
        text-align: center;
    }
    .stat-count {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        color: #303133;
        margin-top: 5px;
    }
  }
  
  .guide-content p {
    line-height: 1.8;
    font-size: 14px;
  }
}
</style>
