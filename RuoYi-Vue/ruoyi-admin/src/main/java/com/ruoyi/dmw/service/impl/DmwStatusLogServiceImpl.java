package com.ruoyi.dmw.service.impl;
import com.ruoyi.dmw.domain.DmwStatusLog;
import com.ruoyi.dmw.mapper.DmwStatusLogMapper;
import com.ruoyi.dmw.service.IDmwStatusLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DmwStatusLogServiceImpl implements IDmwStatusLogService {
    @Autowired
    private DmwStatusLogMapper dmwStatusLogMapper;

    @Override
    public int insertDmwStatusLog(DmwStatusLog dmwStatusLog) {
        // 保存一次状态变更记录，供后续追溯
        return dmwStatusLogMapper.insertDmwStatusLog(dmwStatusLog);
    }

    @Override
    public List<DmwStatusLog> selectLogsByStudentId(Long studentId) {
        return dmwStatusLogMapper.selectLogsByStudentId(studentId);
    }
}
