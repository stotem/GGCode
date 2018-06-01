<#include "/basic/macro.include"/>
package ${base_pkg}.provider.manager.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
<#if support_mongoDB == "true">import org.springframework.data.mongodb.core.MongoTemplate;</#if>
<#if support_Redis == "true">import org.springframework.data.redis.core.RedisTemplate;</#if>
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import ${base_pkg}.common.objects.expt.DataNotFoundException;
import ${base_pkg}.common.objects.expt.DataFalsifyException;
import ${base_pkg}.common.objects.expt.DataAlreadyExistsException;
import ${base_pkg}.common.annotation.LoggerProcessTime;
import ${base_pkg}.provider.persistence.${className}Dao;
import ${base_pkg}.domain.${className};
import ${base_pkg}.provider.manager.${className}Manager;
import ${base_pkg}.common.objects.PageCondition;
import ${base_pkg}.common.objects.MapOutput;
import ${base_pkg}.common.objects.expt.RollbackException;
import javax.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

<#include "/basic/author.include"/>
@Component
public class ${className}ManagerImpl implements ${className}Manager {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private ${className}Dao ${classNameLower}Dao;
    <#if support_mongoDB == "true">
    @Resource
    private MongoTemplate mongoTemplate;
    </#if>
    <#if support_Redis == "true">
    @Resource
    private RedisTemplate redisTemplate;
    </#if>

    @Override
    @Transactional(rollbackFor = RollbackException.class)
    @LoggerProcessTime
    public void save(${className} ${classNameLower}) throws RollbackException {
        Integer rows = ${classNameLower}Dao.save(${classNameLower});
        if (rows < 1) {
            throw new DataAlreadyExistsException();
        }
    }

    @Override
    @LoggerProcessTime
    public MapOutput getPage(PageCondition condition) throws RollbackException {
        Long totalSize = ${classNameLower}Dao.countByCondition(condition);
        condition.setTotalSize(totalSize);
        List<${className}> pageData = ${classNameLower}Dao.listPageByCondition(condition);
        condition.setPageData(pageData);
        return MapOutput.createSuccess().addResult(condition)
                .addResult(PageCondition.TOTAL_PAGE_NUM, condition.getTotalPageNum())
                .addResult(PageCondition.END_ROW, condition.getEndRow());
    }

    @Override
    @LoggerProcessTime
    @Cacheable(value = "<#if cache_ForRedis == "true" && support_Redis == "true">fiveMinutes<#else>default</#if>", key = "'${classNameLower}_'+#id")
    public ${className} getById(Long id) throws RollbackException {
        return ${classNameLower}Dao.getById(id);
    }

    @Override
    @LoggerProcessTime
    @Transactional(rollbackFor = RollbackException.class)
    @CacheEvict(value = "<#if cache_ForRedis == "true" && support_Redis == "true">fiveMinutes<#else>default</#if>", key = "'${classNameLower}_'+#obj.getId()")
    public void updateByCheck(${className} obj) throws RollbackException {
        if (${classNameLower}Dao.updateByCheck(obj) < 1) {
            throw new DataFalsifyException();
        }
    }

    @Override
    @LoggerProcessTime
    @Transactional(rollbackFor = RollbackException.class)
    @CacheEvict(value = "<#if cache_ForRedis == "true" && support_Redis == "true">fiveMinutes<#else>default</#if>", key = "'${classNameLower}_'+#id")
    public void deleteById(Long id) throws RollbackException {
        if (${classNameLower}Dao.deleteById(id) < 1) {
            throw new DataNotFoundException();
        }
    }
}
