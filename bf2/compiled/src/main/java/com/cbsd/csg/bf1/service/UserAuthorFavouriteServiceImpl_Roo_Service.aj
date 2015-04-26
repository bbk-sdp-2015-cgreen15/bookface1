// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.service;

import com.cbsd.csg.bf1.domain.UserAuthorFavourite;
import com.cbsd.csg.bf1.repository.UserAuthorFavouriteRepository;
import com.cbsd.csg.bf1.service.UserAuthorFavouriteServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAuthorFavouriteServiceImpl_Roo_Service {
    
    declare @type: UserAuthorFavouriteServiceImpl: @Service;
    
    declare @type: UserAuthorFavouriteServiceImpl: @Transactional;
    
    @Autowired
    UserAuthorFavouriteRepository UserAuthorFavouriteServiceImpl.userAuthorFavouriteRepository;
    
    public long UserAuthorFavouriteServiceImpl.countAllUserAuthorFavourites() {
        return userAuthorFavouriteRepository.count();
    }
    
    public void UserAuthorFavouriteServiceImpl.deleteUserAuthorFavourite(UserAuthorFavourite userAuthorFavourite) {
        userAuthorFavouriteRepository.delete(userAuthorFavourite);
    }
    
    public UserAuthorFavourite UserAuthorFavouriteServiceImpl.findUserAuthorFavourite(Long id) {
        return userAuthorFavouriteRepository.findOne(id);
    }
    
    public List<UserAuthorFavourite> UserAuthorFavouriteServiceImpl.findAllUserAuthorFavourites() {
        return userAuthorFavouriteRepository.findAll();
    }
    
    public List<UserAuthorFavourite> UserAuthorFavouriteServiceImpl.findUserAuthorFavouriteEntries(int firstResult, int maxResults) {
        return userAuthorFavouriteRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void UserAuthorFavouriteServiceImpl.saveUserAuthorFavourite(UserAuthorFavourite userAuthorFavourite) {
        userAuthorFavouriteRepository.save(userAuthorFavourite);
    }
    
    public UserAuthorFavourite UserAuthorFavouriteServiceImpl.updateUserAuthorFavourite(UserAuthorFavourite userAuthorFavourite) {
        return userAuthorFavouriteRepository.save(userAuthorFavourite);
    }
    
}