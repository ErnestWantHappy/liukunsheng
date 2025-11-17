package com.ruoyi.dmw.service;

import com.ruoyi.dmw.domain.DmwStatusLog;

import java.util.List;

public interface IDmwStatusLogService {
    int insertDmwStatusLog(DmwStatusLog dmwStatusLog);

    List<DmwStatusLog> selectLogsByStudentId(Long studentId);
}
