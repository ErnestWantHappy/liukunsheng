package com.ruoyi.dmw.mapper;

import com.ruoyi.dmw.domain.DmwStudentLog;
import java.util.List;

public interface DmwStudentLogMapper {

    // 插入一条学生档案变动日志
    int insertStudentLog(DmwStudentLog log);

    // 按学生ID查询所有日志记录
    List<DmwStudentLog> selectLogsByStudentId(Long studentId);

}
