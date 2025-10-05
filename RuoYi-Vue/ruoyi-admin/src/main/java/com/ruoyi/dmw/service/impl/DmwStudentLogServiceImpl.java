package com.ruoyi.dmw.service.impl;

import com.ruoyi.dmw.domain.DmwStudentLog;
import com.ruoyi.dmw.mapper.DmwStudentLogMapper;
import com.ruoyi.dmw.service.IDmwStudentLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DmwStudentLogServiceImpl implements IDmwStudentLogService {

    @Autowired
    private DmwStudentLogMapper dmwStudentLogMapper;

    @Override
    public int insertStudentLog(DmwStudentLog log) {
        return dmwStudentLogMapper.insertStudentLog(log);
    }

    @Override
    public List<DmwStudentLog> selectLogsByStudentId(Long studentId) {
        return dmwStudentLogMapper.selectLogsByStudentId(studentId);
    }
}
