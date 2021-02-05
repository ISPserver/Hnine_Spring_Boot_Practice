package com.test.board.boardproject.domain;

import lombok.Data;

@Data
public class Board {
    private int boardid;
    private String title;
    private String writer;
    private String content;
    private String regdate;
    private int hit;
}
