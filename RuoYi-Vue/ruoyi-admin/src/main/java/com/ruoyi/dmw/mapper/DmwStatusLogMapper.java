package com.ruoyi.dmw.mapper;

import com.ruoyi.dmw.domain.DmwStatusLog;

import java.util.List;

public interface DmwStatusLogMapper {
    // 新增一条学生状态变更记录
    int insertDmwStatusLog(DmwStatusLog dmwStatusLog);

    // 查询指定学生的状态变更轨迹
    List<DmwStatusLog> selectLogsByStudentId(Long studentId);
}
