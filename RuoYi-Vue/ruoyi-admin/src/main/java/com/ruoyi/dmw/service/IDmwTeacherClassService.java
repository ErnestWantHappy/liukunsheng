package com.ruoyi.dmw.service;

import java.util.List;
import com.ruoyi.dmw.domain.DmwTeacherClass;

/**
 * 教师任教管理Service接口
 * 
 * @author ruoyi
 * @date 2025-07-22
 */
public interface IDmwTeacherClassService 
{
    /**
     * 查询教师任教管理
     * 
     * @param id 教师任教管理主键
     * @return 教师任教管理
     */
    public DmwTeacherClass selectDmwTeacherClassById(Long id);

    /**
     * 查询教师任教管理列表
     * 
     * @param dmwTeacherClass 教师任教管理
     * @return 教师任教管理集合
     */
    public List<DmwTeacherClass> selectDmwTeacherClassList(DmwTeacherClass dmwTeacherClass);

    /**
     * 新增教师任教管理
     * 
     * @param dmwTeacherClass 教师任教管理
     * @return 结果
     */
    public int insertDmwTeacherClass(DmwTeacherClass dmwTeacherClass);

    /**
     * 修改教师任教管理
     * 
     * @param dmwTeacherClass 教师任教管理
     * @return 结果
     */
    public int updateDmwTeacherClass(DmwTeacherClass dmwTeacherClass);

    /**
     * 批量删除教师任教管理
     * 
     * @param ids 需要删除的教师任教管理主键集合
     * @return 结果
     */
    public int deleteDmwTeacherClassByIds(Long[] ids);

    /**
     * 删除教师任教管理信息
     * 
     * @param id 教师任教管理主键
     * @return 结果
     */
    public int deleteDmwTeacherClassById(Long id);
}
