package com.test.board.boardproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@ComponentScan(basePackages={"com.test.board.boardproject.*"})
@SpringBootApplication
public class BoardprojectApplication {

    public static void main(String[] args) {
        SpringApplication.run(BoardprojectApplication.class, args);
    }

}
