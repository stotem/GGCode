<#include "/basic/macro.include" />
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${groupId}.${artifactId}.dao.${className}Dao">
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

    <!--select field-->
    <sql id="table-field-select">
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if isFirst==false>, </#if><#assign isFirst=false />`${column.sqlName}`
    </#list>
    </sql>

    <!--insert field-->
    <sql id="table-field-insert">
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
        <#if isFirst==false>, </#if><#assign isFirst=false />`${column.sqlName}`
        </#if>
    </#list>
    </sql>

    <!--where field normal-->
    <sql id="where-field-normal">
        DEL_FLAG = 1
    <#list table.columns as column>
        <#if column.columnNameLowerCase != "delflag" && column.columnNameLowerCase != "createtime"
        && column.columnNameLowerCase != "updatetime">
        <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
            and `${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </if>
        <#elseif column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <if test="id != null and id != ''">
            and `${column.sqlName}` = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
        </if>
        </#if>
    </#list>
    </sql>

    <!--update set field normal first check null or empty string-->
    <sql id="set-field-normal-check">
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <#elseif column.columnNameLowerCase == "delflag">
        <#elseif column.columnNameLowerCase == "createtime">
        <#elseif column.columnNameLowerCase == "updatetime">
            <#if isFirst==false>, </#if><#assign isFirst=false />`${column.sqlName}` = now()
        <#else>
            <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
            <#if isFirst==false>, </#if><#assign isFirst=false />`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
            </if>
        </#if>
    </#list>
    </sql>

    <!--update set field normal-->
    <sql id="set-field-normal">
    <#assign isFirst=true />
    <#list table.columns as column>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <#elseif column.columnNameLowerCase == "delflag">
        <#elseif column.columnNameLowerCase == "createtime">
        <#elseif column.columnNameLowerCase == "updatetime">
            <#if isFirst==false>, </#if><#assign isFirst=false />`${column.sqlName}` = now()
        <#else>
            <#if isFirst==false>, </#if><#assign isFirst=false />`${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </#if>
    </#list>
    </sql>

    <!-- where field full-->
    <sql id="where-field-full">
        DEL_FLAG = 1
    <#list table.columns as column>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        <if test="id != null and id != ''">
            and `${column.sqlName}` = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
        </if>
        <#else>
        <if test="${column.columnNameFirstLower} != null and ${column.columnNameFirstLower} != ''">
            and `${column.sqlName}` = <#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </if>
        </#if>
    </#list>
    </sql>

    <!--Get data by primary key-->
    <select id="getById" parameterType="Long" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[
        FROM ${table.sqlName}
        WHERE ${table.pkColumn.sqlName}=<#noparse>#{pk}
    </#noparse>
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
        <#elseif column.columnNameLowerCase == "createtime">
            <#if isFirst==false>, </#if><#assign isFirst=false />now()
        <#elseif column.columnNameLowerCase == "updatetime">
            <#if isFirst==false>, </#if><#assign isFirst=false />now()
        <#else>
            <#if isFirst==false>, </#if><#assign isFirst=false /><#noparse>#{</#noparse>${column.columnNameFirstLower}<#noparse>}</#noparse>
        </#if>
    </#list>
        )
        ]]>
    </insert>

    <update id="update" parameterType="${groupId}.${artifactId}.domain.${className}">
        <![CDATA[ UPDATE ${table.sqlName} set ]]>
        <include refid="set-field-normal" />
        <![CDATA[ where del_flag = 1 AND ${table.pkColumn.sqlName} =<#noparse> #{id}</#noparse> ]]>
    </update>

    <update id="updateByCheck" parameterType="${groupId}.${artifactId}.domain.${className}">
        <![CDATA[ UPDATE ${table.sqlName} set ]]>
        <include refid="set-field-normal-check" />
        <![CDATA[ where del_flag = 1 AND ${table.pkColumn.sqlName} =<#noparse> #{id}</#noparse> ]]>
    </update>

    <select id="countByCondition" parameterType="map" resultType="Long">
        <![CDATA[
        SELECT count(1) FROM ${table.sqlName}
        ]]>
        <where>
        <include refid="where-field-normal" />
        </where>
    </select>

    <select id="listPageByCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[ FROM ${table.sqlName}]]>
        <where>
        <include refid="where-field-normal" />
        </where>
    <#noparse>
        <![CDATA[
        limit #{K_START_ROW},#{K_DATA_SIZE}
        ]]>
    </#noparse>
    </select>

    <select id="listFullByMapCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[
        FROM ${table.sqlName}
        ]]>
        <where>
            <include refid="where-field-full" />
        </where>
    </select>

    <select id="listByCondition" parameterType="map" resultMap="${className}RM">
        <![CDATA[ SELECT ]]>
        <include refid="table-field-select"/>
        <![CDATA[
        FROM ${table.sqlName}
        ]]>
        <where>
        <include refid="where-field-normal" />
        </where>
    </select>

    <update id="deleteById" parameterType="Long">
        <![CDATA[
        update ${table.sqlName} set <#noparse> del_flag = 2,update_time = now() where </#noparse> ${table.pkColumn.sqlName} = <#noparse>#{id}</#noparse>
        ]]>
    </update>

    <update id="deleteByCondition" parameterType="map">
        <![CDATA[
        update ${table.sqlName} set <#noparse> del_flag = 2,update_time = now() </#noparse>
        ]]>
        <where>
            <include refid="where-field-normal" />
        </where>
    </update>

</mapper>