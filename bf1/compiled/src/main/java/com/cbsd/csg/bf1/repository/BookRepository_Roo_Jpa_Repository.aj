// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.repository;

import com.cbsd.csg.bf1.domain.Book;
import com.cbsd.csg.bf1.repository.BookRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect BookRepository_Roo_Jpa_Repository {
    
    declare parents: BookRepository extends JpaRepository<Book, Long>;
    
    declare parents: BookRepository extends JpaSpecificationExecutor<Book>;
    
    declare @type: BookRepository: @Repository;
    
}
