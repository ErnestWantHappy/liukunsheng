import request from '@/utils/request'

// 查询六困生-学生信息列表
export function listStudent(query) {
  return request({
    url: '/dmw/student/list',
    method: 'get',
    params: query
  })
}

// 查询六困生-学生信息详细
export function getStudent(studentId) {
  return request({
    url: '/dmw/student/' + studentId,
    method: 'get'
  })
}

// 新增六困生-学生信息
export function addStudent(data) {
  return request({
    url: '/dmw/student',
    method: 'post',
    data: data
  })
}

// 修改六困生-学生信息
export function updateStudent(data) {
  return request({
    url: '/dmw/student',
    method: 'put',
    data: data
  })
}

// 删除六困生-学生信息
export function delStudent(studentId) {
  return request({
    url: '/dmw/student/' + studentId,
    method: 'delete'
  })
}
// 下载学生档案
export function downloadProfile(studentId) {
  // 注意：这里我们直接用若依的下载工具，但需要手动构造URL
  // 因为它不是一个标准的导出接口
  const url = '/dmw/student/downloadProfile/' + studentId;
  // 我们直接返回URL，让组件处理下载
  return url;
}

// 新增：更改学生状态
export function changeStudentStatus(data) {
  return request({
    url: '/dmw/student/changeStatus',
    method: 'post',
    data: data
  })
}

// 查询已归档学生列表
export function listArchivedStudent(query) {
  return request({
    url: '/dmw/student/archivedList',
    method: 'get',
    params: query
  })
}

// 恢复学生档案
export function restoreStudent(data) {
  return request({
    url: '/dmw/student/restore',
    method: 'put',
    data: data
  })
}

// 执行全员升级
export function upgradeAllStudents() {
  return request({
    url: '/dmw/student/upgradeAll',
    method: 'post'
  })
}

// 获取首页统计数据
export function getDashboardStats() {
  return request({
    url: '/dmw/student/dashboard/stats',
    method: 'get'
  })
}