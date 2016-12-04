<#include "/basic/macro.include"/>

package ${groupId}.${artifactId}.provider.dao;

import java.util.List;
import ${groupId}.${artifactId}.common.objects.Condition;
import ${groupId}.${artifactId}.common.objects.PageCondition;
import java.io.Serializable;

<#include "/basic/author.include"/>
public interface BaseDao<T, ID extends Serializable> {

    /**
     * 通过主键ID精确定位数据,包含delflag=2的数据
     * @param id 主键ID
     */
    T getById(ID id);

    /**
     * 保存数据
     * @param entry 数据对象
     * @return 所影响行数
     */
    Integer save(T entry);

    /**
     * 通过ID更改数据(不检查字段的为空性)
     * @param entry 数据对象
     * @return 所影响行数
     */
    Integer update(T entry);

    /**
     * 通过ID更改对象中不为空的数据
     * @param entry 数据对象
     * @return 所影响行数
     */
    Integer updateByCheck(T entry);

    /**
     * 按条件统计符合数据条数
     * @param condition 条件
     * @return 符合条件的数据条数
     */
    Long countByCondition(Condition condition);

    /**
     * 按分页条件获取到数据
     * @param condition 分页条件
     * @return 数据
     */
    List<T> listPageByCondition(PageCondition condition);

    /**
     * 按条件获取所有符合条件的数据
     * @param condition 条件
     * @return 数据
     */
    List<T> listByCondition(Condition condition);

    /**
     * 按主键ID删除数据
     * @param id 主键ID
     * @return 所影响行数
     */
    Integer deleteById(ID id);

    /**
     * 按条件删除数据
     * @param condition 条件
     * @return 所影响行数
     */
    Integer deleteByCondition(Condition condition);
}