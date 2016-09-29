<#include "/basic/macro.include"/>
package ${groupId}.${artifactId}.web.controller;

<#if support_Shiro == "true">
import org.apache.shiro.authz.annotation.RequiresPermissions;
</#if>
import ${groupId}.${artifactId}.domain.${className};
import ${groupId}.${artifactId}.service.${className}Service;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ${groupId}.${artifactId}.common.Asserts;
import ${groupId}.${artifactId}.common.objects.MapOutput;
import ${groupId}.${artifactId}.common.objects.PageCondition;
import ${groupId}.${artifactId}.common.objects.expt.NullArgumentException;
import ${groupId}.${artifactId}.common.objects.expt.DataNotFoundException;
import ${groupId}.${artifactId}.common.objects.expt.ServiceException;
import ${groupId}.${artifactId}.common.objects.expt.ValidateException;
import ${groupId}.${artifactId}.common.tools.Tools;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Map;
import java.util.HashMap;

<#include "/basic/author.include"/>
@Controller
@RequestMapping("/${classNameLower}")
public class ${className}Controller extends BasicController {
    private static final String VIEW_PREFIX = "/${classNameLower}";
    @Resource
    private ${className}Service ${classNameLower}Service;

    @RequestMapping("/list")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:view")
</#if>
    public ModelAndView doList(@RequestParam(required = false) Map param) throws ServiceException {
        PageCondition condition = new PageCondition();
        if (!Tools.isNull(param)) {
            condition.putAll(param);
        }
        MapOutput output = ${classNameLower}Service.listByPageCondition(condition);
        return getView(VIEW_PREFIX + "/list", output);
    }

    @RequestMapping("/show")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:view")
</#if>
    public ModelAndView doShowById(@RequestParam Long id,
                                    @RequestParam(required = false, value = PageCondition.PAGE_NUM) Long pageNum)
                                    throws ServiceException {
        ${className} ${classNameLower} = ${classNameLower}Service.getById(id);
        Map<String, Object> output = new HashMap<>();
        output.put(DEFAULT_MODEL_KEY, ${classNameLower});
        if (!Tools.isNull(pageNum) && pageNum > 0) {
            output.put(PageCondition.PAGE_NUM, pageNum);
        }
        return getView(VIEW_PREFIX + "/show", output);
    }

    @RequestMapping("/del")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:delete")
</#if>
    public ModelAndView doDelById(@RequestParam Map param) throws ServiceException {
        if (Tools.isEmpty(param)) {
            throw new NullArgumentException();
        }
        final Object id = param.remove("id");
        if (Tools.isNull(id)) {
            throw new NullArgumentException();
        }
        ${classNameLower}Service.delById(Long.valueOf(id.toString()));
        param.put(DEFAULT_MESSAGE_KEY, "数据已被删除");
        return super.redirectByPost(VIEW_PREFIX + "/list", param);
    }

    @RequestMapping("/toupdate")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:update")
</#if>
    public ModelAndView toUpdateView(@RequestParam Map param)
                                throws ServiceException {
        if (Tools.isEmpty(param)) {
            throw new NullArgumentException();
        }
        final Object id = param.remove("id");
        if (Tools.isNull(id)) {
            throw new NullArgumentException();
        }
        ${className} ${classNameLower} = ${classNameLower}Service.getById(Long.valueOf(id.toString()));
        if (Tools.isNull(${classNameLower})) {
            throw new DataNotFoundException();
        }
        param.put(DEFAULT_MODEL_KEY, ${classNameLower});
        return getView(VIEW_PREFIX + "/update", param);
    }

    @RequestMapping("/update")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:update")
</#if>
    public ModelAndView doUpdateById(@Valid @ModelAttribute ${className} ${classNameLower}, BindingResult result,
                                    @RequestParam(required = false, value = PageCondition.PAGE_NUM) Long pageNum,
                                    @RequestParam(required = false) boolean stay)
                                    throws ServiceException {
        if (result.hasErrors()) {
            throw new ValidateException(super.getBindingErrorMessage(result));
        }
        if (Tools.isNull(${classNameLower})) {
            throw new NullArgumentException();
        }
        final long id = ${classNameLower}.getId();
        if (id <= 0) {
            throw new NullArgumentException();
        }
        ${classNameLower}Service.updateById(${classNameLower});
        Map<String, Object> param = new HashMap<>();
        param.put(DEFAULT_MESSAGE_KEY, "数据更新成功");
        if (!Tools.isNull(pageNum)  && pageNum > 0) {
            param.put(PageCondition.PAGE_NUM, pageNum);
        }
        if(!stay) {
            return super.redirectByPost(VIEW_PREFIX + "/list", param);
        }
        param.put("id", id);
        return super.redirectByPost(VIEW_PREFIX + "/toupdate", param);
    }

    @RequestMapping("/add")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:create")
</#if>
    public ModelAndView toAddView(@RequestParam(required = false) Map param)
                                throws ServiceException {
        return getView(VIEW_PREFIX + "/add", param);
    }

    @RequestMapping("/save")
<#if support_Shiro == "true">
    @RequiresPermissions("${artifactId}:${classNameLower}:create")
</#if>
    public ModelAndView doSave(@Valid @ModelAttribute ${className} ${classNameLower}, BindingResult result,
                                @RequestParam(required = false, value = PageCondition.PAGE_NUM) Long pageNum,
                                @RequestParam(required = false) boolean stay) throws ServiceException {
        if (result.hasErrors()) {
            throw new ValidateException(super.getBindingErrorMessage(result));
        }
        if (Tools.isNull(${classNameLower})) {
            throw new NullArgumentException();
        }
        ${classNameLower}Service.save(${classNameLower});
        Map<String, Object> param = new HashMap<>();
        param.put(DEFAULT_MESSAGE_KEY, "数据添加成功");
        if(!Tools.isNull(pageNum) && pageNum > 0) {
            param.put(PageCondition.PAGE_NUM, pageNum);
        }
        return super.redirectByPost(VIEW_PREFIX + (stay ? "/add":"/list"), param);
    }
}
