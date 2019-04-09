package cn.cumtcdio.server.VO;

import java.util.Date;

/**
 * @author SpringBoot Jun
 * @date 2019/3/31 17:10
 */
public class ShowInfoVO {
    Integer showId;

    Integer type;

    String title;

    String htmlAddress;

    String htmlContent;

    String dateTime;

    String summary;

    public Integer getShowId() {
        return showId;
    }

    public void setShowId(Integer showId) {
        this.showId = showId;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHtmlAddress() {
        return htmlAddress;
    }

    public void setHtmlAddress(String htmlAddress) {
        this.htmlAddress = htmlAddress;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }
}
