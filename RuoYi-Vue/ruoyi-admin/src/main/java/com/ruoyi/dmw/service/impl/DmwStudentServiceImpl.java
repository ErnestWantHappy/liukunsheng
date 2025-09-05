package com.ruoyi.dmw.service.impl;

import java.util.List;
import java.util.Map; // 【新增】导入 Map
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.dmw.domain.DmwStatusLog;
import com.ruoyi.dmw.service.IDmwStatusLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dmw.mapper.DmwStudentMapper;
import com.ruoyi.dmw.domain.DmwStudent;
import com.ruoyi.dmw.service.IDmwStudentService;
import com.ruoyi.common.core.domain.model.LoginUser;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.core.domain.entity.SysRole;

/**
 * 六困生-学生信息Service业务层处理
 * * @author zdx
 * @date 2025-07-19
 */
@Service
public class DmwStudentServiceImpl implements IDmwStudentService
{
    @Autowired
    private DmwStudentMapper dmwStudentMapper;

    @Autowired
    private IDmwStatusLogService dmwStatusLogService;

    @Override
    public DmwStudent selectDmwStudentByStudentId(Long studentId)
    {
        return dmwStudentMapper.selectDmwStudentByStudentId(studentId);
    }

    @Override
    public List<DmwStudent> selectDmwStudentList(DmwStudent dmwStudent)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        if (loginUser != null) {
            for (SysRole role : loginUser.getUser().getRoles()) {
                if ("headteacher".equals(role.getRoleKey())) {
                    dmwStudent.getParams().put("isDataScope", true);
                    dmwStudent.getParams().put("userId", loginUser.getUserId());
                    break;
                }
            }
        }
        return dmwStudentMapper.selectDmwStudentList(dmwStudent);
    }

    @Override
    public int insertDmwStudent(DmwStudent dmwStudent)
    {
        dmwStudent.setCreateTime(DateUtils.getNowDate());
        return dmwStudentMapper.insertDmwStudent(dmwStudent);
    }

    @Override
    public int updateDmwStudent(DmwStudent dmwStudent)
    {
        dmwStudent.setUpdateTime(DateUtils.getNowDate());
        return dmwStudentMapper.updateDmwStudent(dmwStudent);
    }

    @Override
    public int deleteDmwStudentByStudentIds(Long[] studentIds)
    {
        return dmwStudentMapper.deleteDmwStudentByStudentIds(studentIds);
    }

    @Override
    public int deleteDmwStudentByStudentId(Long studentId)
    {
        return dmwStudentMapper.deleteDmwStudentByStudentId(studentId);
    }

    @Override
    @Transactional
    public int changeStudentStatus(DmwStatusLog statusLog) {
        DmwStudent student = dmwStudentMapper.selectDmwStudentByStudentId(statusLog.getStudentId());
        DmwStudent studentUpdate = new DmwStudent();
        studentUpdate.setStudentId(student.getStudentId());
        studentUpdate.setStudentStatus(statusLog.getCurrentStatus());

        if ("01".equals(statusLog.getCurrentStatus())) {
            studentUpdate.setCurrentStatusReason("");
        } else {
            studentUpdate.setCurrentStatusReason(statusLog.getReason());
        }
        dmwStudentMapper.updateDmwStudent(studentUpdate);

        statusLog.setStudentName(student.getStudentName());
        statusLog.setPreviousStatus(student.getStudentStatus());
        statusLog.setCreateBy(SecurityUtils.getUsername());
        return dmwStatusLogService.insertDmwStatusLog(statusLog);
    }

    @Override
    @Transactional
    public int upgradeAllStudents()
    {
        int graduatedCount = dmwStudentMapper.graduateStudents();
        int upgradedCount = dmwStudentMapper.upgradeOtherStudents();
        return graduatedCount + upgradedCount;
    }

    @Override
    public List<DmwStudent> selectArchivedStudentList(DmwStudent dmwStudent)
    {
        return dmwStudentMapper.selectArchivedStudentList(dmwStudent);
    }

    @Override
    public int restoreStudent(DmwStudent dmwStudent)
    {
        dmwStudent.setDelFlag("0");
        dmwStudent.setStudentStatus("01");
        dmwStudent.setCurrentStatusReason("");
        dmwStudent.setUpdateTime(DateUtils.getNowDate());
        dmwStudent.setUpdateBy(SecurityUtils.getUsername());
        return dmwStudentMapper.updateDmwStudent(dmwStudent);
    }

    /**
     * 【新增】获取首页仪表盘统计数据
     */
    @Override
    public Map<String, Object> getDashboardStatistics()
    {
        return dmwStudentMapper.getDashboardStatistics();
    }

    /**
     * 【新增】获取六困生类型分布数据
     */
    @Override
    public List<Map<String, Object>> getHardshipDistribution()
    {
        return dmwStudentMapper.getHardshipDistribution();
    }

    /**
     * 【新增】获取年级分布数据
     */
    @Override
    public List<Map<String, Object>> getGradeDistribution()
    {
        return dmwStudentMapper.getGradeDistribution();
    }

    /**
     * 【新增】获取学生状态变更趋势数据
     */
    @Override
    public List<Map<String, Object>> getStatusTrend(int months)
    {
        return dmwStudentMapper.getStatusTrend(months);
    }

    /**
     * 【新增】获取约谈记录统计数据
     */
    @Override
    public List<Map<String, Object>> getInterviewStats(int months)
    {
        return dmwStudentMapper.getInterviewStats(months);
    }

    /**
     * 【新增】获取班级困雾学生分布数据
     */
    @Override
    public List<Map<String, Object>> getClassHardshipDistribution()
    {
        return dmwStudentMapper.getClassHardshipDistribution();
    }
}
