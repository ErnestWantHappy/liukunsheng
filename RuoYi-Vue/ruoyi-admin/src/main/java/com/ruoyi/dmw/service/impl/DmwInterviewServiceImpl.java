package com.ruoyi.dmw.service.impl;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.model.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dmw.mapper.DmwInterviewMapper;
import com.ruoyi.dmw.mapper.DmwStudentMapper;
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

    @Autowired
    private DmwStudentMapper dmwStudentMapper;

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
        LoginUser loginUser = SecurityUtils.getLoginUser();
        if (loginUser != null)
        {
            for (SysRole role : loginUser.getUser().getRoles())
            {
                if ("headteacher".equals(role.getRoleKey()))
                {
                    // 班主任查看列表时屏蔽心理老师创建的约谈
                    dmwInterview.getParams().put("excludeRoleKey", "psychologist");
                    break;
                }
            }
        }
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
        String username = SecurityUtils.getUsername();
        Date now = DateUtils.getNowDate();
        dmwInterview.setCreateBy(username);
        dmwInterview.setCreateTime(now);
        int rows = dmwInterviewMapper.insertDmwInterview(dmwInterview);
        if (rows > 0)
        {
            touchStudentOperateMeta(dmwInterview.getStudentId(), username, now);
        }
        return rows;
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
        String username = SecurityUtils.getUsername();
        Date now = DateUtils.getNowDate();
        dmwInterview.setUpdateBy(username);
        dmwInterview.setUpdateTime(now);
        int rows = dmwInterviewMapper.updateDmwInterview(dmwInterview);
        if (rows > 0)
        {
            touchStudentOperateMeta(dmwInterview.getStudentId(), username, now);
        }
        return rows;
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

    private void touchStudentOperateMeta(Long studentId, String username, Date operateTime)
    {
        if (studentId == null)
        {
            return;
        }
        // 同步更新学生档案的操作人信息
        dmwStudentMapper.updateStudentOperateMeta(studentId, username, operateTime);
    }
}