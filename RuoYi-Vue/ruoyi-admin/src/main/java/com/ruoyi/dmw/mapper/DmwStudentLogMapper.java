package com.ruoyi.dmw.mapper;

import com.ruoyi.dmw.domain.DmwStudentLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface DmwStudentLogMapper {

    int insertStudentLog(DmwStudentLog log);

    List<DmwStudentLog> selectLogsByStudentId(Long studentId);

    DmwStudentLog selectStudentLogById(Long logId);

    int updateStudentLogTime(@Param("logId") Long logId, @Param("createTime") Date createTime);
}
