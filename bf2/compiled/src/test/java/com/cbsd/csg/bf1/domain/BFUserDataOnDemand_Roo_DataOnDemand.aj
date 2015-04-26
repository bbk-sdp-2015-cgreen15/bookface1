// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.domain;

import com.cbsd.csg.bf1.domain.BFUser;
import com.cbsd.csg.bf1.domain.BFUserDataOnDemand;
import com.cbsd.csg.bf1.repository.BFUserRepository;
import com.cbsd.csg.bf1.service.BFUserService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect BFUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BFUserDataOnDemand: @Component;
    
    private Random BFUserDataOnDemand.rnd = new SecureRandom();
    
    private List<BFUser> BFUserDataOnDemand.data;
    
    @Autowired
    BFUserService BFUserDataOnDemand.bFUserService;
    
    @Autowired
    BFUserRepository BFUserDataOnDemand.bFUserRepository;
    
    public BFUser BFUserDataOnDemand.getNewTransientBFUser(int index) {
        BFUser obj = new BFUser();
        setEmail(obj, index);
        setUserScreenName(obj, index);
        return obj;
    }
    
    public void BFUserDataOnDemand.setEmail(BFUser obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void BFUserDataOnDemand.setUserScreenName(BFUser obj, int index) {
        String userScreenName = "userScreenName_" + index;
        obj.setUserScreenName(userScreenName);
    }
    
    public BFUser BFUserDataOnDemand.getSpecificBFUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        BFUser obj = data.get(index);
        Long id = obj.getId();
        return bFUserService.findBFUser(id);
    }
    
    public BFUser BFUserDataOnDemand.getRandomBFUser() {
        init();
        BFUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return bFUserService.findBFUser(id);
    }
    
    public boolean BFUserDataOnDemand.modifyBFUser(BFUser obj) {
        return false;
    }
    
    public void BFUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = bFUserService.findBFUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'BFUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<BFUser>();
        for (int i = 0; i < 10; i++) {
            BFUser obj = getNewTransientBFUser(i);
            try {
                bFUserService.saveBFUser(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            bFUserRepository.flush();
            data.add(obj);
        }
    }
    
}
