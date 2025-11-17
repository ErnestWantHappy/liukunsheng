package com.ruoyi.dmw.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 学生历史轨迹统一视图对象
 */
public class StudentTimelineEvent implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 格式：{eventType}-{源对象主键}
     */
    private String eventId;

    /**
     * studentLog / statusLog / interview
     */
    private String eventType;

    private String eventTitle;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date eventTime;

    private String operator;

    private String changeField;

    private String changeFieldLabel;

    private String previousValue;

    private String previousLabel;

    private String currentValue;

    private String currentLabel;

    private String participants;

    private String recorder;

    private String content;

    private String location;

    private String locationLabel;

    private String remark;

    private List<AttachmentInfo> attachments = new ArrayList<>();

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public Date getEventTime() {
        return eventTime;
    }

    public void setEventTime(Date eventTime) {
        this.eventTime = eventTime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getChangeField() {
        return changeField;
    }

    public void setChangeField(String changeField) {
        this.changeField = changeField;
    }

    public String getChangeFieldLabel() {
        return changeFieldLabel;
    }

    public void setChangeFieldLabel(String changeFieldLabel) {
        this.changeFieldLabel = changeFieldLabel;
    }

    public String getPreviousValue() {
        return previousValue;
    }

    public void setPreviousValue(String previousValue) {
        this.previousValue = previousValue;
    }

    public String getPreviousLabel() {
        return previousLabel;
    }

    public void setPreviousLabel(String previousLabel) {
        this.previousLabel = previousLabel;
    }

    public String getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(String currentValue) {
        this.currentValue = currentValue;
    }

    public String getCurrentLabel() {
        return currentLabel;
    }

    public void setCurrentLabel(String currentLabel) {
        this.currentLabel = currentLabel;
    }

    public String getParticipants() {
        return participants;
    }

    public void setParticipants(String participants) {
        this.participants = participants;
    }

    public String getRecorder() {
        return recorder;
    }

    public void setRecorder(String recorder) {
        this.recorder = recorder;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocationLabel() {
        return locationLabel;
    }

    public void setLocationLabel(String locationLabel) {
        this.locationLabel = locationLabel;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<AttachmentInfo> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<AttachmentInfo> attachments) {
        this.attachments = attachments == null ? new ArrayList<>() : attachments;
    }
}
