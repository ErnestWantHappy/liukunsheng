package com.ruoyi.dmw.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DictUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.dmw.domain.DmwInterview;
import com.ruoyi.dmw.domain.DmwStatusLog;
import com.ruoyi.dmw.domain.DmwStudent;
import com.ruoyi.dmw.domain.vo.AttachmentInfo;
import com.ruoyi.dmw.service.IDmwInterviewService;
import com.ruoyi.dmw.service.IDmwStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 六困生-学生信息Controller
 *
 * @author zdx
 * @date 2025-07-19
 */
@RestController
@RequestMapping("/dmw/student")
public class DmwStudentController extends BaseController
{
    @Autowired
    private IDmwStudentService dmwStudentService;

    @Autowired
    private IDmwInterviewService dmwInterviewService;

    /**
     * 查询六困生-学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:list')")
    @GetMapping("/list")
    public TableDataInfo list(DmwStudent dmwStudent)
    {
        startPage();
        List<DmwStudent> list = dmwStudentService.selectDmwStudentList(dmwStudent);
        return getDataTable(list);
    }

    /**
     * 导出六困生-学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:export')")
    @Log(title = "六困生-学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DmwStudent dmwStudent)
    {
        List<DmwStudent> list = dmwStudentService.selectDmwStudentList(dmwStudent);
        ExcelUtil<DmwStudent> util = new ExcelUtil<DmwStudent>(DmwStudent.class);
        util.exportExcel(response, list, "六困生-学生信息数据");
    }

    /**
     * 获取六困生-学生信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:query')")
    @GetMapping(value = "/{studentId}")
    public AjaxResult getInfo(@PathVariable("studentId") Long studentId)
    {
        return success(dmwStudentService.selectDmwStudentByStudentId(studentId));
    }

    /**
     * 获取学生状态历史轨迹
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:query')")
    @GetMapping("/{studentId}/logs")
    public AjaxResult getStudentLogs(@PathVariable("studentId") Long studentId)
    {
        return success(dmwStudentService.getStudentLogs(studentId));
    }

    /**
     * 获取学生全量时间线
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:query')")
    @GetMapping("/{studentId}/timeline")
    public AjaxResult getStudentTimeline(@PathVariable("studentId") Long studentId)
    {
        return success(dmwStudentService.getStudentTimeline(studentId));
    }

    /**
     * 新增六困生-学生信息
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:add')")
    @Log(title = "六困生-学生信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DmwStudent dmwStudent)
    {
        return toAjax(dmwStudentService.insertDmwStudent(dmwStudent));
    }

    /**
     * 修改六困生-学生信息
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:edit')")
    @Log(title = "六困生-学生信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DmwStudent dmwStudent)
    {
        return toAjax(dmwStudentService.updateDmwStudent(dmwStudent));
    }

    /**
     * 删除六困生-学生信息
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:remove')")
    @Log(title = "六困生-学生信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{studentIds}")
    public AjaxResult remove(@PathVariable Long[] studentIds)
    {
        return toAjax(dmwStudentService.deleteDmwStudentByStudentIds(studentIds));
    }

    /**
     * 更改学生状态
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:edit')")
    @Log(title = "学生状态变更", businessType = BusinessType.UPDATE)
    @PostMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody DmwStatusLog statusLog)
    {
        return toAjax(dmwStudentService.changeStudentStatus(statusLog));
    }

    /**
     * 下载单个学生档案 (V3.2 - 最终优化版)
     */
    @PostMapping("/downloadProfile/{studentId}")
    public void downloadProfile(@PathVariable Long studentId, HttpServletResponse response) throws IOException {
        // 1. 查询学生基本信息
        DmwStudent student = dmwStudentService.selectDmwStudentByStudentId(studentId);

        // 2. 查询该学生的所有约谈记录
        DmwInterview interviewParams = new DmwInterview();
        interviewParams.setStudentId(studentId);
        List<DmwInterview> interviews = dmwInterviewService.selectDmwInterviewList(interviewParams);

        // 3. 准备字典数据用于翻译
        Map<String, String> genderMap = getDictMap("sys_user_sex");
        Map<String, String> yesNoMap = getDictMap("dmw_yes_no");
        Map<String, String> healthMap = getDictMap("dmw_health_status");
        Map<String, String> familyStructureMap = getDictMap("dmw_family_structure");
        Map<String, String> familyAtmosphereMap = getDictMap("dmw_family_atmosphere");
        Map<String, String> economicMap = getDictMap("dmw_economic_status");
        Map<String, String> selfHarmMap = getDictMap("dmw_self_harm_history");
        Map<String, String> hardshipMap = getDictMap("dmw_hardship_type");
        Map<String, String> locationMap = getDictMap("dmw_interview_location");

        // 4. 创建ZIP输出流
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = new ZipOutputStream(baos);

        // 5. 生成并写入学生档案.txt
        StringBuilder content = new StringBuilder();
        content.append("学生基本信息\r\n");
        content.append("--------------------\r\n");
        content.append("姓名: ").append(student.getStudentName()).append("\r\n");
        content.append("身份证号: ").append(student.getIdCardNo()).append("\r\n");
        content.append("性别: ").append(genderMap.getOrDefault(student.getGender(), "未知")).append("\r\n");
        content.append("年级: ").append(student.getGradeId()).append("年级\r\n");
        content.append("班级: ").append(student.getClassId()).append("班\r\n");
        content.append("是否独生: ").append(yesNoMap.getOrDefault(student.getIsOnlyChild(), "否")).append("\r\n");
        content.append("身体状况: ").append(healthMap.getOrDefault(student.getHealthStatus(), "未知")).append("\r\n");
        content.append("家庭地址: ").append(student.getAddress()).append("\r\n");
        content.append("\r\n家庭情况\r\n");
        content.append("--------------------\r\n");
        content.append("家庭结构: ").append(familyStructureMap.getOrDefault(student.getFamilyStructure(), "未知")).append("\r\n");
        content.append("家庭氛围: ").append(familyAtmosphereMap.getOrDefault(student.getFamilyAtmosphere(), "未知")).append("\r\n");
        content.append("经济情况: ").append(economicMap.getOrDefault(student.getEconomicStatus(), "未知")).append("\r\n");
        content.append("寄养/留守经历: ").append(yesNoMap.getOrDefault(student.getFosterLeftBehind(), "否")).append("\r\n");
        content.append("父母职业: ").append(student.getParentOccupation()).append("\r\n");
        content.append("\r\n困难情况\r\n");
        content.append("--------------------\r\n");
        content.append("六困生类型: ").append(hardshipMap.getOrDefault(student.getHardshipType(), "无")).append("\r\n");
        content.append("自伤自残史: ").append(selfHarmMap.getOrDefault(student.getSelfHarmHistory(), "未知")).append("\r\n");
        content.append("学生详细情况说明: ").append(student.getStudentDetails()).append("\r\n");
        content.append("应对措施: ").append(student.getCountermeasures()).append("\r\n");
        content.append("教师上报信息: ").append(student.getTeacherReportInfo()).append("\r\n");

        content.append("\r\n\r\n约谈历史记录\r\n");
        content.append("--------------------\r\n");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (interviews.isEmpty()) {
            content.append("无约谈记录\r\n");
        } else {
            for (DmwInterview interview : interviews) {
                content.append("约谈时间: ").append(sdf.format(interview.getInterviewTime())).append("\r\n");
                content.append("约谈地点: ").append(locationMap.getOrDefault(interview.getLocation(), "未知")).append("\r\n");
                content.append("参与人员: ").append(interview.getParticipants()).append("\r\n");
                content.append("记录人: ").append(interview.getRecorder()).append("\r\n");
                content.append("记录内容: ").append(interview.getContent()).append("\r\n");
                content.append("--------------------\r\n");
            }
        }

        zos.putNextEntry(new ZipEntry("学生档案.txt"));
        zos.write(content.toString().getBytes("UTF-8"));
        zos.closeEntry();

        // 6. 遍历约谈记录，将附件写入ZIP
        for (DmwInterview interview : interviews) {
            List<AttachmentInfo> attachments = AttachmentInfo.parseList(interview.getAttachmentUrl());
            if (attachments.isEmpty()) {
                continue;
            }
            int index = 1;
            for (AttachmentInfo attachment : attachments) {
                File attachmentFile = resolveProfileFile(attachment.getUrl());
                if (attachmentFile == null || !attachmentFile.exists()) {
                    index++;
                    continue;
                }
                String defaultName = "约谈附件_" + sdf.format(interview.getInterviewTime()) + "_" + interview.getInterviewId() + "_" + index;
                String safeName = attachment.buildSafeName(defaultName);
                String zipEntryName = "约谈附件/" + safeName;

                zos.putNextEntry(new ZipEntry(zipEntryName));
                try (FileInputStream fis = new FileInputStream(attachmentFile)) {
                    byte[] buffer = new byte[1024];
                    int len;
                    while ((len = fis.read(buffer)) > 0) {
                        zos.write(buffer, 0, len);
                    }
                }
                zos.closeEntry();
                index++;
            }
        }
        zos.close();

        // 7. 设置response头，提供下载
        String zipFileName = "学生档案_" + student.getStudentName() + ".zip";
        response.setContentType("application/zip");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(zipFileName.getBytes("GBK"), "ISO-8859-1"));
        response.setContentLength(baos.size());
        response.getOutputStream().write(baos.toByteArray());
        response.getOutputStream().flush();
    }

    /**
     * 辅助方法：根据字典类型获取字典Map
     */
    private Map<String, String> getDictMap(String dictType) {
        List<SysDictData> dictData = DictUtils.getDictCache(dictType);
        if (dictData == null) {
            return new java.util.HashMap<>();
        }
        return dictData.stream().collect(Collectors.toMap(SysDictData::getDictValue, SysDictData::getDictLabel, (v1, v2) -> v1));
    }

    private File resolveProfileFile(String fileUrl) {
        if (!StringUtils.hasText(fileUrl)) {
            return null;
        }
        final String marker = "/profile";
        int idx = fileUrl.indexOf(marker);
        String relative = idx >= 0 ? fileUrl.substring(idx + marker.length()) : fileUrl;
        return new File(RuoYiConfig.getProfile() + relative);
    }

    /**
     * 下载导入模板
     */
    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<DmwStudent> util = new ExcelUtil<DmwStudent>(DmwStudent.class);
        util.importTemplateExcel(response, "学生数据");
    }

    /**
     * 【新增】查询已归档学生列表
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:list')")
    @GetMapping("/archivedList")
    public TableDataInfo listArchived(DmwStudent dmwStudent)
    {
        startPage();
        List<DmwStudent> list = dmwStudentService.selectArchivedStudentList(dmwStudent);
        return getDataTable(list);
    }

    /**
     * 【新增】恢复学生档案
     */
    @PreAuthorize("@ss.hasPermi('dmw:student:edit')")
    @Log(title = "学生档案恢复", businessType = BusinessType.UPDATE)
    @PutMapping("/restore")
    public AjaxResult restore(@RequestBody DmwStudent dmwStudent)
    {
        return toAjax(dmwStudentService.restoreStudent(dmwStudent));
    }

    /**
     * 【新增】执行全员升级
     */
    @PreAuthorize("@ss.hasRole('admin') or @ss.hasRole('psychologist')")
    @Log(title = "全员升级", businessType = BusinessType.UPDATE)
    @PostMapping("/upgradeAll")
    public AjaxResult upgradeAll()
    {
        int affectedRows = dmwStudentService.upgradeAllStudents();
        return AjaxResult.success("操作成功", affectedRows);
    }

    /**
     * 【新增】获取首页统计数据
     */
    @GetMapping("/dashboard/stats")
    public AjaxResult getDashboardStats(@RequestParam(required = false) String deptType,
                                        @RequestParam(required = false) Integer gradeId,
                                        @RequestParam(required = false) String hardshipType)
    {
        return AjaxResult.success(dmwStudentService.getDashboardStatistics(deptType, gradeId, hardshipType));
    }

    /**
     * 【新增】获取层级化困难学生统计数据
     */
    @GetMapping("/dashboard/hierarchy")
    public AjaxResult getHierarchyStats(@RequestParam(required = false) String deptType,
                                        @RequestParam(required = false) Integer gradeId,
                                        @RequestParam(required = false) String hardshipType)
    {
        return AjaxResult.success(dmwStudentService.getHardshipHierarchyStats(deptType, gradeId, hardshipType));
    }

    /**
     * 【新增】获取图表数据 - 六困生类型分布
     */
    @GetMapping("/chart/hardship-distribution")
    public AjaxResult getHardshipDistribution()
    {
        return AjaxResult.success(dmwStudentService.getHardshipDistribution());
    }

    /**
     * 【新增】获取图表数据 - 年级分布统计
     */
    @GetMapping("/chart/grade-distribution")
    public AjaxResult getGradeDistribution()
    {
        return AjaxResult.success(dmwStudentService.getGradeDistribution());
    }

    /**
     * 【新增】获取图表数据 - 学生状态变更趋势
     */
    @GetMapping("/chart/status-trend")
    public AjaxResult getStatusTrend(@RequestParam(defaultValue = "6") int months)
    {
        return AjaxResult.success(dmwStudentService.getStatusTrend(months));
    }

    /**
     * 【新增】获取图表数据 - 约谈记录统计（按困难类型分组）
     */
    @GetMapping("/chart/interview-stats")
    public AjaxResult getInterviewStats(@RequestParam(defaultValue = "12") int months)
    {
        return AjaxResult.success(dmwStudentService.getInterviewStats(months));
    }

    /**
     * 【新增】获取图表数据 - 班级困难学生分布
     */
    @GetMapping("/chart/class-hardship")
    public AjaxResult getClassHardshipDistribution()
    {
        return AjaxResult.success(dmwStudentService.getClassHardshipDistribution());
    }
}
