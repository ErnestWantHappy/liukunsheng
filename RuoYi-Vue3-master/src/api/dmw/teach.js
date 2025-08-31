import request from '@/utils/request'

// 查询教师任教管理列表
export function listTeach(query) {
  return request({
    url: '/dmw/teach/list',
    method: 'get',
    params: query
  })
}

// 查询教师任教管理详细
export function getTeach(id) {
  return request({
    url: '/dmw/teach/' + id,
    method: 'get'
  })
}

// 新增教师任教管理
export function addTeach(data) {
  return request({
    url: '/dmw/teach',
    method: 'post',
    data: data
  })
}

// 修改教师任教管理
export function updateTeach(data) {
  return request({
    url: '/dmw/teach',
    method: 'put',
    data: data
  })
}

// 删除教师任教管理
export function delTeach(id) {
  return request({
    url: '/dmw/teach/' + id,
    method: 'delete'
  })
}

// 获取当前登录教师的任教班级
export function getMyClasses() {
  return request({
    url: '/dmw/teach/myClasses',
    method: 'get'
  })
}