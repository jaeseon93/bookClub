package com.seon2.bookclub.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
public class ApiController {

    public void streamTest() {
        List<Integer> integerList = Arrays.asList(3,1,5,2,4);
        List<Integer> collect = integerList.stream().sorted().collect(Collectors.toList());
        log.info("integerList {}", integerList);
        log.info("collect {}", collect);
    }
}
