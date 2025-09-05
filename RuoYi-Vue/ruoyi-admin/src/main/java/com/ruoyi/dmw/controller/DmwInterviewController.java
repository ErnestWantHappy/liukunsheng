package com.ruoyi.dmw.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.dmw.domain.DmwInterview;
import com.ruoyi.dmw.service.IDmwInterviewService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 六困生-约谈记录Controller
 * 
 * @author zdx
 * @date 2025-07-19
 */
@RestController
@RequestMapping("/dmw/interview")
public class DmwInterviewController extends BaseController
{
    @Autowired
    private IDmwInterviewService dmwInterviewService;

    /**
     * 查询六困生-约谈记录列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:interview:list')")
    @GetMapping("/list")
    public TableDataInfo list(DmwInterview dmwInterview)
    {
        startPage();
        List<DmwInterview> list = dmwInterviewService.selectDmwInterviewList(dmwInterview);
        return getDataTable(list);
    }

    /**
     * 导出六困生-约谈记录列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:interview:export')")
    @Log(title = "六困生-约谈记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DmwInterview dmwInterview)
    {
        List<DmwInterview> list = dmwInterviewService.selectDmwInterviewList(dmwInterview);
        ExcelUtil<DmwInterview> util = new ExcelUtil<DmwInterview>(DmwInterview.class);
        util.exportExcel(response, list, "六困生-约谈记录数据");
    }

    /**
     * 获取六困生-约谈记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('dmw:interview:query')")
    @GetMapping(value = "/{interviewId}")
    public AjaxResult getInfo(@PathVariable("interviewId") Long interviewId)
    {
        return success(dmwInterviewService.selectDmwInterviewByInterviewId(interviewId));
    }

    /**
     * 新增六困生-约谈记录
     */
    @PreAuthorize("@ss.hasPermi('dmw:interview:add')")
    @Log(title = "六困生-约谈记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DmwInterview dmwInterview)
    {
        return toAjax(dmwInterviewService.insertDmwInterview(dmwInterview));
    }

    /**
     * 修改六困生-约谈记录
     */
    @PreAuthorize("@ss.hasPermi('dmw:interview:edit')")
    @Log(title = "六困生-约谈记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DmwInterview dmwInterview)
    {
        return toAjax(dmwInterviewService.updateDmwInterview(dmwInterview));
    }

    /**
     * 删除六困生-约谈记录
     */
    @PreAuthorize("@ss.hasPermi('dmw:interview:remove')")
    @Log(title = "六困生-约谈记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{interviewIds}")
    public AjaxResult remove(@PathVariable Long[] interviewIds)
    {
        return toAjax(dmwInterviewService.deleteDmwInterviewByInterviewIds(interviewIds));
    }
}
