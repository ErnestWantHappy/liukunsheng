package com.ruoyi.dmw.mapper;

import java.util.List;
import com.ruoyi.dmw.domain.DmwStudent;

/**
 * 六困生-学生信息Mapper接口
 * 
 * @author zdx
 * @date 2025-07-19
 */
public interface DmwStudentMapper 
{
    /**
     * 查询六困生-学生信息
     * 
     * @param studentId 六困生-学生信息主键
     * @return 六困生-学生信息
     */
    public DmwStudent selectDmwStudentByStudentId(Long studentId);

    /**
     * 查询六困生-学生信息列表
     * 
     * @param dmwStudent 六困生-学生信息
     * @return 六困生-学生信息集合
     */
    public List<DmwStudent> selectDmwStudentList(DmwStudent dmwStudent);

    /**
     * 新增六困生-学生信息
     * 
     * @param dmwStudent 六困生-学生信息
     * @return 结果
     */
    public int insertDmwStudent(DmwStudent dmwStudent);

    /**
     * 修改六困生-学生信息
     * 
     * @param dmwStudent 六困生-学生信息
     * @return 结果
     */
    public int updateDmwStudent(DmwStudent dmwStudent);

    /**
     * 删除六困生-学生信息
     * 
     * @param studentId 六困生-学生信息主键
     * @return 结果
     */
    public int deleteDmwStudentByStudentId(Long studentId);

    /**
     * 批量删除六困生-学生信息
     * 
     * @param studentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDmwStudentByStudentIds(Long[] studentIds);

    /**
     * 【新增】查询已归档的学生信息列表
     *
     * @param dmwStudent 学生信息
     * @return 学生信息集合
     */
    public List<DmwStudent> selectArchivedStudentList(DmwStudent dmwStudent);

    /**
     * 【修改】将毕业班学生状态更新为“毕业”，并返回影响行数
     */
    public int graduateStudents();

    /**
     * 【修改】将非毕业班学生年级加1，并返回影响行数
     */
    public int upgradeOtherStudents();

    /**
     * 【新增】获取首页仪表盘统计数据
     * @return 统计结果
     */
    public java.util.Map<String, Object> getDashboardStatistics();

    /**
     * 【新增】获取六困生类型分布数据
     * @return 六困生类型分布结果
     */
    public java.util.List<java.util.Map<String, Object>> getHardshipDistribution();

    /**
     * 【新增】获取年级分布数据
     * @return 年级分布结果
     */
    public java.util.List<java.util.Map<String, Object>> getGradeDistribution();

    /**
     * 【新增】获取学生状态变更趋势数据
     * @param months 查询月数
     * @return 状态变更趋势结果
     */
    public java.util.List<java.util.Map<String, Object>> getStatusTrend(int months);

    /**
     * 【新增】获取约谈记录统计数据
     * @param months 查询月数
     * @return 约谈记录统计结果
     */
    public java.util.List<java.util.Map<String, Object>> getInterviewStats(int months);

    /**
     * 【新增】获取班级困雾学生分布数据
     * @return 班级困雾学生分布结果
     */
    public java.util.List<java.util.Map<String, Object>> getClassHardshipDistribution();
}
