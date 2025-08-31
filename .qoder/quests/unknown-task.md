# 若依管理系统 - 大木湾六困生管理平台 技术文档

## 1. 项目概述

### 系统简介
大木湾六困生管理平台是基于若依(RuoYi)框架构建的学生关爱管理系统，专门用于管理和跟踪"六困生"（六种困难学生）的信息和状态。系统采用前后端分离架构，提供完整的学生信息管理、约谈记录、状态跟踪等功能。

### 核心价值
- **学生关爱数字化**：将传统纸质档案转为数字化管理
- **数据权限精细化**：班主任只能管理自己班级学生，实现数据隔离
- **状态跟踪自动化**：支持学生状态变更的完整记录和统计
- **档案管理标准化**：统一的学生档案格式和导出功能

### 技术版本
- **RuoYi-Vue**: v3.9.0 (Vue 2 + Spring Boot)
- **RuoYi-Vue3**: Vue 3 + Vite 现代化版本

## 2. 技术栈架构

### 后端技术栈
```mermaid
graph TB
    A[Spring Boot 2.5.15] --> B[Spring Security 5.7.12]
    A --> C[MyBatis]
    A --> D[MySQL]
    A --> E[Redis]
    
    B --> F[JWT 0.9.1]
    C --> G[PageHelper 1.4.7]
    D --> H[Druid 1.2.23]
    
    I[开发工具] --> J[Swagger 3.0.0]
    I --> K[代码生成器]
    I --> L[Excel导入导出]
    
    M[定时任务] --> N[Quartz]
    O[系统监控] --> P[Actuator]
```

### 前端技术栈

#### Vue 2 版本 (RuoYi-Vue)
```mermaid
graph LR
    A[Vue 2.6.12] --> B[Element UI 2.15.14]
    A --> C[Vue Router 3.4.9]
    A --> D[Vuex 3.6.0]
    A --> E[Axios 0.28.1]
    
    F[构建工具] --> G[Vue CLI 4.4.6]
    H[UI增强] --> I[ECharts 5.4.0]
    H --> J[富文本编辑器 Quill]
    H --> K[文件上传组件]
```

#### Vue 3 版本 (RuoYi-Vue3)
```mermaid
graph LR
    A[Vue 3] --> B[Element Plus]
    A --> C[Vue Router 4]
    A --> D[Pinia]
    A --> E[Axios]
    
    F[构建工具] --> G[Vite]
    H[开发体验] --> I[TypeScript支持]
    H --> J[热更新]
    H --> K[组合式API]
```

## 3. 系统架构设计

### 整体架构图
```mermaid
graph TB
    subgraph "前端层"
        A[Vue 应用]
        B[路由管理]
        C[状态管理]
        D[UI组件库]
    end
    
    subgraph "网关层"
        E[Nginx]
        F[负载均衡]
    end
    
    subgraph "应用层"
        G[Spring Boot]
        H[Spring Security]
        I[JWT认证]
    end
    
    subgraph "业务层"
        J[系统管理模块]
        K[DMW学生管理模块]
        L[监控模块]
        M[工具模块]
    end
    
    subgraph "数据层"
        N[MySQL主库]
        O[Redis缓存]
        P[文件存储]
    end
    
    A --> E
    E --> G
    G --> H
    H --> I
    I --> J
    I --> K
    I --> L
    I --> M
    
    J --> N
    K --> N
    L --> O
    M --> P
```

### 模块架构设计

#### 核心模块结构
```mermaid
graph TD
    A[RuoYi Root] --> B[ruoyi-admin 启动模块]
    A --> C[ruoyi-common 公共模块]
    A --> D[ruoyi-framework 框架模块]
    A --> E[ruoyi-system 系统模块]
    A --> F[ruoyi-generator 代码生成]
    A --> G[ruoyi-quartz 定时任务]
    
    B --> H[DMW Controller层]
    H --> I[DmwStudentController]
    H --> J[DmwInterviewController]
    H --> K[DmwTeacherClassController]
    
    C --> L[工具类集合]
    L --> M[ExcelUtil]
    L --> N[SecurityUtils]
    L --> O[DateUtils]
    
    D --> P[安全框架]
    P --> Q[JWT配置]
    P --> R[权限拦截器]
    P --> S[数据源配置]
```

## 4. DMW业务模块详细设计

### 4.1 学生管理模块

