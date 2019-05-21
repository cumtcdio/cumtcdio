package cn.cumtcdio.server.VO;

/**
 * @author SpringBoot Jun
 * @date 2019/5/19 20:02
 */
public class SlideVO {
    private Integer id;
    private String title;
    private String img;
    private String articleAddress;
    private Integer articleId;
    private Integer deleted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getArticleAddress() {
        return articleAddress;
    }

    public void setArticleAddress(String articleAddress) {
        this.articleAddress = articleAddress;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }
}
