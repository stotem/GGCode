package ${base_pkg}.common.objects;

import ${base_pkg}.common.tools.Tools;

import java.util.List;

/**
 * <B>Description</B> 分页条件 <br />
 * <B>Copyright</B> Copyright (c) 2014 FORWAY R&D All rights reserved. <br />
 * 本软件源代码版权归FORWAY R&D,未经许可不得任意复制与传播.<br />
 * <B>Project</B> common
 *
 * @author Wujianjun
 * @createtime 2014/8/31 19:48
 */
public class PageCondition extends Condition {

    public static final String START_ROW = "K_START_ROW";
    public static final String END_ROW = "K_END_ROW";
    public static final String PAGE_NUM = "K_PAGE_NUM";
    public static final String TOTAL_PAGE_NUM = "K_TOTAL_PAGE_NUM";
    public static final String DATA_SIZE = "K_DATA_SIZE";
    public static final String TOTAL_SIZE = "K_TOTAL_DATA_SIZE";
    public static final String PAGE_DATA = "K_PAGE_DATA";

    public static final Long DEFAULT_PAGE_SIZE = 20L;

    public PageCondition() {
        this(DEFAULT_PAGE_SIZE, 1L);
    }

    public PageCondition(Long dataSize, Long pageNum) {
        if(pageNum < 0) {
            pageNum = 1L;
        }
        setDataSize(dataSize).setPageNum(pageNum);
    }

    public PageCondition setPageNum(Long pageNum) {
        put(PAGE_NUM, pageNum).put(START_ROW, pageNum <= 1 ? 0:((pageNum - 1) * getDataSize()));
        return this;
    }

    public PageCondition correct() {
        this.setPageNum(this.getPageNum());
        return this;
    }

    public Long getPageNum() {
        Object value = get(PAGE_NUM);
        if (Tools.isNull(value)) {
            return 0L;
        }
        return Long.valueOf(value.toString());
    }

    public PageCondition setDataSize(Long dataSize) {
        put(DATA_SIZE, dataSize);
        return this;
    }

    public PageCondition setPageData(List<?> data) {
        put(PAGE_DATA, data);
        return this;
    }

    public List<?> getPageData() {
        return (List<?>) get(PAGE_DATA);
    }

    public Long getDataSize() {
        Object value = get(DATA_SIZE);
        if (Tools.isNull(value)) {
            return 0L;
        }
        return Long.valueOf(value.toString());
    }

    public PageCondition setTotalSize(Long totalSize) {
        put(TOTAL_SIZE, totalSize);
        correct();
        return this;
    }

    public Long getTotalSize() {
        Object value = get(TOTAL_SIZE);
        if (Tools.isNull(value)) {
            return 0L;
        }
        return Long.valueOf(value.toString());
    }

    @Override
    public Object get(Object key) {
        if (TOTAL_PAGE_NUM.equals(key)) {
            return getTotalPageNum();
        }
        if (END_ROW.equals(key)) {
            return getEndRow();
        }
        return super.get(key);
    }

    public Long getEndRow() {
        final Object startRow = super.get(START_ROW);
        final List<?> pageData = getPageData();
        return (Tools.isNull(startRow) ? 0:Long.valueOf(startRow.toString())) + (Tools.isEmpty(pageData) ? this.getDataSize(): pageData.size());
    }

    public Long getTotalPageNum() {
        Long dataSize = getDataSize();
        if (dataSize == null || dataSize <= 0) {
            throw new RuntimeException("每页显示条数未设置!");
        }
        Long totalSize = getTotalSize();
        if (totalSize == null || totalSize < 0) {
            throw new RuntimeException("总记录条数未设置!");
        }
        return totalSize / dataSize + ((totalSize % dataSize > 0) ? 1 : 0);
    }
}
