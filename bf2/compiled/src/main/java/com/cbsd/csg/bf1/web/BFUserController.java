package com.cbsd.csg.bf1.web;
import com.cbsd.csg.bf1.domain.BFUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/bfusers")
@Controller
@RooWebScaffold(path = "bfusers", formBackingObject = BFUser.class)
public class BFUserController {
}
