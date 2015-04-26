package com.cbsd.csg.bf1.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaEntity
public class UserAuthorFavourite {

    /**
     */
    @ManyToOne
    private Author author;

    /**
     */
    @ManyToOne
    private BFUser userScreenName;
}
