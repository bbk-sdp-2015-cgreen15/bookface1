package com.cbsd.csg.bf1.repository;
import com.cbsd.csg.bf1.domain.Author;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Author.class)
public interface AuthorRepository {
}
