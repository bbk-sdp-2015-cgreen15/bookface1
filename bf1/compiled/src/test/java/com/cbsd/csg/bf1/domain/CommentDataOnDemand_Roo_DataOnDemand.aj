// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.domain;

import com.cbsd.csg.bf1.domain.BFUserDataOnDemand;
import com.cbsd.csg.bf1.domain.BookDataOnDemand;
import com.cbsd.csg.bf1.domain.Comment;
import com.cbsd.csg.bf1.domain.CommentDataOnDemand;
import com.cbsd.csg.bf1.repository.CommentRepository;
import com.cbsd.csg.bf1.service.CommentService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CommentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommentDataOnDemand: @Component;
    
    private Random CommentDataOnDemand.rnd = new SecureRandom();
    
    private List<Comment> CommentDataOnDemand.data;
    
    @Autowired
    BookDataOnDemand CommentDataOnDemand.bookDataOnDemand;
    
    @Autowired
    BFUserDataOnDemand CommentDataOnDemand.bFUserDataOnDemand;
    
    @Autowired
    CommentService CommentDataOnDemand.commentService;
    
    @Autowired
    CommentRepository CommentDataOnDemand.commentRepository;
    
    public Comment CommentDataOnDemand.getNewTransientComment(int index) {
        Comment obj = new Comment();
        setCommentText(obj, index);
        return obj;
    }
    
    public void CommentDataOnDemand.setCommentText(Comment obj, int index) {
        String commentText = "commentText_" + index;
        obj.setCommentText(commentText);
    }
    
    public Comment CommentDataOnDemand.getSpecificComment(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Comment obj = data.get(index);
        Long id = obj.getId();
        return commentService.findComment(id);
    }
    
    public Comment CommentDataOnDemand.getRandomComment() {
        init();
        Comment obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return commentService.findComment(id);
    }
    
    public boolean CommentDataOnDemand.modifyComment(Comment obj) {
        return false;
    }
    
    public void CommentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = commentService.findCommentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Comment' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Comment>();
        for (int i = 0; i < 10; i++) {
            Comment obj = getNewTransientComment(i);
            try {
                commentService.saveComment(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            commentRepository.flush();
            data.add(obj);
        }
    }
    
}