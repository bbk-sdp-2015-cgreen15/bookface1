// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.domain;

import com.cbsd.csg.bf1.domain.Author;
import com.cbsd.csg.bf1.domain.Book;

privileged aspect Book_Roo_JavaBean {
    
    public String Book.getName() {
        return this.name;
    }
    
    public void Book.setName(String name) {
        this.name = name;
    }
    
    public Author Book.getAuthor() {
        return this.author;
    }
    
    public void Book.setAuthor(Author author) {
        this.author = author;
    }
    
}
