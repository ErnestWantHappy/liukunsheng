package com.ruoyi.dmw.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 六困生-约谈记录对象 dmw_interview
 * * @author zdx
 * @date 2025-07-19
 */
public class DmwInterview extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 约谈ID */
    private Long interviewId;

    /** 关联学生ID */
    @Excel(name = "关联学生ID")
    private Long studentId;

    /** 【新增】关联学生姓名 (用于列表显示, 非数据库字段) */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 约谈时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "约谈时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date interviewTime;

    /** 约谈地点 (字典 dmw_interview_location) */
    @Excel(name = "约谈地点", readConverterExp = "1=家,2=学校,3=线上,4=其它")
    private String location;

    /** 参与人员 */
    @Excel(name = "参与人员")
    private String participants;

    /** 记录人 */
    @Excel(name = "记录人")
    private String recorder;

    /** 记录内容 */
    @Excel(name = "记录内容")
    private String content;

    /** 附件URL */
    @Excel(name = "附件URL")
    private String attachmentUrl;

    // --- Getter and Setter ---

    public void setInterviewId(Long interviewId)
    {
        this.interviewId = interviewId;
    }

    public Long getInterviewId()
    {
        return interviewId;
    }

    public void setStudentId(Long studentId)
    {
        this.studentId = studentId;
    }

    public Long getStudentId()
    {
        return studentId;
    }

    // --- 新增 studentName 的 Getter 和 Setter ---
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    // -----------------------------------------

    public void setInterviewTime(Date interviewTime)
    {
        this.interviewTime = interviewTime;
    }

    public Date getInterviewTime()
    {
        return interviewTime;
    }

    public void setLocation(String location)
    {
        this.location = location;
    }

    public String getLocation()
    {
        return location;
    }

    public void setParticipants(String participants)
    {
        this.participants = participants;
    }

    public String getParticipants()
    {
        return participants;
    }

    public void setRecorder(String recorder)
    {
        this.recorder = recorder;
    }

    public String getRecorder()
    {
        return recorder;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }

    public void setAttachmentUrl(String attachmentUrl)
    {
        this.attachmentUrl = attachmentUrl;
    }

    public String getAttachmentUrl()
    {
        return attachmentUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("interviewId", getInterviewId())
                .append("studentId", getStudentId())
                .append("studentName", getStudentName()) // <-- 已添加
                .append("interviewTime", getInterviewTime())
                .append("location", getLocation())
                .append("participants", getParticipants())
                .append("recorder", getRecorder())
                .append("content", getContent())
                .append("attachmentUrl", getAttachmentUrl())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
