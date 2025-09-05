package com.ruoyi.dmw.mapper;

import java.util.List;
import com.ruoyi.dmw.domain.DmwInterview;

/**
 * 六困生-约谈记录Mapper接口
 * 
 * @author zdx
 * @date 2025-07-19
 */
public interface DmwInterviewMapper 
{
    /**
     * 查询六困生-约谈记录
     * 
     * @param interviewId 六困生-约谈记录主键
     * @return 六困生-约谈记录
     */
    public DmwInterview selectDmwInterviewByInterviewId(Long interviewId);

    /**
     * 查询六困生-约谈记录列表
     * 
     * @param dmwInterview 六困生-约谈记录
     * @return 六困生-约谈记录集合
     */
    public List<DmwInterview> selectDmwInterviewList(DmwInterview dmwInterview);

    /**
     * 新增六困生-约谈记录
     * 
     * @param dmwInterview 六困生-约谈记录
     * @return 结果
     */
    public int insertDmwInterview(DmwInterview dmwInterview);

    /**
     * 修改六困生-约谈记录
     * 
     * @param dmwInterview 六困生-约谈记录
     * @return 结果
     */
    public int updateDmwInterview(DmwInterview dmwInterview);

    /**
     * 删除六困生-约谈记录
     * 
     * @param interviewId 六困生-约谈记录主键
     * @return 结果
     */
    public int deleteDmwInterviewByInterviewId(Long interviewId);

    /**
     * 批量删除六困生-约谈记录
     * 
     * @param interviewIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDmwInterviewByInterviewIds(Long[] interviewIds);
}
