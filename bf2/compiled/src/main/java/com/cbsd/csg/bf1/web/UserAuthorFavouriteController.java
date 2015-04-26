package com.cbsd.csg.bf1.web;
import com.cbsd.csg.bf1.domain.UserAuthorFavourite;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/userauthorfavourites")
@Controller
@RooWebScaffold(path = "userauthorfavourites", formBackingObject = UserAuthorFavourite.class)
public class UserAuthorFavouriteController {
}
