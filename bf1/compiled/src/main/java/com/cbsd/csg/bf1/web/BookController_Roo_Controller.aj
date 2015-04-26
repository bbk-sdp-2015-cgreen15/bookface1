// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.cbsd.csg.bf1.web;

import com.cbsd.csg.bf1.domain.Book;
import com.cbsd.csg.bf1.service.AuthorService;
import com.cbsd.csg.bf1.service.BookService;
import com.cbsd.csg.bf1.web.BookController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BookController_Roo_Controller {
    
    @Autowired
    BookService BookController.bookService;
    
    @Autowired
    AuthorService BookController.authorService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BookController.create(@Valid Book book, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, book);
            return "books/create";
        }
        uiModel.asMap().clear();
        bookService.saveBook(book);
        return "redirect:/books/" + encodeUrlPathSegment(book.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BookController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Book());
        return "books/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BookController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("book", bookService.findBook(id));
        uiModel.addAttribute("itemId", id);
        return "books/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BookController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("books", bookService.findBookEntries(firstResult, sizeNo));
            float nrOfPages = (float) bookService.countAllBooks() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("books", bookService.findAllBooks());
        }
        return "books/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BookController.update(@Valid Book book, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, book);
            return "books/update";
        }
        uiModel.asMap().clear();
        bookService.updateBook(book);
        return "redirect:/books/" + encodeUrlPathSegment(book.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BookController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, bookService.findBook(id));
        return "books/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BookController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Book book = bookService.findBook(id);
        bookService.deleteBook(book);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/books";
    }
    
    void BookController.populateEditForm(Model uiModel, Book book) {
        uiModel.addAttribute("book", book);
        uiModel.addAttribute("authors", authorService.findAllAuthors());
    }
    
    String BookController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
