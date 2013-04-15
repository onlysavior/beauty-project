package com.gzm.xm.common.entity;


import javax.persistence.*;

@Entity
@Table(name = "constant")
public class Constant extends AbstractEntity {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;

    private String content;

    @Override
    public Object getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
