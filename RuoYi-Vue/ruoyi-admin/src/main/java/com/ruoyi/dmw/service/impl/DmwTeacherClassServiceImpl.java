package com.ruoyi.dmw.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dmw.mapper.DmwTeacherClassMapper;
import com.ruoyi.dmw.domain.DmwTeacherClass;
import com.ruoyi.dmw.service.IDmwTeacherClassService;

/**
 * 教师任教管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-07-22
 */
@Service
public class DmwTeacherClassServiceImpl implements IDmwTeacherClassService 
{
    @Autowired
    private DmwTeacherClassMapper dmwTeacherClassMapper;

    /**
     * 查询教师任教管理
     * 
     * @param id 教师任教管理主键
     * @return 教师任教管理
     */
    @Override
    public DmwTeacherClass selectDmwTeacherClassById(Long id)
    {
        return dmwTeacherClassMapper.selectDmwTeacherClassById(id);
    }

    /**
     * 查询教师任教管理列表
     * 
     * @param dmwTeacherClass 教师任教管理
     * @return 教师任教管理
     */
    @Override
    public List<DmwTeacherClass> selectDmwTeacherClassList(DmwTeacherClass dmwTeacherClass)
    {
        return dmwTeacherClassMapper.selectDmwTeacherClassList(dmwTeacherClass);
    }

    /**
     * 新增教师任教管理
     * 
     * @param dmwTeacherClass 教师任教管理
     * @return 结果
     */
    @Override
    public int insertDmwTeacherClass(DmwTeacherClass dmwTeacherClass)
    {
        dmwTeacherClass.setCreateTime(DateUtils.getNowDate());
        return dmwTeacherClassMapper.insertDmwTeacherClass(dmwTeacherClass);
    }

    /**
     * 修改教师任教管理
     * 
     * @param dmwTeacherClass 教师任教管理
     * @return 结果
     */
    @Override
    public int updateDmwTeacherClass(DmwTeacherClass dmwTeacherClass)
    {
        dmwTeacherClass.setUpdateTime(DateUtils.getNowDate());
        return dmwTeacherClassMapper.updateDmwTeacherClass(dmwTeacherClass);
    }

    /**
     * 批量删除教师任教管理
     * 
     * @param ids 需要删除的教师任教管理主键
     * @return 结果
     */
    @Override
    public int deleteDmwTeacherClassByIds(Long[] ids)
    {
        return dmwTeacherClassMapper.deleteDmwTeacherClassByIds(ids);
    }

    /**
     * 删除教师任教管理信息
     * 
     * @param id 教师任教管理主键
     * @return 结果
     */
    @Override
    public int deleteDmwTeacherClassById(Long id)
    {
        return dmwTeacherClassMapper.deleteDmwTeacherClassById(id);
    }
}
