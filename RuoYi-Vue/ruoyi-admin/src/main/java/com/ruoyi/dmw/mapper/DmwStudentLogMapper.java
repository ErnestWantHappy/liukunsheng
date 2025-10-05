package com.ruoyi.dmw.mapper;

import com.ruoyi.dmw.domain.DmwStudentLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface DmwStudentLogMapper {

    // 插入一条学生档案变动日志
    int insertStudentLog(DmwStudentLog log);

    // 按学生ID查询所有日志记录
    List<DmwStudentLog> selectLogsByStudentId(Long studentId);

    // 根据日志主键获取详细信息
    DmwStudentLog selectStudentLogById(Long logId);

    // 将指定日志的创建时间调整为自定义值
    int updateStudentLogTime(@Param("logId") Long logId, @Param("createTime") Date createTime);
}