#### 数据模型设计
```mermaid
erDiagram
    DMW_STUDENT {
        bigint student_id PK
        varchar student_name
        varchar id_card_no
        varchar dept_type "学部类型(1=小学,2=初中)"
        bigint grade_id "年级ID"
        bigint class_id "班级ID"
        varchar gender "性别"
        varchar is_only_child "是否独生"
        varchar health_status "身体状况"
        varchar address "家庭地址"
        varchar family_structure "家庭结构"
        varchar family_atmosphere "家庭氛围"
        varchar economic_status "经济情况"
        varchar parent_occupation "父母职业"
        varchar foster_left_behind "寄养留守经历"
        varchar self_harm_history "自伤自残史"
        varchar hardship_type "六困生类型"
        text student_details "详细情况说明"
        text countermeasures "应对措施"
        text teacher_report_info "教师上报信息"
        varchar student_status "学生状态"
        varchar current_status_reason "状态原因"
        varchar report_status "上报状态"
        datetime last_record_time "最近记录时间"
        varchar del_flag "删除标志"
    }
    
    DMW_INTERVIEW {
        bigint interview_id PK
        bigint student_id FK
        varchar interview_type "约谈类型"
        datetime interview_time "约谈时间"
        varchar interviewer "约谈人"
        text interview_content "约谈内容"
        text interview_result "约谈结果"
    }
    
    DMW_STATUS_LOG {
        bigint log_id PK
        bigint student_id FK
        varchar student_name
        varchar previous_status "原状态"
        varchar current_status "当前状态"
        varchar reason "变更原因"
        datetime create_time "变更时间"
        varchar create_by "操作人"
    }
    
    DMW_TEACHER_CLASS {
        bigint id PK
        bigint user_id FK
        bigint grade_id
        bigint class_id
        varchar status "状态"
    }
    
    DMW_STUDENT ||--o{ DMW_INTERVIEW : "一对多"
    DMW_STUDENT ||--o{ DMW_STATUS_LOG : "一对多"
    DMW_TEACHER_CLASS ||--o{ DMW_STUDENT : "一对多"
```

#### 核心业务流程

##### 学生信息管理流程
```mermaid
sequenceDiagram
    participant T as 班主任/管理员
    participant C as Controller
    participant S as Service
    participant M as Mapper
    participant DB as 数据库
    
    T->>C: 新增/修改学生信息
    C->>S: 调用业务服务
    S->>S: 数据校验和处理
    S->>M: 执行数据操作
    M->>DB: SQL执行
    DB-->>M: 返回结果
    M-->>S: 返回执行结果
    S-->>C: 返回业务结果
    C-->>T: 返回响应结果
```

##### 权限控制流程
```mermaid
flowchart TD
    A[用户请求] --> B{检查用户角色}
    B -->|管理员| C[全部数据权限]
    B -->|班主任| D[检查班级关联]
    D --> E{是否为负责班级}
    E -->|是| F[允许访问该班级数据]
    E -->|否| G[拒绝访问]
    C --> H[执行业务逻辑]
    F --> H
    G --> I[返回权限错误]
    H --> J[返回结果]
```

### 4.2 系统功能矩阵

| 功能模块 | 管理员权限 | 班主任权限 | 主要功能 |
|---------|-----------|-----------|----------|
| 学生信息管理 | ✅ 全部学生 | ✅ 负责班级 | CRUD、状态变更、档案下载 |
| 约谈记录管理 | ✅ 全部记录 | ✅ 负责学生 | 新增约谈、查看历史记录 |
| 统计报表 | ✅ 全校统计 | ✅ 班级统计 | 仪表盘、数据导出 |
| 全员升级 | ✅ | ❌ | 年级自动升级、毕业处理 |
| 系统管理 | ✅ | ❌ | 用户、角色、菜单管理 |

### 4.3 API接口设计

#### 学生管理接口
```yaml
# 学生CRUD接口
GET    /dmw/student/list          # 查询学生列表
GET    /dmw/student/{id}          # 获取学生详情
POST   /dmw/student               # 新增学生
PUT    /dmw/student               # 修改学生
DELETE /dmw/student/{ids}         # 删除学生

# 学生状态管理
POST   /dmw/student/changeStatus  # 变更学生状态
GET    /dmw/student/archivedList  # 查询归档学生
PUT    /dmw/student/restore       # 恢复学生档案

# 系统功能接口
POST   /dmw/student/upgradeAll    # 全员升级(管理员)
GET    /dmw/student/dashboard/stats # 获取统计数据
POST   /dmw/student/downloadProfile/{id} # 下载学生档案

# 数据导入导出
POST   /dmw/student/export        # 导出学生数据
POST   /dmw/student/import        # 导入学生数据
GET    /dmw/student/importTemplate # 下载导入模板
```

## 5. 前端组件架构

