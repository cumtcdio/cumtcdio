package cn.cumtcdio.server.model;

import java.io.Serializable;
import java.util.Date;

/**
 * show
 * @author 
 */
public class Show implements Serializable {
    private Integer id;

    /**
     * 类型 通知0、新闻1、师生风采2、专业信息3、专业实习4
     */
    private Integer type;

    /**
     * 文章标题
     */
    private String title;

    /**
     * iframe对应的地址
     */
    private String htmlAddress;

    /**
     * 时间
     */
    private Date dateTime;

    /**
     * 文章概要（简要说明是干什么的）
     */
    private String summary;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getHtmlAddress() {
        return htmlAddress;
    }

    public void setHtmlAddress(String htmlAddress) {
        this.htmlAddress = htmlAddress;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Show other = (Show) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getHtmlAddress() == null ? other.getHtmlAddress() == null : this.getHtmlAddress().equals(other.getHtmlAddress()))
            && (this.getDateTime() == null ? other.getDateTime() == null : this.getDateTime().equals(other.getDateTime()))
            && (this.getSummary() == null ? other.getSummary() == null : this.getSummary().equals(other.getSummary()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getHtmlAddress() == null) ? 0 : getHtmlAddress().hashCode());
        result = prime * result + ((getDateTime() == null) ? 0 : getDateTime().hashCode());
        result = prime * result + ((getSummary() == null) ? 0 : getSummary().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", type=").append(type);
        sb.append(", htmlAddress=").append(htmlAddress);
        sb.append(", dateTime=").append(dateTime);
        sb.append(", summary=").append(summary);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}