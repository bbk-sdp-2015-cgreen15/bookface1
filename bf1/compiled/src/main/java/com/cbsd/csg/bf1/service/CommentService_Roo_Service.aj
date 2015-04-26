// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.service;

import com.cbsd.csg.bf1.domain.Comment;
import com.cbsd.csg.bf1.service.CommentService;
import java.util.List;

privileged aspect CommentService_Roo_Service {
    
    public abstract long CommentService.countAllComments();    
    public abstract void CommentService.deleteComment(Comment comment);    
    public abstract Comment CommentService.findComment(Long id);    
    public abstract List<Comment> CommentService.findAllComments();    
    public abstract List<Comment> CommentService.findCommentEntries(int firstResult, int maxResults);    
    public abstract void CommentService.saveComment(Comment comment);    
    public abstract Comment CommentService.updateComment(Comment comment);    
}
