package com.ruoyi.dmw.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.dmw.domain.DmwStudentLog;
import com.ruoyi.dmw.mapper.DmwStudentLogMapper;
import com.ruoyi.dmw.service.IDmwStudentLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    @Override
    public int updateStudentLogTime(Long logId, Date operateTime) {
        if (logId == null || operateTime == null) {
            throw new ServiceException("参数错误");
        }
        DmwStudentLog log = dmwStudentLogMapper.selectStudentLogById(logId);
        if (log == null) {
            throw new ServiceException("日志不存在");
        }
        String username = SecurityUtils.getUsername();
        if (username == null || !username.equals(log.getCreateBy())) {
            throw new ServiceException("只能修改本人创建的记录");
        }
        return dmwStudentLogMapper.updateStudentLogTime(logId, operateTime);
    }
}
