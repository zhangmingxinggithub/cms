package util.sigar;

public class MonitorInfoBean {
	/** 可使用内存. */
    private String totalMemory;
    /** 剩余内存. */
    private String freeMemory;
    /** 最大可使用内存. */
    private String maxMemory;
    /** 操作系统. */
    private String osName;
    /** 总的物理内存. */
    private String totalMemorySize;
    /** 剩余的物理内存. */
    private String freePhysicalMemorySize;
    /** 已使用的物理内存. */
    private String usedMemory;

    public String getUsedMemory() {
        return usedMemory;
    }

    public void setUsedMemory(String usedMemory) {
        this.usedMemory = usedMemory;
    }

    public String getFreePhysicalMemorySize() {
        return freePhysicalMemorySize;
    }

    public void setFreePhysicalMemorySize(String freePhysicalMemorySize) {
        this.freePhysicalMemorySize = freePhysicalMemorySize;
    }

    public String getTotalMemorySize() {
        return totalMemorySize;
    }

    public void setTotalMemorySize(String totalMemorySize) {
        this.totalMemorySize = totalMemorySize;
    }

    public String getFreeMemory() {
        return freeMemory;
    }

    public void setFreeMemory(String freeMemory) {
        this.freeMemory = freeMemory;
    }

    public String getMaxMemory() {
        return maxMemory;
    }

    public void setMaxMemory(String maxMemory) {
        this.maxMemory = maxMemory;
    }

    public String getTotalMemory() {
        return totalMemory;
    }

    public void setTotalMemory(String totalMemory) {
        this.totalMemory = totalMemory;
    }

    /** 线程总数. */
    private int totalThread;

    public String getCpuRatio() {
        return cpuRatio;
    }

    public void setCpuRatio(String cpuRatio) {
        this.cpuRatio = cpuRatio;
    }

    /** cpu使用率. */
    private String cpuRatio;


    public String getOsName() {
        return osName;
    }
    public void setOsName(String osName) {
        this.osName = osName;
    }

    public int getTotalThread() {
        return totalThread;
    }
    public void setTotalThread(int totalThread) {
        this.totalThread = totalThread;
    }
}
