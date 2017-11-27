<#include "/basic/macro.include" />
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${groupId}.${artifactId}.provider.dao.${className}Dao">
    <!-- table column and class field-->
    <resultMap id="${className}RM" type="${groupId}.${artifactId}.domain.${className}">
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <id property="id" column="${column.sqlName}"/>
    <#else>
        <result property="${column.columnNameFirstLower}" column="${column.sqlName}"/>
    </#if>
</#list>
    </resultMap>

    <sql id="from_table"><![CDATA[FROM ${table.sqlName} AS t]]></sql>
    <sql id="update_table"><![CDATA[UPDATE ${table.sqlName} AS t]]></sql>

    <!--select field-->
    <sql id="table-field-select">
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}`
    </#list>
    </sql>

    <!--insert field-->
    <sql id="table-field-insert">
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}`
        </#if>
    </#list>
    </sql>

    <!--where field normal-->
    <sql id="where-field-normal">
        <where>
        t.`del_flag` = 1
    <#list table.columns as column>
        <#if column.columnNameLowerCase != "delflag" && column.columnNameLowerCase != "createdtime"
        && column.columnNameLowerCase != "updatedtime">
        <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
            AND t.`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </if>
        <#elseif column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <if test="id != null and id != ''">
            AND t.`${column.sqlName}` = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
        </if>
        </#if>
    </#list>
        </where>
    </sql>

    <!--update set field normal first check null or empty string-->
    <sql id="set-field-normal-check">
    <set>
<#assign isFirst=true />
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
    <#elseif column.columnNameLowerCase == "delflag">
    <#elseif column.columnNameLowerCase == "createdtime">
    <#elseif column.columnNameLowerCase == "version">
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}` = `${column.sqlName}`+1
    <#elseif column.columnNameLowerCase == "updatedtime">
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}` = NOW()
    <#else>
        <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </if>
    </#if>
</#list>
        </set>
    </sql>

    <!--update set field normal-->
    <sql id="set-field-normal">
        <set>
<#assign isFirst=true />
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
    <#elseif column.columnNameLowerCase == "delflag">
    <#elseif column.columnNameLowerCase == "createdtime">
    <#elseif column.columnNameLowerCase == "version">
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}` = `${column.sqlName}`+1
    <#elseif column.columnNameLowerCase == "updatedtime">
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}` = NOW()
    <#else>
        <#if isFirst==false>, </#if><#assign isFirst=false />t.`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
    </#if>
</#list>
        </set>
    </sql>

    <!-- where field full-->
    <sql id="where-field-full">
        <where>
        t.`del_flag` = 1
    <#list table.columns as column>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <if test="id != null and id != ''">
            AND t.`${column.sqlName}` = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
        </if>
        <#else>
        <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
            AND t.`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </if>
        </#if>
    </#list>
        </where>
    </sql>

    <!--Get data by primary key-->
    <select id="getById" parameterType="Long" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <include refid="from_table"/>
        <![CDATA[
        WHERE t.`${table.pkColumn.sqlName}`=<#noparse>#{pk}</#noparse>
        ]]>
    </select>

    <!--save data to databases-->
    <insert id="save" parameterType="${groupId}.${artifactId}.domain.${className}" useGeneratedKeys="true" keyProperty="id">
        <![CDATA[ INSERT INTO ${table.sqlName}( ]]>
        <include refid="table-field-insert" />
        <![CDATA[
        ) VALUES(
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <#elseif column.columnNameLowerCase == "delflag">
            <#if isFirst==false>, </#if><#assign isFirst=false />1
        <#elseif column.columnNameLowerCase == "createdtime">
            <#if isFirst==false>, </#if><#assign isFirst=false />NOW()
        <#elseif column.columnNameLowerCase == "updatedtime">
            <#if isFirst==false>, </#if><#assign isFirst=false />NOW()
        <#elseif column.columnNameLowerCase == "version">
            <#if isFirst==false>, </#if><#assign isFirst=false />1
        <#else>
            <#if isFirst==false>, </#if><#assign isFirst=false /><#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </#if>
    </#list>
        )
        ]]>
    </insert>

    <update id="update" parameterType="${groupId}.${artifactId}.domain.${className}">
        <include refid="update_table"/>
        <include refid="set-field-normal" />
        <![CDATA[ WHERE t.`del_flag` = 1 AND t.`${table.pkColumn.sqlName}` =<#noparse> #{id}</#noparse> ]]>
    </update>

    <update id="updateByCheck" parameterType="${groupId}.${artifactId}.domain.${className}">
        <include refid="update_table"/>
        <include refid="set-field-normal-check" />
        <![CDATA[ WHERE t.`del_flag` = 1 AND t.`${table.pkColumn.sqlName}` =<#noparse> #{id}</#noparse> ]]>
    </update>

    <select id="countByCondition" parameterType="map" resultType="Long">
        <![CDATA[ SELECT COUNT(1) ]]>
        <include refid="from_table"/>
        <include refid="where-field-normal" />
    </select>

    <select id="listPageByCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <include refid="from_table"/>
        <include refid="where-field-normal" />
    <#noparse>
        <![CDATA[
        LIMIT #{K_START_ROW},#{K_DATA_SIZE}
        ]]>
    </#noparse>
    </select>

    <select id="listFullByMapCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <include refid="from_table"/>
        <include refid="where-field-full" />
    </select>

    <select id="listByCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <include refid="from_table"/>
        <include refid="where-field-normal" />
    </select>

    <update id="deleteById" parameterType="Long">
        <include refid="update_table"/>
        <![CDATA[
        SET <#noparse>t.`del_flag` = 2,t.`updated_time` = NOW(),t.`version`=t.`version`+1 where </#noparse>t.`${table.pkColumn.sqlName}` = <#noparse>#{id}</#noparse>
        ]]>
    </update>

    <update id="deleteByCondition" parameterType="map">
        <include refid="update_table"/>
        <![CDATA[
        SET <#noparse>t.`del_flag` = 2,t.`updated_time` = NOW(),t.`version`=t.`version`+1 </#noparse>
        ]]>
        <include refid="where-field-normal" />
    </update>

</mapper>