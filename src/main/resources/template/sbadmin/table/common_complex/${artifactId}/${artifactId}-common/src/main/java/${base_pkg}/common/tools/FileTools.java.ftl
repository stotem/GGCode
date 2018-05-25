package ${base_pkg}.common.tools;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 * <B>Title: FileTools.java</B><BR/><BR/>
 * <B>Description: 操作文件工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem </B><BR/><BR/>
 * <B>CreateTime: Feb 11, 2012 4:20:09 PM</B><BR/><BR/>
 * @author Wujianjun
 * @version 1.0
 */
public class FileTools {

    /**
     * 读取Properties配置文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:20:21 PM
     * @param file 文件路径
     * @return 配置内容MAP
     * @throws IOException
     */
    @SuppressWarnings("rawtypes")
    public static Properties readProperties(String file) throws IOException {
        Properties result = new Properties();
        Properties tmp = new Properties();
        InputStream readIn = null;
        try {
            readIn = DBTools.class.getResourceAsStream(file);
            tmp.load(readIn);
        }
        catch (NullPointerException e) {
            throw new IOException("File " + file + " not exists.");
        }
        finally {
            if ( !Tools.isNull(readIn) ) {
                readIn.close();
                readIn = null;
            }
        }

        Iterator iterator = tmp.entrySet().iterator();
        Map.Entry entry = null;
        while (iterator.hasNext()) {
            entry = (Map.Entry) iterator.next();
            if ( !entry.getKey().toString().startsWith("#") && !entry.getKey().toString().startsWith("[") ) {
                result.put(entry.getKey().toString().trim(), entry.getValue().toString().trim());
            }
        }
        tmp.clear();
        tmp = null;
        return result;
    }

    /**
     * 创建文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:21:45 PM
     * @param file 文件
     * @param cover 如果文件存在是否覆盖
     * @throws IOException
     */
    public static void createFile(File file, boolean cover) throws IOException {
        File parentFile = file.getParentFile();
        if ( !parentFile.exists() ) {
            while (!parentFile.mkdirs())
                ;
        }

        if ( (file.exists()) && (cover) ) {
            while (!file.delete())
                ;
        }
        if ( !file.exists() ) {
            while (!file.createNewFile())
                ;
        }
    }

    /**
     * COPY文件内容
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:22:26 PM
     * @param src 源文件
     * @param dest 目标文件
     * @param cover 是否覆盖
     * @throws IOException
     */
    public static void copy(File src, File dest, boolean cover) throws IOException {
        if ( src.isDirectory() ) {
            throw new IOException("The src is directory.");
        }
        if ( dest.isDirectory() ) {
            throw new IOException("The dest is directory.");
        }
        InputStream fis = new DataInputStream(new FileInputStream(src));
        OutputStream fos = new DataOutputStream(new FileOutputStream(dest));
        byte[] buf = new byte[1024];
        try {
            int i;
            while ((i = fis.read(buf)) >= 0) {
                fos.write(buf, 0, i);
            }
        }
        finally {
            if ( fis != null ) {
                fis.close();
            }
            fis = null;
            if ( fos != null ) {
                fos.close();
            }
            fos = null;
        }
    }

    /**
     * COPY文件(包含子目录)
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:25:00 PM
     * @param src 源文件
     * @param dest 目标文件
     * @param cover 是否覆盖
     * @throws IOException
     */
    public static void copytree(File src, File dest, boolean cover) throws IOException {
        if ( src.isFile() ) {
            copy(src, dest, cover);
        }
        else {
            File[] children = src.listFiles();
            for (int i = 0; i < children.length; i++) {
                File f = new File(dest, children[i].getName());

                if ( children[i].isDirectory() ) {
                    while (!f.mkdirs())
                        ;
                    copytree(children[i], f, cover);
                }
                else {
                    copy(children[i], f, cover);
                }
            }
        }
    }

    /**
     * 移动文件 (包含子目录)
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:26:19 PM
     * @param src 源文件
     * @param dest 目标文件
     * @param cover 是否覆盖
     * @throws IOException
     */
    public static void movetree(File src, File dest, boolean cover) throws IOException {
        copytree(src, dest, cover);
        deltree(src);
    }

    /**
     * 删除文件(包含子目录)
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:26:44 PM
     * @param f 文件
     */
    public static void deltree(File f) {
        File[] children = f.listFiles();
        if ( (children != null) && (children.length != 0) ) {
            for (int i = 0; i < children.length; i++) {
                deltree(children[i]);
            }
        }
        while (!f.delete())
            ;
    }

