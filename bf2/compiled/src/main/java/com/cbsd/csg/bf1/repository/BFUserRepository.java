package com.cbsd.csg.bf1.repository;
import com.cbsd.csg.bf1.domain.BFUser;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = BFUser.class)
public interface BFUserRepository {
}
