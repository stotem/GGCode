<?xml version="1.0" encoding="UTF-8" ?>
<#include "/basic/macro.include" />
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${base_pkg}.provider.persistence.${className}Dao">
    <!-- table column and class field-->
    <resultMap id="${className}RM" type="${className}">
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <id property="id" column="${column.sqlName}"/>
    <#else>
        <result property="${column.columnNameFirstLower}" column="${column.sqlName}"/>
    </#if>
</#list>
    </resultMap>

    <sql id="table_name"><![CDATA[ ${table.sqlName} AS t ]]></sql>

    <!--select field-->
    <sql id="table-field-select">
    <#list table.columns as column>
        t.`${column.sqlName}`<#if (column_has_next)>,</#if>
    </#list>
    </sql>

    <!--insert field-->
    <sql id="table-field-insert">
    <#list table.columns as column>
        <#if column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
        `${column.sqlName}`<#if (column_has_next)>,</#if>
        </#if>
    </#list>
    </sql>

    <!--where field normal-->
    <sql id="where-field-normal">
        <where>
        <#if (delFlagColName!='')>t.`${delFlagColName}`<#else>1</#if> = 1
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
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
    <#elseif column.columnNameLowerCase == "delflag">
    <#elseif column.columnNameLowerCase == "createdtime">
    <#elseif column.columnNameLowerCase == "version">
        t.`${column.sqlName}` = `${column.sqlName}`+1<#if (column_has_next)>,</#if>
    <#elseif column.columnNameLowerCase == "updatedtime">
        t.`${column.sqlName}` = NOW()<#if (column_has_next)>,</#if>
    <#else>
        <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
        t.`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse><#if (column_has_next)>,</#if>
        </if>
    </#if>
</#list>
    </set>
    </sql>

    <!--update set field normal-->
    <sql id="set-field-normal">
        <set>
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
    <#elseif column.columnNameLowerCase == "delflag">
    <#elseif column.columnNameLowerCase == "createdtime">
    <#elseif column.columnNameLowerCase == "version">
        t.`${column.sqlName}` = `${column.sqlName}`+1<#if (column_has_next)>,</#if>
    <#elseif column.columnNameLowerCase == "updatedtime">
        t.`${column.sqlName}` = NOW()<#if (column_has_next)>,</#if>
    <#else>
        t.`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse><#if (column_has_next)>,</#if>
    </#if>
</#list>
        </set>
    </sql>

    <!-- where field full-->
    <sql id="where-field-full">
        <where>
        <#if (delFlagColName!='')>t.`${delFlagColName}`<#else>1</#if> = 1
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
    <select id="getById" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[ FROM ]]>
        <include refid="table_name"/>
        <where>
        <![CDATA[
        t.`${table.pkColumn.sqlName}`=<#noparse>#{id}</#noparse>
        ]]>
        </where>
    </select>

    <!--save data to databases-->
    <insert id="save" parameterType="${className}" useGeneratedKeys="true" keyProperty="id">
        <![CDATA[ INSERT INTO ${table.sqlName}( ]]>
        <include refid="table-field-insert" />
        <![CDATA[
        ) VALUES(
    <#list table.columns as column>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <#elseif column.columnNameLowerCase == "delflag">
            1<#if (column_has_next)>,</#if>
        <#elseif column.columnNameLowerCase == "createdtime">
            NOW()<#if (column_has_next)>,</#if>
        <#elseif column.columnNameLowerCase == "updatedtime">
            NOW()<#if (column_has_next)>,</#if>
        <#elseif column.columnNameLowerCase == "version">
            1<#if (column_has_next)>,</#if>
        <#else>
            <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse><#if (column_has_next)>,</#if>
        </#if>
    </#list>
        )
        ]]>
    </insert>

    <update id="update" parameterType="${className}">
        <![CDATA[ UPDATE ]]>
        <include refid="table_name"/>
        <include refid="set-field-normal" />
        <where>
        <![CDATA[ <#if (delFlagColName!='')>t.`${delFlagColName}` = 1 AND</#if> t.`${table.pkColumn.sqlName}` =<#noparse> #{id}</#noparse> ]]>
        </where>
    </update>

    <update id="updateByCheck" parameterType="${className}">
        <![CDATA[ UPDATE ]]>
        <include refid="table_name"/>
        <include refid="set-field-normal-check" />
        <where>
        <![CDATA[ <#if (delFlagColName!='')>t.`${delFlagColName}` = 1 AND</#if> t.`${table.pkColumn.sqlName}` =<#noparse> #{id}</#noparse> ]]>
        </where>
    </update>

    <select id="countByCondition" parameterType="map" resultType="Long">
        <![CDATA[ SELECT COUNT(1) FROM ]]>
        <include refid="table_name"/>
        <include refid="where-field-normal" />
    </select>

    <select id="listPageByCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[ FROM ]]>
        <include refid="table_name"/>
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
        <![CDATA[ FROM ]]>
        <include refid="table_name"/>
        <include refid="where-field-full" />
    </select>

    <select id="listByCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[ FROM ]]>
        <include refid="table_name"/>
        <include refid="where-field-normal" />
    </select>

    <#if (delFlagColName!='')>
    <update id="deleteById">
        <![CDATA[ UPDATE ]]>
        <include refid="table_name"/>
        <![CDATA[
        set t.`${delFlagColName}` = 2<#if (updatedTimeColName != '')>,t.`${updatedTimeColName}` = NOW()</#if><#if (versionColName != '')>,t.`${versionColName}`=t.`${versionColName}`+1 </#if>
        ]]>
        <where>
         t.`${table.pkColumn.sqlName}` = <#noparse>#{id}</#noparse>
        </where>
    </update>

    <update id="deleteByCondition" parameterType="map">
        <![CDATA[ UPDATE ]]>
        <include refid="table_name"/>
        <![CDATA[
        set t.`${delFlagColName}` = 2<#if (updatedTimeColName != '')>,t.`${updatedTimeColName}` = NOW()</#if><#if (versionColName != '')>,t.`${versionColName}`=t.`${versionColName}`+1 </#if>
        ]]>
        <include refid="where-field-normal" />
    </update>
    <#else>
    <delete id="deleteById">
        <![CDATA[ DELETE FROM ]]>
        <include refid="table_name"/>
        <where>
        <![CDATA[
        t.`${table.pkColumn.sqlName}` = <#noparse>#{id}</#noparse>
        ]]>
        </where>
    </delete>

    <delete id="deleteByCondition" parameterType="map">
        <![CDATA[ DELETE FROM ]]>
        <include refid="table_name"/>
        <include refid="where-field-normal" />
    </delete>
    </#if>
</mapper>