import request from '@/utils/request'

// 查询六困生-约谈记录列表
export function listInterview(query) {
  return request({
    url: '/dmw/interview/list',
    method: 'get',
    params: query
  })
}

// 查询六困生-约谈记录详细
export function getInterview(interviewId) {
  return request({
    url: '/dmw/interview/' + interviewId,
    method: 'get'
  })
}

// 新增六困生-约谈记录
export function addInterview(data) {
  return request({
    url: '/dmw/interview',
    method: 'post',
    data: data
  })
}

// 修改六困生-约谈记录
export function updateInterview(data) {
  return request({
    url: '/dmw/interview',
    method: 'put',
    data: data
  })
}

// 删除六困生-约谈记录
export function delInterview(interviewId) {
  return request({
    url: '/dmw/interview/' + interviewId,
    method: 'delete'
  })
}
