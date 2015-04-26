// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.service;

import com.cbsd.csg.bf1.domain.Comment;
import com.cbsd.csg.bf1.repository.CommentRepository;
import com.cbsd.csg.bf1.service.CommentServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommentServiceImpl_Roo_Service {
    
    declare @type: CommentServiceImpl: @Service;
    
    declare @type: CommentServiceImpl: @Transactional;
    
    @Autowired
    CommentRepository CommentServiceImpl.commentRepository;
    
    public long CommentServiceImpl.countAllComments() {
        return commentRepository.count();
    }
    
    public void CommentServiceImpl.deleteComment(Comment comment) {
        commentRepository.delete(comment);
    }
    
    public Comment CommentServiceImpl.findComment(Long id) {
        return commentRepository.findOne(id);
    }
    
    public List<Comment> CommentServiceImpl.findAllComments() {
        return commentRepository.findAll();
    }
    
    public List<Comment> CommentServiceImpl.findCommentEntries(int firstResult, int maxResults) {
        return commentRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CommentServiceImpl.saveComment(Comment comment) {
        commentRepository.save(comment);
    }
    
    public Comment CommentServiceImpl.updateComment(Comment comment) {
        return commentRepository.save(comment);
    }
    
}
