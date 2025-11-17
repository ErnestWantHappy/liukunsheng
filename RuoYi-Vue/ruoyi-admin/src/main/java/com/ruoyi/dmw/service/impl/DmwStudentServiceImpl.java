package com.ruoyi.dmw.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.DictUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.dmw.domain.DmwInterview;
import com.ruoyi.dmw.domain.DmwStatusLog;
import com.ruoyi.dmw.domain.DmwStudentLog;
import com.ruoyi.dmw.domain.vo.AttachmentInfo;
import com.ruoyi.dmw.domain.vo.StudentTimelineEvent;
import com.ruoyi.dmw.service.IDmwInterviewService;
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

    @Autowired
    private IDmwInterviewService dmwInterviewService;

    private static final Map<String, Function<DmwStudent, Object>> STUDENT_FIELD_EXTRACTORS = new LinkedHashMap<>();
    private static final Map<String, String> STUDENT_FIELD_LABELS = new LinkedHashMap<>();
    private static final Map<String, String> STUDENT_FIELD_DICTS = new LinkedHashMap<>();

    static
    {
        registerField("student_name", "学生姓名", null, DmwStudent::getStudentName);
        registerField("id_card_no", "身份证号", null, DmwStudent::getIdCardNo);
        registerField("dept_type", "学部", "dmw_dept_type", DmwStudent::getDeptType);
        registerField("grade_id", "年级", null, DmwStudent::getGradeId);
        registerField("class_id", "班级", null, DmwStudent::getClassId);
        registerField("gender", "性别", "sys_user_sex", DmwStudent::getGender);
        registerField("is_only_child", "是否独生", "dmw_yes_no", DmwStudent::getIsOnlyChild);
        registerField("health_status", "身体状况", "dmw_health_status", DmwStudent::getHealthStatus);
        registerField("address", "家庭地址", null, DmwStudent::getAddress);
        registerField("family_structure", "家庭结构", "dmw_family_structure", DmwStudent::getFamilyStructure);
        registerField("family_atmosphere", "家庭氛围", "dmw_family_atmosphere", DmwStudent::getFamilyAtmosphere);
        registerField("economic_status", "经济情况", "dmw_economic_status", DmwStudent::getEconomicStatus);
        registerField("parent_occupation", "父母职业", null, DmwStudent::getParentOccupation);
        registerField("foster_left_behind", "寄养/留守经历", "dmw_yes_no", DmwStudent::getFosterLeftBehind);
        registerField("self_harm_history", "自伤自残史", "dmw_self_harm_history", DmwStudent::getSelfHarmHistory);
        registerField("hardship_type", "六困生类型", "dmw_hardship_type", DmwStudent::getHardshipType);
        registerField("student_details", "学生详细情况", null, DmwStudent::getStudentDetails);
        registerField("countermeasures", "应对措施", null, DmwStudent::getCountermeasures);
        registerField("teacher_report_info", "教师上报信息", null, DmwStudent::getTeacherReportInfo);
        registerField("student_status", "学生状态", "dmw_student_status", DmwStudent::getStudentStatus);
        registerField("current_status_reason", "状态原因", null, DmwStudent::getCurrentStatusReason);
        registerField("report_status", "上报状态", "dmw_report_status", DmwStudent::getReportStatus);
        registerField("last_record_time", "最近记录时间", null, DmwStudent::getLastRecordTime);
        registerField("remark", "备注", null, DmwStudent::getRemark);
    }

    private static void registerField(String field, String label, String dictType, Function<DmwStudent, Object> extractor)
    {
        STUDENT_FIELD_EXTRACTORS.put(field, extractor);
        STUDENT_FIELD_LABELS.put(field, label);
        if (StringUtils.isNotBlank(dictType))
        {
            STUDENT_FIELD_DICTS.put(field, dictType);
        }
    }

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
            recordStudentChanges(before, after, username, now);
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

    private void recordStudentChanges(DmwStudent before, DmwStudent after, String operator, Date operateTime)
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
        STUDENT_FIELD_EXTRACTORS.forEach((field, extractor) -> {
            String previous = stringifyValue(extractor.apply(before));
            String current = stringifyValue(extractor.apply(after));
            recordStudentChange(studentId, field, previous, current, operator, operateTime);
        });
    }

    private String stringifyValue(Object value)
    {
        if (value == null)
        {
            return "";
        }
        if (value instanceof Date)
        {
            return DateUtils.parseDateToStr("yyyy-MM-dd HH:mm:ss", (Date) value);
        }
        return String.valueOf(value);
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

    @Override
    public List<StudentTimelineEvent> getStudentTimeline(Long studentId)
    {
        List<StudentTimelineEvent> events = new ArrayList<>();
        List<DmwStudentLog> studentLogs = dmwStudentLogService.selectLogsByStudentId(studentId);
        for (DmwStudentLog log : studentLogs)
        {
            StudentTimelineEvent event = new StudentTimelineEvent();
            event.setEventId("studentLog-" + log.getLogId());
            event.setEventType("studentLog");
            event.setEventTitle("学生信息变更");
            event.setEventTime(log.getCreateTime());
            event.setOperator(log.getCreateBy());
            event.setChangeField(log.getChangeField());
            event.setChangeFieldLabel(STUDENT_FIELD_LABELS.getOrDefault(log.getChangeField(), log.getChangeField()));
            event.setPreviousValue(log.getPreviousValue());
            event.setPreviousLabel(resolveFieldValueLabel(log.getChangeField(), log.getPreviousValue()));
            event.setCurrentValue(log.getCurrentValue());
            event.setCurrentLabel(resolveFieldValueLabel(log.getChangeField(), log.getCurrentValue()));
            events.add(event);
        }
        List<DmwStatusLog> statusLogs = dmwStatusLogService.selectLogsByStudentId(studentId);
        for (DmwStatusLog statusLog : statusLogs)
        {
            StudentTimelineEvent event = new StudentTimelineEvent();
            event.setEventId("statusLog-" + statusLog.getLogId());
            event.setEventType("statusLog");
            event.setEventTitle("学生状态调整");
            event.setEventTime(firstNonNull(statusLog.getCreateTime(), statusLog.getStartDate(), statusLog.getEndDate()));
            event.setOperator(statusLog.getCreateBy());
            event.setChangeField("student_status");
            event.setChangeFieldLabel(STUDENT_FIELD_LABELS.get("student_status"));
            event.setPreviousValue(statusLog.getPreviousStatus());
            event.setPreviousLabel(resolveFieldValueLabel("student_status", statusLog.getPreviousStatus()));
            event.setCurrentValue(statusLog.getCurrentStatus());
            event.setCurrentLabel(resolveFieldValueLabel("student_status", statusLog.getCurrentStatus()));
            event.setRemark(statusLog.getReason());
            event.setAttachments(parseAttachments(statusLog.getAttachmentUrl()));
            events.add(event);
        }
        DmwInterview query = new DmwInterview();
        query.setStudentId(studentId);
        List<DmwInterview> interviews = dmwInterviewService.selectDmwInterviewList(query);
        for (DmwInterview interview : interviews)
        {
            StudentTimelineEvent event = new StudentTimelineEvent();
            event.setEventId("interview-" + interview.getInterviewId());
            event.setEventType("interview");
            event.setEventTitle("约谈记录");
            event.setEventTime(interview.getInterviewTime());
            event.setOperator(interview.getRecorder());
            event.setParticipants(interview.getParticipants());
            event.setContent(interview.getContent());
            event.setLocation(interview.getLocation());
            event.setLocationLabel(DictUtils.getDictLabel("dmw_interview_location", interview.getLocation()));
            event.setAttachments(parseAttachments(interview.getAttachmentUrl()));
            events.add(event);
        }
        events.sort((a, b) -> {
            Date t1 = a.getEventTime();
            Date t2 = b.getEventTime();
            if (t1 == null && t2 == null)
            {
                return 0;
            }
            if (t1 == null)
            {
                return 1;
            }
            if (t2 == null)
            {
                return -1;
            }
            return t2.compareTo(t1);
        });
        return events;
    }

    private List<AttachmentInfo> parseAttachments(String raw)
    {
        return new ArrayList<>(AttachmentInfo.parseList(raw));
    }

    private String resolveFieldValueLabel(String fieldKey, String value)
    {
        if (StringUtils.isBlank(value))
        {
            return "";
        }
        String dictType = STUDENT_FIELD_DICTS.get(fieldKey);
        if (StringUtils.isBlank(dictType))
        {
            return value;
        }
        String label = DictUtils.getDictLabel(dictType, value);
        return StringUtils.isNotBlank(label) ? label : value;
    }

    private Date firstNonNull(Date... dates)
    {
        if (dates == null)
        {
            return null;
        }
        for (Date date : dates)
        {
            if (date != null)
            {
                return date;
            }
        }
        return null;
    }
}
