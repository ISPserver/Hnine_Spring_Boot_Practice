package com.test.board.boardproject.rest;

import com.test.board.boardproject.domain.Board;
import com.test.board.boardproject.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class RestBoardController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    BoardService boardService;


    @PostMapping("/rest/board")
    public int insertBoard(@RequestBody Board board){
//        logger.info(board.getTitle());
//        logger.info(board.getWriter());
//        logger.info(board.getContent());
        int result=boardService.insertBoard(board);
        return result;
    }

    @PutMapping("/rest/board")
    public int updateBoard(@RequestBody Board board){
        int result = boardService.updateBoard(board);
        return result;
    }

    @DeleteMapping("/rest/board/{boardid}")
    public int deleteBoard(@PathVariable String boardid){
        int result = boardService.deleteBoard(Integer.parseInt(boardid));
        return result;
    }




}
