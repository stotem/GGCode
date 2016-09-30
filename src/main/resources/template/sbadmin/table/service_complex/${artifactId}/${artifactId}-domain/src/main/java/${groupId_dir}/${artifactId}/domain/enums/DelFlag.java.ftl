package ${groupId}.${artifactId}.domain.enums;

<#include "/basic/author.include"/>
public enum DelFlag {
    VALID((short)1, "有效数据"),
    INVALID((short)2, "无效数据");

    private short index;
    private String name;

    DelFlag(short index, String name) {
        this.index = index;
        this.name = name;
    }

    public static DelFlag getByIndex(short index) {
        for (DelFlag item : values()) {
            if (item.getIndex() == index) {
                return item;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public short getIndex() {
        return index;
    }
}