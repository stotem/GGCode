package ${groupId}.${artifactId}.formatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.Formatter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

<#include "/basic/author.include"/>
public class TimestampFormatter implements Formatter<Timestamp> {
    private final static Logger LOG = LoggerFactory.getLogger(TimestampFormatter.class);
    private String format;

    public TimestampFormatter() {
        this("yyyy-MM-dd HH:mm:ss");
    }

    public TimestampFormatter(String formatString) {
        this.format = formatString;
    }

    @Override
    public Timestamp parse(String s, Locale locale) throws ParseException {
        try {
            return new Timestamp(new SimpleDateFormat(this.format, locale).parse(s).getTime());
        }
        catch (ParseException e) {
            LOG.info("日期转换出错 "+s, e);
        }
        return null;
    }

    @Override
    public String print(Timestamp timestamp, Locale locale) {
        return new SimpleDateFormat(this.format, locale).format(timestamp);
    }
}
