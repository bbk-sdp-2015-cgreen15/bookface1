package com.cbsd.csg.bf1.repository;
import com.cbsd.csg.bf1.domain.UserBookFavourite;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = UserBookFavourite.class)
public interface UserBookFavouriteRepository {
}
