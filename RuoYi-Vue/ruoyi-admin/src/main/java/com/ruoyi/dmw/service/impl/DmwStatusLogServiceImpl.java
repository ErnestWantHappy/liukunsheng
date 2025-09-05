package com.ruoyi.dmw.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dmw.mapper.DmwStatusLogMapper;
import com.ruoyi.dmw.domain.DmwStatusLog;
import com.ruoyi.dmw.service.IDmwStatusLogService;
@Service
public class DmwStatusLogServiceImpl implements IDmwStatusLogService {
    @Autowired
    private DmwStatusLogMapper dmwStatusLogMapper;
    @Override
    public int insertDmwStatusLog(DmwStatusLog dmwStatusLog) {
        return dmwStatusLogMapper.insertDmwStatusLog(dmwStatusLog);
    }
}