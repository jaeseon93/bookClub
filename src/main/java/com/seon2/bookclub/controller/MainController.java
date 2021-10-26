package com.seon2.bookclub.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Slf4j
@Controller
public class MainController {

    @GetMapping("/main")
    public String main() {
        return "main";
    }

    @GetMapping("/book/detail/{index}/{title}")
    public ModelAndView detail(@PathVariable int index, @PathVariable String title) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("index", index);
        mav.addObject("title", title);
        mav.setViewName("detail");
        return mav;
    }
}
