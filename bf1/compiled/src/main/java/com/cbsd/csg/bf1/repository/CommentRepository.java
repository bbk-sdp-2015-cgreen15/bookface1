package com.cbsd.csg.bf1.repository;
import com.cbsd.csg.bf1.domain.Comment;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Comment.class)
public interface CommentRepository {
}
