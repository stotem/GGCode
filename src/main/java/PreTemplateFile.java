import java.io.File;

/**
 * <B>Description</B>  <br />
 * <B>Copyright</B> Copyright (c) 2014 www.diligrp.com All rights reserved. <br />
 * 本软件源代码版权归地利集团,未经许可不得任意复制与传播.<br />
 * <B>Company</B> 地利集团
 *
 * @author Wujianjun
 * @createTime 16/7/21 10:35
 */
public abstract class PreTemplateFile {
    protected File outRootDir;

    public PreTemplateFile(File outRootDir) {
        this.outRootDir = outRootDir;
    }

    public void beginProcess() {
        throw new UnsupportedOperationException();
    }

    public void finishProcess() {
        throw new UnsupportedOperationException();
    }

    public abstract boolean support();
}
