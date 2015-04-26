// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.domain;

import com.cbsd.csg.bf1.domain.BFUserDataOnDemand;
import com.cbsd.csg.bf1.domain.BookDataOnDemand;
import com.cbsd.csg.bf1.domain.UserBookFavourite;
import com.cbsd.csg.bf1.domain.UserBookFavouriteDataOnDemand;
import com.cbsd.csg.bf1.repository.UserBookFavouriteRepository;
import com.cbsd.csg.bf1.service.UserBookFavouriteService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect UserBookFavouriteDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserBookFavouriteDataOnDemand: @Component;
    
    private Random UserBookFavouriteDataOnDemand.rnd = new SecureRandom();
    
    private List<UserBookFavourite> UserBookFavouriteDataOnDemand.data;
    
    @Autowired
    BookDataOnDemand UserBookFavouriteDataOnDemand.bookDataOnDemand;
    
    @Autowired
    BFUserDataOnDemand UserBookFavouriteDataOnDemand.bFUserDataOnDemand;
    
    @Autowired
    UserBookFavouriteService UserBookFavouriteDataOnDemand.userBookFavouriteService;
    
    @Autowired
    UserBookFavouriteRepository UserBookFavouriteDataOnDemand.userBookFavouriteRepository;
    
    public UserBookFavourite UserBookFavouriteDataOnDemand.getNewTransientUserBookFavourite(int index) {
        UserBookFavourite obj = new UserBookFavourite();
        return obj;
    }
    
    public UserBookFavourite UserBookFavouriteDataOnDemand.getSpecificUserBookFavourite(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        UserBookFavourite obj = data.get(index);
        Long id = obj.getId();
        return userBookFavouriteService.findUserBookFavourite(id);
    }
    
    public UserBookFavourite UserBookFavouriteDataOnDemand.getRandomUserBookFavourite() {
        init();
        UserBookFavourite obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return userBookFavouriteService.findUserBookFavourite(id);
    }
    
    public boolean UserBookFavouriteDataOnDemand.modifyUserBookFavourite(UserBookFavourite obj) {
        return false;
    }
    
    public void UserBookFavouriteDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = userBookFavouriteService.findUserBookFavouriteEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'UserBookFavourite' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<UserBookFavourite>();
        for (int i = 0; i < 10; i++) {
            UserBookFavourite obj = getNewTransientUserBookFavourite(i);
            try {
                userBookFavouriteService.saveUserBookFavourite(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            userBookFavouriteRepository.flush();
            data.add(obj);
        }
    }
    
}