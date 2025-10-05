package com.ruoyi.dmw.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
    public Map<String, Object> getDashboardStatistics(@Param("deptType") String deptType,
                                                      @Param("gradeId") Integer gradeId,
                                                      @Param("hardshipType") String hardshipType);

    public List<Map<String, Object>> getHardshipDistribution();

    public List<Map<String, Object>> getGradeDistribution();

    public List<Map<String, Object>> getStatusTrend(int months);

    public List<Map<String, Object>> getInterviewStats(int months);

    public List<Map<String, Object>> getClassHardshipDistribution();

    public List<Map<String, Object>> getHardshipHierarchyStats(@Param("deptType") String deptType,
                                                              @Param("gradeId") Integer gradeId,
                                                              @Param("hardshipType") String hardshipType);

    public int updateStudentOperateMeta(@Param("studentId") Long studentId,
                                        @Param("updateBy") String updateBy,
                                        @Param("updateTime") Date updateTime);
}
