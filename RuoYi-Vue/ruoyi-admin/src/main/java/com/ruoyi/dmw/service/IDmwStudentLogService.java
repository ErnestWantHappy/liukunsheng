package com.ruoyi.dmw.service;

import com.ruoyi.dmw.domain.DmwStudentLog;

import java.util.Date;
import java.util.List;

public interface IDmwStudentLogService {

    int insertStudentLog(DmwStudentLog log);

    List<DmwStudentLog> selectLogsByStudentId(Long studentId);

    int updateStudentLogTime(Long logId, Date operateTime);
}
