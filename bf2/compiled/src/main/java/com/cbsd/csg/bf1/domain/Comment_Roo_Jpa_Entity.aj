// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.domain;

import com.cbsd.csg.bf1.domain.Comment;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Comment_Roo_Jpa_Entity {
    
    declare @type: Comment: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Comment.id;
    
    @Version
    @Column(name = "version")
    private Integer Comment.version;
    
    public Long Comment.getId() {
        return this.id;
    }
    
    public void Comment.setId(Long id) {
        this.id = id;
    }
    
    public Integer Comment.getVersion() {
        return this.version;
    }
    
    public void Comment.setVersion(Integer version) {
        this.version = version;
    }
    
}
