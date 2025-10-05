package com.ruoyi.dmw.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生信息变更日志实体
 */
public class DmwStudentLog extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 日志ID */
    private Long logId;

    /** 学生ID */
    private Long studentId;

    /** 变更字段 */
    private String changeField;

    /** 变更前内容 */
    private String previousValue;

    /** 变更后内容 */
    private String currentValue;

    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getChangeField() {
        return changeField;
    }

    public void setChangeField(String changeField) {
        this.changeField = changeField;
    }

    public String getPreviousValue() {
        return previousValue;
    }

    public void setPreviousValue(String previousValue) {
        this.previousValue = previousValue;
    }

    public String getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(String currentValue) {
        this.currentValue = currentValue;
    }
}
