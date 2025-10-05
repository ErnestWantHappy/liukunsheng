package com.ruoyi.dmw.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.dmw.domain.DmwStatusLog;
import com.ruoyi.dmw.domain.DmwStudentLog;
import com.ruoyi.dmw.service.IDmwStatusLogService;
import com.ruoyi.dmw.service.IDmwStudentLogService;
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

    @Autowired
    private IDmwStudentLogService dmwStudentLogService;

    @Override
    public DmwStudent selectDmwStudentByStudentId(Long studentId)
    {
        return dmwStudentMapper.selectDmwStudentByStudentId(studentId);
    }

    @Override
    public List<DmwStudent> selectDmwStudentList(DmwStudent dmwStudent)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        // 班主任角色需要根据班级权限自动收敛数据范围
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
        Date now = DateUtils.getNowDate();
        // 自动回填创建人和时间等审计字段
        String username = SecurityUtils.getUsername();
        dmwStudent.setCreateBy(username);
        dmwStudent.setCreateTime(now);
        dmwStudent.setUpdateBy(username);
        dmwStudent.setUpdateTime(now);
        return dmwStudentMapper.insertDmwStudent(dmwStudent);
    }

    @Override
    public int updateDmwStudent(DmwStudent dmwStudent)
    {
        if (dmwStudent.getStudentId() == null)
        {
            return 0;
        }
        DmwStudent before = dmwStudentMapper.selectDmwStudentByStudentId(dmwStudent.getStudentId());
        // 保存更新前的数据用于生成变更记录
        Date now = DateUtils.getNowDate();
        String username = SecurityUtils.getUsername();
        dmwStudent.setUpdateBy(username);
        dmwStudent.setUpdateTime(now);
        int rows = dmwStudentMapper.updateDmwStudent(dmwStudent);
        // 更新成功后再追加学生变更日志
        if (rows > 0 && before != null)
        {
            DmwStudent after = dmwStudentMapper.selectDmwStudentByStudentId(dmwStudent.getStudentId());
            recordStudentChange(before, after, username, now);
        }
        return rows;
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
            // 回到正常状态时需要清空状态原因
            studentUpdate.setCurrentStatusReason("");
        } else {
            studentUpdate.setCurrentStatusReason(statusLog.getReason());
        }
        Date now = DateUtils.getNowDate();
        String username = SecurityUtils.getUsername();
        studentUpdate.setUpdateTime(now);
        studentUpdate.setUpdateBy(username);
        int rows = dmwStudentMapper.updateDmwStudent(studentUpdate);
        // 持久化状态变更，返回影响行数

        statusLog.setStudentName(student.getStudentName());
        statusLog.setPreviousStatus(student.getStudentStatus());
        statusLog.setCreateBy(username);
        if (rows > 0)
        {
            recordStudentChange(student.getStudentId(), "student_status", student.getStudentStatus(), statusLog.getCurrentStatus(), username, now);
        }
        return dmwStatusLogService.insertDmwStatusLog(statusLog);
    }

    @Override
    @Transactional
    public int upgradeAllStudents()
    {
        int graduatedCount = dmwStudentMapper.graduateStudents();
        // 先处理毕业班学生并统计数量
        int upgradedCount = dmwStudentMapper.upgradeOtherStudents();
        // 再批量升级其余年级的学生
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

    private void recordStudentChange(DmwStudent before, DmwStudent after, String operator, Date operateTime)
    {
        if (before == null || after == null)
        {
            return;
        }
        Long studentId = before.getStudentId() != null ? before.getStudentId() : after.getStudentId();
        if (studentId == null)
        {
            return;
        }
        recordStudentChange(studentId, "hardship_type", before.getHardshipType(), after.getHardshipType(), operator, operateTime);
        recordStudentChange(studentId, "student_status", before.getStudentStatus(), after.getStudentStatus(), operator, operateTime);
    }

    private void recordStudentChange(Long studentId, String field, String previous, String current, String operator, Date operateTime)
    {
        if (Objects.equals(previous, current))
        {
            // 未发生变化时直接跳过，避免冗余日志
            return;
        }
        DmwStudentLog log = new DmwStudentLog();
        log.setStudentId(studentId);
        log.setChangeField(field);
        log.setPreviousValue(previous == null ? "" : previous);
        log.setCurrentValue(current == null ? "" : current);
        log.setCreateBy(operator);
        log.setCreateTime(operateTime);
        dmwStudentLogService.insertStudentLog(log);
    }

    /**
     * 【新增】获取首页仪表盘统计数据
     */
    @Override
    public Map<String, Object> getDashboardStatistics(String deptType, Integer gradeId, String hardshipType)
    {
        // Mapper 已处理筛选条件，这里直接返回结果集
        return dmwStudentMapper.getDashboardStatistics(deptType, gradeId, hardshipType);
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

    @Override
    public List<Map<String, Object>> getHardshipHierarchyStats(String deptType, Integer gradeId, String hardshipType)
    {
        return dmwStudentMapper.getHardshipHierarchyStats(deptType, gradeId, hardshipType);
    }

    @Override
    public List<DmwStudentLog> getStudentLogs(Long studentId)
    {
        return dmwStudentLogService.selectLogsByStudentId(studentId);
    }
}
