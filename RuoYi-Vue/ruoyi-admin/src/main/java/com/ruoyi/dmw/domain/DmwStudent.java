package com.ruoyi.dmw.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 六困生-学生信息对象 dmw_student
 * * @author zdx
 * @date 2025-07-19
 */
public class DmwStudent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生ID */
    private Long studentId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCardNo;

    /** 学部类型 (1=小学部 2=初中部) */
    @Excel(name = "学部类型 (1=小学部 2=初中部)")
    private String deptType;

    /** 年级ID */
    @Excel(name = "年级ID")
    private Long gradeId;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long classId;

    /** 性别 (0=男 1=女 2=未知) */
    @Excel(name = "性别 (0=男 1=女 2=未知)")
    private String gender;

    /** 是否独生 (Y=是 N=否) */
    @Excel(name = "是否独生 (Y=是 N=否)")
    private String isOnlyChild;

    /** 身体状况 (字典 dmw_health_status) */
    @Excel(name = "身体状况 (字典 dmw_health_status)")
    private String healthStatus;

    /** 家庭地址 */
    @Excel(name = "家庭地址")
    private String address;

    /** 家庭结构 (字典 dmw_family_structure) */
    @Excel(name = "家庭结构 (字典 dmw_family_structure)")
    private String familyStructure;

    /** 家庭氛围 (字典 dmw_family_atmosphere) */
    @Excel(name = "家庭氛围 (字典 dmw_family_atmosphere)")
    private String familyAtmosphere;

    /** 经济情况 (字典 dmw_economic_status) */
    @Excel(name = "经济情况 (字典 dmw_economic_status)")
    private String economicStatus;

    /** 父母职业 */
    @Excel(name = "父母职业")
    private String parentOccupation;

    /** 寄养和留守经历 (Y=是 N=否) */
    @Excel(name = "寄养和留守经历 (Y=是 N=否)")
    private String fosterLeftBehind;

    /** 自伤自残史 (字典 dmw_self_harm_history) */
    @Excel(name = "自伤自残史 (字典 dmw_self_harm_history)")
    private String selfHarmHistory;

    /** 六困生类型 (字典 dmw_hardship_type) */
    @Excel(name = "六困生类型 (字典 dmw_hardship_type)")
    private String hardshipType;

    /** 学生详细情况说明 */
    @Excel(name = "学生详细情况说明")
    private String studentDetails;

    /** 应对措施 */
    @Excel(name = "应对措施")
    private String countermeasures;

    /** 教师上报信息 */
    @Excel(name = "教师上报信息")
    private String teacherReportInfo;

    /** 学生状态 (01=正常 02=请长假 03=休学 04=毕业 05=转学) */
    @Excel(name = "学生状态 (01=正常 02=请长假 03=休学 04=毕业 05=转学)")
    private String studentStatus;

    /** 【新增】当前状态原因（请假/休学） */
    @Excel(name = "当前状态原因")
    private String currentStatusReason;

    /** 上报状态 (0=草稿 1=已上报) */
    @Excel(name = "上报状态 (0=草稿 1=已上报)")
    private String reportStatus;

    /** 最近一次记录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最近一次记录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastRecordTime;

    /** 学生照片 */
    @Excel(name = "学生照片")
    private String photoUrl;

    /** 删除标志 (0=存在 2=删除) */
    private String delFlag;


    // --- Getter and Setter ---

    public String getCurrentStatusReason() {
        return currentStatusReason;
    }

    public void setCurrentStatusReason(String currentStatusReason) {
        this.currentStatusReason = currentStatusReason;
    }

    public void setStudentId(Long studentId)
    {
        this.studentId = studentId;
    }

    public Long getStudentId()
    {
        return studentId;
    }

    public void setStudentName(String studentName)
    {
        this.studentName = studentName;
    }

    public String getStudentName()
    {
        return studentName;
    }

    public void setIdCardNo(String idCardNo)
    {
        this.idCardNo = idCardNo;
    }

    public String getIdCardNo()
    {
        return idCardNo;
    }

    public void setDeptType(String deptType)
    {
        this.deptType = deptType;
    }

    public String getDeptType()
    {
        return deptType;
    }

    public void setGradeId(Long gradeId)
    {
        this.gradeId = gradeId;
    }

    public Long getGradeId()
    {
        return gradeId;
    }

    public void setClassId(Long classId)
    {
        this.classId = classId;
    }

    public Long getClassId()
    {
        return classId;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getGender()
    {
        return gender;
    }

    public void setIsOnlyChild(String isOnlyChild)
    {
        this.isOnlyChild = isOnlyChild;
    }

    public String getIsOnlyChild()
    {
        return isOnlyChild;
    }

    public void setHealthStatus(String healthStatus)
    {
        this.healthStatus = healthStatus;
    }

    public String getHealthStatus()
    {
        return healthStatus;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }

    public void setFamilyStructure(String familyStructure)
    {
        this.familyStructure = familyStructure;
    }

    public String getFamilyStructure()
    {
        return familyStructure;
    }

    public void setFamilyAtmosphere(String familyAtmosphere)
    {
        this.familyAtmosphere = familyAtmosphere;
    }

    public String getFamilyAtmosphere()
    {
        return familyAtmosphere;
    }

    public void setEconomicStatus(String economicStatus)
    {
        this.economicStatus = economicStatus;
    }

    public String getEconomicStatus()
    {
        return economicStatus;
    }

    public void setParentOccupation(String parentOccupation)
    {
        this.parentOccupation = parentOccupation;
    }

    public String getParentOccupation()
    {
        return parentOccupation;
    }

    public void setFosterLeftBehind(String fosterLeftBehind)
    {
        this.fosterLeftBehind = fosterLeftBehind;
    }

    public String getFosterLeftBehind()
    {
        return fosterLeftBehind;
    }

    public void setSelfHarmHistory(String selfHarmHistory)
    {
        this.selfHarmHistory = selfHarmHistory;
    }

    public String getSelfHarmHistory()
    {
        return selfHarmHistory;
    }

    public void setHardshipType(String hardshipType)
    {
        this.hardshipType = hardshipType;
    }

    public String getHardshipType()
    {
        return hardshipType;
    }

    public void setStudentDetails(String studentDetails)
    {
        this.studentDetails = studentDetails;
    }

    public String getStudentDetails()
    {
        return studentDetails;
    }

    public void setCountermeasures(String countermeasures)
    {
        this.countermeasures = countermeasures;
    }

    public String getCountermeasures()
    {
        return countermeasures;
    }

    public void setTeacherReportInfo(String teacherReportInfo)
    {
        this.teacherReportInfo = teacherReportInfo;
    }

    public String getTeacherReportInfo()
    {
        return teacherReportInfo;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public void setStudentStatus(String studentStatus)
    {
        this.studentStatus = studentStatus;
    }

    public String getStudentStatus()
    {
        return studentStatus;
    }

    public void setReportStatus(String reportStatus)
    {
        this.reportStatus = reportStatus;
    }

    public String getReportStatus()
    {
        return reportStatus;
    }

    public void setLastRecordTime(Date lastRecordTime)
    {
        this.lastRecordTime = lastRecordTime;
    }

    public Date getLastRecordTime()
    {
        return lastRecordTime;
    }

    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("studentId", getStudentId())
                .append("studentName", getStudentName())
                .append("idCardNo", getIdCardNo())
                .append("deptType", getDeptType())
                .append("gradeId", getGradeId())
                .append("classId", getClassId())
                .append("gender", getGender())
                .append("isOnlyChild", getIsOnlyChild())
                .append("healthStatus", getHealthStatus())
                .append("address", getAddress())
                .append("familyStructure", getFamilyStructure())
                .append("familyAtmosphere", getFamilyAtmosphere())
                .append("economicStatus", getEconomicStatus())
                .append("parentOccupation", getParentOccupation())
                .append("fosterLeftBehind", getFosterLeftBehind())
                .append("selfHarmHistory", getSelfHarmHistory())
                .append("hardshipType", getHardshipType())
                .append("studentDetails", getStudentDetails())
                .append("countermeasures", getCountermeasures())
                .append("teacherReportInfo", getTeacherReportInfo())
                .append("photoUrl", getPhotoUrl())
                .append("studentStatus", getStudentStatus())
                .append("currentStatusReason", getCurrentStatusReason()) // <-- 已添加
                .append("reportStatus", getReportStatus())
                .append("lastRecordTime", getLastRecordTime())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
