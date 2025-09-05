package com.ruoyi.dmw.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dmw.mapper.DmwInterviewMapper;
import com.ruoyi.dmw.domain.DmwInterview;
import com.ruoyi.dmw.service.IDmwInterviewService;

/**
 * 六困生-约谈记录Service业务层处理
 * 
 * @author zdx
 * @date 2025-07-19
 */
@Service
public class DmwInterviewServiceImpl implements IDmwInterviewService 
{
    @Autowired
    private DmwInterviewMapper dmwInterviewMapper;

    /**
     * 查询六困生-约谈记录
     * 
     * @param interviewId 六困生-约谈记录主键
     * @return 六困生-约谈记录
     */
    @Override
    public DmwInterview selectDmwInterviewByInterviewId(Long interviewId)
    {
        return dmwInterviewMapper.selectDmwInterviewByInterviewId(interviewId);
    }

    /**
     * 查询六困生-约谈记录列表
     * 
     * @param dmwInterview 六困生-约谈记录
     * @return 六困生-约谈记录
     */
    @Override
    public List<DmwInterview> selectDmwInterviewList(DmwInterview dmwInterview)
    {
        return dmwInterviewMapper.selectDmwInterviewList(dmwInterview);
    }

    /**
     * 新增六困生-约谈记录
     * 
     * @param dmwInterview 六困生-约谈记录
     * @return 结果
     */
    @Override
    public int insertDmwInterview(DmwInterview dmwInterview)
    {
        dmwInterview.setCreateTime(DateUtils.getNowDate());
        return dmwInterviewMapper.insertDmwInterview(dmwInterview);
    }

    /**
     * 修改六困生-约谈记录
     * 
     * @param dmwInterview 六困生-约谈记录
     * @return 结果
     */
    @Override
    public int updateDmwInterview(DmwInterview dmwInterview)
    {
        dmwInterview.setUpdateTime(DateUtils.getNowDate());
        return dmwInterviewMapper.updateDmwInterview(dmwInterview);
    }

    /**
     * 批量删除六困生-约谈记录
     * 
     * @param interviewIds 需要删除的六困生-约谈记录主键
     * @return 结果
     */
    @Override
    public int deleteDmwInterviewByInterviewIds(Long[] interviewIds)
    {
        return dmwInterviewMapper.deleteDmwInterviewByInterviewIds(interviewIds);
    }

    /**
     * 删除六困生-约谈记录信息
     * 
     * @param interviewId 六困生-约谈记录主键
     * @return 结果
     */
    @Override
    public int deleteDmwInterviewByInterviewId(Long interviewId)
    {
        return dmwInterviewMapper.deleteDmwInterviewByInterviewId(interviewId);
    }
}