    /**
     * 判断此文件(包含目录)是否有包含指定后缀的文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:41:12 PM
     * @param file 文件
     * @param suffix 后缀
     * @return 是否存在指定文件
     */
    public static boolean contains(File file, String suffix) {
        if ( (!file.exists()) ) {
            return false;
        }
        if ( file.isFile() ) {
            return file.getName().endsWith(suffix);
        }
        File[] children = file.listFiles();
        for (int i = 0; i < children.length; i++) {
            if ( (children[i].isFile()) && (children[i].getName().endsWith(suffix)) ) {
                return true;
            }
        }
        return false;
    }

    /**
     * 得到目录当前使用
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:42:17 PM
     * @param directory 目录
     * @return 当前使用率
     * @throws IOException
     */
    public static float getUsedSpace(File directory) throws IOException {
        if ( !directory.exists() ) {
            throw new IOException("The directory not exists.");
        }
        if ( directory.isFile() ) {
            throw new IOException("The directory is file.");
        }
        long totalSpace = directory.getTotalSpace();
        return totalSpace == 0L ? 1.0F : (float) directory.getFreeSpace() / (float) totalSpace;
    }

    /**
     * 得到目录当前使用
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:42:17 PM
     * @param directory 目录
     * @return 当前使用率
     * @throws IOException
     */
    public static float getUsedSpace(String directory) throws IOException {
        return getUsedSpace(new File(directory));
    }

    /**
     * 读取xml文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:43:17 PM
     * @param xmlFile xml文件
     * @return 文件Document对象
     * @throws SAXException
     * @throws IOException
     * @throws ParserConfigurationException
     */
    public static Document readDocument(String xmlFile) throws SAXException, IOException, ParserConfigurationException {
        return readDocument(new File(xmlFile));
    }

    /**
     * 读取xml文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:43:17 PM
     * @param xmlFile xml文件
     * @return 文件Document对象
     * @throws SAXException
     * @throws IOException
     * @throws ParserConfigurationException
     */
    public static Document readDocument(File xmlFile) throws SAXException, IOException, ParserConfigurationException {
        return readDocument(new FileInputStream(xmlFile));
    }

    /**
     * 读取xml文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:43:17 PM
     * @param xmlFileInputStream xml文件读取流
     * @return 文件Document对象
     * @throws SAXException
     * @throws IOException
     * @throws ParserConfigurationException
     */
    public static Document readDocument(InputStream xmlFileInputStream) throws SAXException, IOException,
            ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = factory.newDocumentBuilder();
        try {
            Document localDocument = documentBuilder.parse(xmlFileInputStream);
            return localDocument;
        }
        finally {
            if ( xmlFileInputStream != null ) {
                xmlFileInputStream.close();
            }
            xmlFileInputStream = null;
        }
    }

    /**
     * 将Document对象存储为硬盘文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:47:00 PM
     * @param document Document对象
     * @param file 硬盘文件
     * @throws TransformerException
     * @throws IOException
     */
    public static void storeDocument(Document document, File file) throws TransformerException, IOException {
        createFile(file, true);
        storeDocument(document, new FileOutputStream(file));
    }

    /**
     * 将Document对象存储为硬盘文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:47:00 PM
     * @param document Document对象
     * @param file 硬盘文件
     * @throws TransformerException
     * @throws IOException
     */
    public static void storeDocument(Document document, String file) throws TransformerException, IOException {
        storeDocument(document, new File(file));
    }

    /**
     * 将Document对象存储为硬盘文件
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:47:00 PM
     * @param document Document对象
     * @param outputStream 文件输出流
     * @throws TransformerException
     * @throws IOException
     */
    public static void storeDocument(Document document, OutputStream outputStream) throws TransformerException,
            IOException {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty("encoding", "utf-8");
        transformer.setOutputProperty("indent", "yes");
        DOMSource source = new DOMSource(document);
        PrintWriter pw = null;
        try {
            pw = new PrintWriter(outputStream);
            StreamResult result = new StreamResult(pw);
            transformer.transform(source, result);
            pw.flush();
        }
        finally {
            if ( pw != null ) {
                pw.close();
            }
            pw = null;
            if ( outputStream != null ) {
                outputStream.close();
            }
            outputStream = null;
        }
    }
}
