package com.ruoyi.dmw.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysUser; // <-- 【新增】导入SysUser类

/**
 * 教师任教管理对象 dmw_teacher_class
 *
 * @author ruoyi
 * @date 2025-07-22
 */
public class DmwTeacherClass extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 教师用户ID (关联sys_user) */
    @Excel(name = "教师用户ID (关联sys_user)")
    private Long userId;

    /** 年级ID */
    @Excel(name = "年级ID")
    private Long gradeId;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long classId;

    /** 【新增】关联的用户对象 */
    private SysUser user;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
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

    // --- 【新增】user 属性的 getter 和 setter ---
    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }
    // -----------------------------------------

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("gradeId", getGradeId())
                .append("classId", getClassId())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .append("user", getUser()) // <-- 【新增】
                .toString();
    }
}
