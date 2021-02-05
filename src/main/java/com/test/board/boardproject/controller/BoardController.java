package com.test.board.boardproject.controller;

import com.test.board.boardproject.domain.Board;
import com.test.board.boardproject.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/index")
public class BoardController {
    @Autowired
    BoardService boardService;

    @GetMapping("/boardForm")
    public ModelAndView getList(){
        ModelAndView mav = new ModelAndView("index");
        List<Board> boardList = boardService.selectAll();
        mav.addObject("boardList",boardList);

        return mav;
    }

    @GetMapping("/registForm")
    public ModelAndView getRegistForm(){
        ModelAndView mav = new ModelAndView("registForm");
        return mav;
    }

    @GetMapping("/detailForm")
    public ModelAndView selectById(@RequestParam String boardid){
        List<Board> detailList= boardService.selectById(Integer.parseInt(boardid));
        ModelAndView mav = new ModelAndView("detail");
        mav.addObject("detailList",detailList);
        return mav;
    }

}

