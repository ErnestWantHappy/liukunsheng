package com.ruoyi.dmw.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.dmw.domain.DmwStudent;
import com.ruoyi.dmw.domain.DmwStudentLog;
import com.ruoyi.dmw.domain.DmwStatusLog;

/**
 * 六困生-学生信息Service接口
 * * @author zdx
 * @date 2025-07-19
 */
public interface IDmwStudentService
{
    /**
     * 查询六困生-学生信息
     * * @param studentId 六困生-学生信息主键
     * @return 六困生-学生信息
     */
    public DmwStudent selectDmwStudentByStudentId(Long studentId);

    /**
     * 查询六困生-学生信息列表
     * * @param dmwStudent 六困生-学生信息
     * @return 六困生-学生信息集合
     */
    public List<DmwStudent> selectDmwStudentList(DmwStudent dmwStudent);

    /**
     * 新增六困生-学生信息
     * * @param dmwStudent 六困生-学生信息
     * @return 结果
     */
    public int insertDmwStudent(DmwStudent dmwStudent);

    /**
     * 修改六困生-学生信息
     * * @param dmwStudent 六困生-学生信息
     * @return 结果
     */
    public int updateDmwStudent(DmwStudent dmwStudent);

    /**
     * 批量删除六困生-学生信息
     * * @param studentIds 需要删除的六困生-学生信息主键集合
     * @return 结果
     */
    public int deleteDmwStudentByStudentIds(Long[] studentIds);

    /**
     * 删除六困生-学生信息信息
     * * @param studentId 六困生-学生信息主键
     * @return 结果
     */
    public int deleteDmwStudentByStudentId(Long studentId);

    /**
     * 【新增】更改学生状态
     * * @param statusLog 状态变更日志信息
     * @return 结果
     */
    public int changeStudentStatus(DmwStatusLog statusLog);

    /**
     * 【新增】查询已归档的学生信息列表
     *
     * @param dmwStudent 学生信息
     * @return 学生信息集合
     */
    public List<DmwStudent> selectArchivedStudentList(DmwStudent dmwStudent);

    /**
     * 【新增】恢复学生档案
     *
     * @param dmwStudent 学生信息
     * @return 结果
     */
    public int restoreStudent(DmwStudent dmwStudent);

    /**
     * 【新增】执行全员升级
     *
     * @return 结果
     */
    public int upgradeAllStudents();

    /**
     * 【新增】获取首页仪表盘统计数据
     * @return 统计结果
     */
    public Map<String, Object> getDashboardStatistics(String deptType, Integer gradeId, String hardshipType);

    /**
     * 【新增】获取六困生类型分布数据
     * @return 六困生类型分布结果
     */
    public List<Map<String, Object>> getHardshipDistribution();

    /**
     * 【新增】获取年级分布数据
     * @return 年级分布结果
     */
    public List<Map<String, Object>> getGradeDistribution();

    /**
     * 【新增】获取学生状态变更趋势数据
     * @param months 查询月数
     * @return 状态变更趋势结果
     */
    public List<Map<String, Object>> getStatusTrend(int months);

    /**
     * 【新增】获取约谈记录统计数据
     * @param months 查询月数
     * @return 约谈记录统计结果
     */
    public List<Map<String, Object>> getInterviewStats(int months);

    /**
     * 【新增】获取班级困难学生分布数据
     * @return 班级困难学生分布结果
     */
    public List<Map<String, Object>> getClassHardshipDistribution();

    /**
     * 获取层级化困难学生统计
     */
    public List<Map<String, Object>> getHardshipHierarchyStats(String deptType, Integer gradeId, String hardshipType);

    /**
     * 获取学生变更日志
     */
    public List<DmwStudentLog> getStudentLogs(Long studentId);
}
