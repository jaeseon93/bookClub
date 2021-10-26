package com.seon2.bookclub;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class BookClubApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookClubApplication.class, args);
    }

}
