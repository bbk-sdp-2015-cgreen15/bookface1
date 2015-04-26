package com.cbsd.csg.bf1.repository;
import com.cbsd.csg.bf1.domain.Book;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Book.class)
public interface BookRepository {
}
