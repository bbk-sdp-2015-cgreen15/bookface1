// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.domain;

import com.cbsd.csg.bf1.domain.UserBookFavouriteDataOnDemand;
import com.cbsd.csg.bf1.domain.UserBookFavouriteIntegrationTest;
import com.cbsd.csg.bf1.repository.UserBookFavouriteRepository;
import com.cbsd.csg.bf1.service.UserBookFavouriteService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserBookFavouriteIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserBookFavouriteIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserBookFavouriteIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UserBookFavouriteIntegrationTest: @Transactional;
    
    @Autowired
    UserBookFavouriteDataOnDemand UserBookFavouriteIntegrationTest.dod;
    
    @Autowired
    UserBookFavouriteService UserBookFavouriteIntegrationTest.userBookFavouriteService;
    
    @Autowired
    UserBookFavouriteRepository UserBookFavouriteIntegrationTest.userBookFavouriteRepository;
    
    @Test
    public void UserBookFavouriteIntegrationTest.testCountAllUserBookFavourites() {
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", dod.getRandomUserBookFavourite());
        long count = userBookFavouriteService.countAllUserBookFavourites();
        Assert.assertTrue("Counter for 'UserBookFavourite' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testFindUserBookFavourite() {
        UserBookFavourite obj = dod.getRandomUserBookFavourite();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to provide an identifier", id);
        obj = userBookFavouriteService.findUserBookFavourite(id);
        Assert.assertNotNull("Find method for 'UserBookFavourite' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'UserBookFavourite' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testFindAllUserBookFavourites() {
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", dod.getRandomUserBookFavourite());
        long count = userBookFavouriteService.countAllUserBookFavourites();
        Assert.assertTrue("Too expensive to perform a find all test for 'UserBookFavourite', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<UserBookFavourite> result = userBookFavouriteService.findAllUserBookFavourites();
        Assert.assertNotNull("Find all method for 'UserBookFavourite' illegally returned null", result);
        Assert.assertTrue("Find all method for 'UserBookFavourite' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testFindUserBookFavouriteEntries() {
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", dod.getRandomUserBookFavourite());
        long count = userBookFavouriteService.countAllUserBookFavourites();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<UserBookFavourite> result = userBookFavouriteService.findUserBookFavouriteEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'UserBookFavourite' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'UserBookFavourite' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testFlush() {
        UserBookFavourite obj = dod.getRandomUserBookFavourite();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to provide an identifier", id);
        obj = userBookFavouriteService.findUserBookFavourite(id);
        Assert.assertNotNull("Find method for 'UserBookFavourite' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserBookFavourite(obj);
        Integer currentVersion = obj.getVersion();
        userBookFavouriteRepository.flush();
        Assert.assertTrue("Version for 'UserBookFavourite' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testUpdateUserBookFavouriteUpdate() {
        UserBookFavourite obj = dod.getRandomUserBookFavourite();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to provide an identifier", id);
        obj = userBookFavouriteService.findUserBookFavourite(id);
        boolean modified =  dod.modifyUserBookFavourite(obj);
        Integer currentVersion = obj.getVersion();
        UserBookFavourite merged = userBookFavouriteService.updateUserBookFavourite(obj);
        userBookFavouriteRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'UserBookFavourite' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testSaveUserBookFavourite() {
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", dod.getRandomUserBookFavourite());
        UserBookFavourite obj = dod.getNewTransientUserBookFavourite(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'UserBookFavourite' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'UserBookFavourite' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UserBookFavouriteIntegrationTest.testDeleteUserBookFavourite() {
        UserBookFavourite obj = dod.getRandomUserBookFavourite();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'UserBookFavourite' failed to provide an identifier", id);
        obj = userBookFavouriteService.findUserBookFavourite(id);
        userBookFavouriteService.deleteUserBookFavourite(obj);
        userBookFavouriteRepository.flush();
        Assert.assertNull("Failed to remove 'UserBookFavourite' with identifier '" + id + "'", userBookFavouriteService.findUserBookFavourite(id));
    }
    
}
