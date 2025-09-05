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
import com.ruoyi.dmw.domain.DmwTeacherClass;
import com.ruoyi.dmw.service.IDmwTeacherClassService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教师任教管理Controller
 * 
 * @author ruoyi
 * @date 2025-07-22
 */
@RestController
@RequestMapping("/dmw/teach")
public class DmwTeacherClassController extends BaseController
{
    @Autowired
    private IDmwTeacherClassService dmwTeacherClassService;

    /**
     * 查询教师任教管理列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:teach:list')")
    @GetMapping("/list")
    public TableDataInfo list(DmwTeacherClass dmwTeacherClass)
    {
        startPage();
        List<DmwTeacherClass> list = dmwTeacherClassService.selectDmwTeacherClassList(dmwTeacherClass);
        return getDataTable(list);
    }

    /**
     * 导出教师任教管理列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:teach:export')")
    @Log(title = "教师任教管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DmwTeacherClass dmwTeacherClass)
    {
        List<DmwTeacherClass> list = dmwTeacherClassService.selectDmwTeacherClassList(dmwTeacherClass);
        ExcelUtil<DmwTeacherClass> util = new ExcelUtil<DmwTeacherClass>(DmwTeacherClass.class);
        util.exportExcel(response, list, "教师任教管理数据");
    }

    /**
     * 获取教师任教管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('dmw:teach:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dmwTeacherClassService.selectDmwTeacherClassById(id));
    }

    /**
     * 新增教师任教管理
     */
    @PreAuthorize("@ss.hasPermi('dmw:teach:add')")
    @Log(title = "教师任教管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DmwTeacherClass dmwTeacherClass)
    {
        return toAjax(dmwTeacherClassService.insertDmwTeacherClass(dmwTeacherClass));
    }

    /**
     * 修改教师任教管理
     */
    @PreAuthorize("@ss.hasPermi('dmw:teach:edit')")
    @Log(title = "教师任教管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DmwTeacherClass dmwTeacherClass)
    {
        return toAjax(dmwTeacherClassService.updateDmwTeacherClass(dmwTeacherClass));
    }

    /**
     * 删除教师任教管理
     */
    @PreAuthorize("@ss.hasPermi('dmw:teach:remove')")
    @Log(title = "教师任教管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dmwTeacherClassService.deleteDmwTeacherClassByIds(ids));
    }

    /**
     * 获取当前登录教师所负责的班级列表
     */
    @GetMapping("/myClasses")
    public AjaxResult getMyClasses()
    {
        DmwTeacherClass params = new DmwTeacherClass();
        params.setUserId(getUserId()); // getUserId() 是 BaseController 提供的方法，自动获取当前用户ID
        List<DmwTeacherClass> list = dmwTeacherClassService.selectDmwTeacherClassList(params);
        return AjaxResult.success(list);
    }
}
