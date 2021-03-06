package com.cbsd.csg.bf1.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Comment {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String commentText;

    /**
     */
    @ManyToOne
    private Book book;

    /**
     */
    @ManyToOne
    private BFUser userScreenName;
}
