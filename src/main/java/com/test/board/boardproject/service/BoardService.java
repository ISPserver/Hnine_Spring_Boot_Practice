package com.test.board.boardproject.service;

import com.test.board.boardproject.domain.Board;
import com.test.board.boardproject.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    public BoardMapper boardMapper;

    public List<Board> selectAll() {
        return boardMapper.selectAll();
    }

    public List<Board> selectById(int boardid){
        return boardMapper.selectById(boardid);
    }

    public int insertBoard(Board board){
        return boardMapper.insertBoard(board);
    }

    public int updateBoard(Board board){
        return boardMapper.updateBoard(board);
    }

    public int deleteBoard(int boardid){
        return boardMapper.deleteBoard(boardid);
    }

}