### 5.1 页面结构设计
```mermaid
graph TD
    A[学生管理主页] --> B[搜索表单组件]
    A --> C[操作工具栏]
    A --> D[数据表格组件]
    A --> E[分页组件]
    
    F[学生表单对话框] --> G[基本信息表单]
    F --> H[家庭情况表单]
    F --> I[困难类型表单]
    
    J[约谈管理组件] --> K[约谈表单]
    J --> L[约谈历史列表]
    
    M[状态变更对话框] --> N[状态选择]
    M --> O[原因输入]
```

### 5.2 组件通信模式
```mermaid
sequenceDiagram
    participant P as 父组件(index.vue)
    participant T as 表格组件
    participant F as 表单对话框
    participant A as API服务
    
    P->>T: 传递数据和事件处理器
    T->>P: 触发编辑/删除事件
    P->>F: 打开对话框并传递数据
    F->>A: 提交表单数据
    A-->>F: 返回操作结果
    F->>P: 关闭对话框并通知刷新
    P->>T: 刷新表格数据
```

## 6. 数据权限与安全设计

### 6.1 权限控制策略
```mermaid
flowchart TD
    A[登录用户] --> B[获取用户角色]
    B --> C{角色类型判断}
    
    C -->|admin| D[超级管理员]
    C -->|headteacher| E[班主任角色]
    C -->|common| F[普通用户]
    
    D --> G[全部数据权限]
    E --> H[查询班级关联表]
    F --> I[基础查看权限]
    
    H --> J{是否负责该班级}
    J -->|是| K[允许操作该班级学生]
    J -->|否| L[拒绝访问]
    
    G --> M[执行操作]
    K --> M
    I --> N[只读访问]
    L --> O[返回权限错误]
```

### 6.2 数据安全措施

#### 后端安全控制
- **@PreAuthorize**: 方法级权限控制
- **数据范围过滤**: 基于用户角色自动过滤数据
- **SQL注入防护**: MyBatis参数化查询
- **XSS防护**: 输入数据过滤和转义

#### 前端安全控制
- **路由守卫**: 页面访问权限控制
- **按钮权限**: v-hasPermi指令控制
- **数据脱敏**: 敏感信息显示控制

## 7. 系统监控与运维

### 7.1 系统监控功能
```mermaid
graph LR
    A[系统监控] --> B[在线用户监控]
    A --> C[服务器性能监控]
    A --> D[缓存监控]
    A --> E[数据库连接池监控]
    
    F[日志管理] --> G[操作日志]
    F --> H[登录日志]
    F --> I[系统异常日志]
    
    J[定时任务] --> K[数据备份任务]
    J --> L[统计报表生成]
    J --> M[系统清理任务]
```

### 7.2 部署架构建议
```mermaid
graph TB
    subgraph "生产环境"
        A[负载均衡器 Nginx]
        B[应用服务器集群]
        C[数据库主从集群]
        D[Redis集群]
        E[文件存储服务]
    end
    
    subgraph "监控系统"
        F[应用监控]
        G[系统监控]
        H[日志收集]
    end
    
    A --> B
    B --> C
    B --> D
    B --> E
    
    B --> F
    C --> G
    D --> G
    E --> H
```

## 8. 开发规范与最佳实践

### 8.1 代码组织规范

#### 后端包结构
```
com.ruoyi.dmw/
├── controller/     # 控制器层
├── service/        # 业务服务层
│   └── impl/      # 服务实现
├── mapper/         # 数据访问层
├── domain/         # 实体模型
└── dto/           # 数据传输对象
```

#### 前端目录结构
```
src/
├── api/dmw/        # API接口定义
├── views/dmw/      # 页面组件
├── components/     # 公共组件
├── store/          # 状态管理
├── router/         # 路由配置
└── utils/          # 工具函数
```

### 8.2 开发最佳实践

#### 数据库设计原则
- 使用软删除(del_flag)而非物理删除
- 记录创建和修改时间、操作人
- 状态变更需要记录变更历史
- 合理使用数据库索引提升查询性能

#### API设计原则
- RESTful API设计风格
- 统一的响应格式(AjaxResult)
- 完善的参数校验和异常处理
- 详细的API文档(Swagger)

#### 前端开发原则
- 组件化开发，提高代码复用性
- 统一的错误处理和消息提示
- 合理的数据缓存策略
- 无障碍访问支持

## 9. 扩展功能建议

### 9.1 功能增强方向
- **移动端适配**: 响应式设计或开发小程序版本
- **数据分析**: 更详细的统计分析和数据可视化
- **消息通知**: 重要事件的消息推送功能
- **文档管理**: 支持更多类型的附件上传和管理
- **工作流程**: 学生状态变更的审批流程

### 9.2 技术优化方向
- **性能优化**: 数据库查询优化、前端组件懒加载
- **安全加固**: 更完善的权限控制和数据加密
- **微服务改造**: 大规模部署时考虑微服务架构
- **容器化部署**: Docker容器化部署方案