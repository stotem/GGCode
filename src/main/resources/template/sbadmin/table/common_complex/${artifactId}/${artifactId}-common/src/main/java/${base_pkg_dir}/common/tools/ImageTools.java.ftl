/*
 * @(#) tools ImageTools.java Feb 28, 2012
 * 
 * Copyright 2012 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.tools;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * <B>Title: ImageTools.java</B><BR/><BR/>
 * <B>Description: 对图片进行处理的工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem </B><BR/><BR/>
 * <B>CreateTime: Feb 28, 2012 8:10:00 PM</B><BR/><BR/>
 * @author Wujianjun
 * @version 1.0
 **/
public class ImageTools {
    /**
     * 得到图片类型
     * @author Wujianjun
     * @createtime Feb 28, 2012 8:10:40 PM
     * @param image 图片文件
     * @return 图片类型
     * @throws IOException
     */
    public static String getImageType(File image) throws IOException {
        FileInputStream in = null;
        // 用于存放文件头两个字节
        byte[] bytes = { 0, 0 };
        try {
            in = new FileInputStream(image);
            int readByte = in.read(bytes);
            while (bytes.length - readByte > 0) {
                readByte += in.read(bytes, readByte, bytes.length - readByte);
            }
        }
        finally {
            if ( in != null ) {
                in.close();
            }
        }
        if ( ((bytes[0] & 0xFF) == 0x47) && ((bytes[1] & 0xFF) == 0x49) ) { // GIF
            return "gif";
        }
        if ( ((bytes[0] & 0xFF) == 0x89) && ((bytes[1] & 0xFF) == 0x50) ) { // PNG
            return "png";
        }
        if ( ((bytes[0] & 0xFF) == 0xFF) && ((bytes[1] & 0xFF) == 0xD8) ) { // JPG
            return "jpg";
        }
        if ( ((bytes[0] & 0xFF) == 0x42) && ((bytes[1] & 0xFF) == 0x4D) ) { // BMP
            return "bmp";
        }
        return null;
    }

    /**
     * 将图片改变成指定的大小
     * @author Wujianjun
     * @createtime Feb 28, 2012 8:11:07 PM
     * @param width 指定的宽
     * @param height 指定的高
     * @param sourceImage 源图片文件
     * @param saveImage 存储的图片文件
     * @throws IOException
     */
    public static void resizeImage(int width, int height, File sourceImage, File saveImage) throws IOException {
        BufferedImage saveBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        BufferedImage sourceBufferedImage = ImageIO.read(sourceImage);
        Graphics2D graphics = saveBufferedImage.createGraphics();
        try {
            graphics.setComposite(AlphaComposite.Src);
            graphics.drawImage(sourceBufferedImage, 0, 0, width, height, null);
        }
        finally {
            graphics.dispose();
        }
        ImageIO.write(saveBufferedImage, getImageType(sourceImage), saveImage);
    }

    /**
     * 将图片进行褪色处理
     * @author Wujianjun
     * @createtime Feb 28, 2012 8:12:15 PM
     * @param image 图片文件
     * @throws IOException
     */
    public static void fadeImage(File image) throws IOException {
        BufferedImage sourceImage = ImageIO.read(image);
        BufferedImage outputImage = null;
        outputImage = new BufferedImage(sourceImage.getWidth(), sourceImage.getHeight(), BufferedImage.TYPE_BYTE_GRAY);
        Graphics2D graphics = outputImage.createGraphics();
        try {
            graphics.setComposite(AlphaComposite.Src);
            graphics.drawImage(sourceImage, 0, 0, sourceImage.getWidth(), sourceImage.getHeight(), null);
        }
        finally {
            graphics.dispose();
        }
        ImageIO.write(outputImage, getImageType(image), image);
    }

}
