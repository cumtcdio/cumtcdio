package cn.cumtcdio.server.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * user
 * @author 
 */
public class Slide implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    /**
     * 轮播图id
     */
    private Integer id;

    /**
     * 轮播图新闻名称
     */
    @Column(name = "title")
    private String title;

    /**
     * 轮播图图片地址
     */
    @Column(name = "img")
    private String img;

    /**
     * 轮播图新闻地址
     */
    @Column(name = "article_address")
    private String articleAddress;

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
}