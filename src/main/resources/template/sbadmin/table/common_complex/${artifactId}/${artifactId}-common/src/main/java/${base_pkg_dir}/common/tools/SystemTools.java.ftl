package ${base_pkg}.common.tools;

import java.lang.management.ManagementFactory;
import java.lang.management.ThreadInfo;
import java.lang.management.ThreadMXBean;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Pattern;

/**
 * <B>Title: SystemTools.java</B><BR/><BR/>
 * <B>Description: 系统信息工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem</B><BR/><BR/>
 * <B>CreateTime: Feb 11, 2012 5:03:25 PM</B><BR/><BR/>
 * 
 * @author Wujianjun
 * @version 1.0
 */
public class SystemTools {
	private static final String COMMON_IP = "127.0.0.1";
	private static final String IP_PATTERN = "([1-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}";

	/**
	 * 得到当前进程ID
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:04:14 PM
	 * @return 进程ID
	 */
	public static int getProcessID() {
		String processName = java.lang.management.ManagementFactory
				.getRuntimeMXBean().getName();
		if ((processName != null) && (processName.split("@").length > 0)) {
			return Integer.valueOf(processName.split("@")[0]).intValue();
		}
		return 0;
	}

	/**
	 * 得到本机IP地址(所有网卡)
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:04:31 PM
	 * @return 本机IP地址
	 * @throws SocketException
	 */
	public static String[] getHostIPAddress() throws SocketException {
		List<String> result = new ArrayList<String>();
		String ipAddr = null;

		Pattern pattern = Pattern.compile(IP_PATTERN);
		Enumeration<NetworkInterface> netIf = NetworkInterface
				.getNetworkInterfaces();
		while (netIf.hasMoreElements()) {
			NetworkInterface nwi = netIf.nextElement();
			Enumeration<InetAddress> address = nwi.getInetAddresses();
			while (address.hasMoreElements()) {
				ipAddr = address.nextElement().getHostAddress();
				if ((pattern.matcher(ipAddr).find())
						&& (!COMMON_IP.equalsIgnoreCase(ipAddr))) {
					result.add(ipAddr);
				}
			}
		}
		return result.toArray(new String[result.size()]);
	}

	/**
	 * 得到所有的线程信息
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:01 PM
	 * @return 线程信息集合
	 */
	public static ThreadInfo[] getAllThreadInfo() {
		ThreadMXBean treadMxBean = ManagementFactory.getThreadMXBean();
		long[] threadIds = treadMxBean.getAllThreadIds();
		return treadMxBean.getThreadInfo(threadIds);
	}

	/**
	 * 得到已死锁线程信息
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:23 PM
	 * @return 已死锁线程信息集合
	 */
	public static ThreadInfo[] getDeadlockedThreadInfo() {
		ThreadMXBean treadMxBean = ManagementFactory.getThreadMXBean();
		long[] threadIds = treadMxBean.findDeadlockedThreads();
		return treadMxBean.getThreadInfo(threadIds);
	}

	/**
	 * 得到当前系统名称
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:48 PM
	 * @return 当前系统名称
	 */
	public static String getOsName() {
		return System.getProperty("os.name");
	}

	/**
	 * 得到当前系统版本
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:48 PM
	 * @return 当前系统版本
	 */
	public static String getOsVersion() {
		return System.getProperty("os.version");
	}

	/**
	 * 得到当前用户主目录
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:48 PM
	 * @return 当前用户主目录
	 */
	public static String getUserHome() {
		return System.getProperty("user.home");
	}

	/**
	 * 得到当前用户目录
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:48 PM
	 * @return 当前用户目录
	 */
	public static String getUserDir() {
		return System.getProperty("user.dir");
	}

	/**
	 * 得到当前用户名称
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:48 PM
	 * @return 当前用户名称
	 */
	public static String getUserName() {
		return System.getProperty("user.name");
	}

	/**
	 * 得到当前系统换行符
	 * 
	 * @author Wujianjun
	 * @createtime Feb 11, 2012 5:07:48 PM
	 * @return 当前系统换行符
	 */
	public static String getLineSeparator() {
		return System.getProperty("line.separator");
	}
}
