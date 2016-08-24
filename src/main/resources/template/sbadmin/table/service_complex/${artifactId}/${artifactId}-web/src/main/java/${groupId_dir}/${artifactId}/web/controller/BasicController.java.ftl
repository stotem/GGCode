package ${groupId}.${artifactId}.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractUrlBasedView;
import ${groupId}.${artifactId}.common.tools.Tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

<#include "/basic/author.include"/>
public abstract class BasicController {
    protected static final String DEFAULT_MESSAGE_KEY = "_message_";
    protected static final String DEFAULT_MODEL_KEY = "_model_";
    private static final String JUMP_REDIRECT = "redirect";
    private static final String JUMP_FORWARD = "forward";
    @Value("<#noparse>${app.basePath}</#noparse>")
    protected String basePath;

    protected ModelAndView redirect(String path, Object obj) {
        return doJump(path, JUMP_REDIRECT, obj);
    }

    protected ModelAndView redirectByPost(String path, Map<String, ?> obj) {
        if (!Tools.isEmpty(basePath) && !basePath.equals("/")) {
            path = basePath + path;
        }
        return new ModelAndView(new RedirectPostView(path, obj));
    }

    protected ModelAndView forward(String path, Object obj) {
        return doJump(path, JUMP_FORWARD, obj);
    }

    protected ModelAndView redirect(String path) {
        return redirect(path, null);
    }

    protected ModelAndView forward(String path) {
        return forward(path, null);
    }

    private ModelAndView doJump(String path, String type, Object data) {
        if(Tools.isNull(data)) {
            return new ModelAndView(type+":"+path);
        }
        if(data instanceof Map) {
            return new ModelAndView(type+":"+path, (Map)data);
        }
        return new ModelAndView(type+":"+path, DEFAULT_MODEL_KEY, data);
    }

    protected ModelAndView toErrorView() {
        return getView("errors/error");
    }

    protected ModelAndView toErrorView(Object obj) {
        return getView("errors/error", obj);
    }

    protected ModelAndView getView(String view) {
        return getView(view, null);
    }

    protected ModelAndView getView(String view, Object model) {
        Map<String, Object> param = new HashMap<>();
        param.put(DEFAULT_MODEL_KEY, model);
        return getView(view, param);
    }

    protected ModelAndView getView(String view, Map<String, Object> param) {
        if(Tools.isNull(param)) {
            param = new HashMap<>();
        }
        return new ModelAndView(view, param);
    }

    protected String getBindingErrorMessage(BindingResult result) {
        if (result.hasErrors()) {
            final List<ObjectError> allErrors = result.getAllErrors();
            StringBuffer buffer = new StringBuffer();
            for (ObjectError objectError : allErrors) {
                buffer.append("\n");
                if (objectError instanceof FieldError) {
                    FieldError fieldError = (FieldError) objectError;
                    buffer.append("[");
                    buffer.append(fieldError.getObjectName());
                    buffer.append(".");
                    buffer.append(fieldError.getField());
                    buffer.append(" - ");
                    final String defaultMessage = fieldError.getDefaultMessage();
                    if (!Tools.isEmpty(defaultMessage)) {
                        buffer.append(defaultMessage);
                        buffer.append(",");
                    }
                    buffer.append("错误的输入值 '");
                    buffer.append(fieldError.getRejectedValue());
                    buffer.append("' ]");
                }
                else {
                    buffer.append("[");
                    buffer.append(objectError.getObjectName());
                    buffer.append(" - ");
                    buffer.append(objectError.getDefaultMessage());
                    buffer.append("]");
                }
            }
            return buffer.substring(1);
        }
        return null;
    }
}
class RedirectPostView extends AbstractUrlBasedView {
    private Map<String, ?> postData;

    public RedirectPostView(String url, Map<String, ?> postData) {
        super(url);
        this.postData = postData;
    }

    protected void sendRedirect(HttpServletResponse response, String targetUrl) throws IOException {
        String encodedRedirectURL = response.encodeRedirectURL(targetUrl);
        response.setStatus(HttpStatus.OK.value());
        StringBuffer outBuffer = new StringBuffer();
        outBuffer.append("<html>");
        outBuffer.append("<body>");
        outBuffer.append("<form id='form' action='"+encodedRedirectURL+"' method='POST'>");
        if(!Tools.isEmpty(postData)) {
            final Iterator<? extends Map.Entry<String, ?>> entryIterator = postData.entrySet().iterator();
            while(entryIterator.hasNext()) {
                final Map.Entry<String, ?> entry = entryIterator.next();
                outBuffer.append("<input type='hidden' name='"+entry.getKey()+"' value='"+entry.getValue()+"' />");
            }
        }
        outBuffer.append("</form>");
        outBuffer.append("<script>");
        outBuffer.append("document.getElementById('form').submit();");
        outBuffer.append("</script>");
        outBuffer.append("</body>");
        outBuffer.append("</html>");
        final PrintWriter writer = response.getWriter();
        writer.write(outBuffer.toString());
        writer.flush();
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String url = this.getUrl();
        if(url.startsWith("//")) {
            url = url.replaceFirst("/", request.getContextPath());
        }
        sendRedirect(response, url);
    }
}