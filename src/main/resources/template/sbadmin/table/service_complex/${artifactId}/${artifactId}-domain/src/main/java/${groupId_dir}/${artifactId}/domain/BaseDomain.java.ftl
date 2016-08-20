
package ${groupId}.${artifactId}.domain;

import java.io.Serializable;
import java.sql.Timestamp;

<#include "/basic/author.include"/>
public abstract class BaseDomain implements Serializable {

    public static final long DELFLAG_VALID = 1;
    public static final long DELFLAG_INVALID = 2;

    private long id;
    private long delFlag;
    private Timestamp createTime;
    private Timestamp updateTime;

    /**
     * get id value
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * set id value
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * get delFlag value
     * @return the delFlag
     */
    public long getDelFlag() {
        return delFlag;
    }

    /**
     * set delFlag value
     * @param delFlag the delFlag to set
     */
    public void setDelFlag(long delFlag) {
        this.delFlag = delFlag;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        return result;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if ( this == obj )
            return true;
        if ( obj == null )
            return false;
        if ( getClass() != obj.getClass() )
            return false;
        BaseDomain other = (BaseDomain) obj;
        if ( id != other.id )
            return false;
        return true;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public abstract String toString();

}
