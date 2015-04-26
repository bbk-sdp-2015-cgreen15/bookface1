package com.cbsd.csg.bf1.web;
import com.cbsd.csg.bf1.domain.UserBookFavourite;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/userbookfavourites")
@Controller
@RooWebScaffold(path = "userbookfavourites", formBackingObject = UserBookFavourite.class)
public class UserBookFavouriteController {
}
