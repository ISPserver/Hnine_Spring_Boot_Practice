package com.test.board.boardproject.mapper;

import com.test.board.boardproject.domain.Board;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardMapper {
    List<Board> selectAll();
    List<Board> selectById(int boardid);
    int insertBoard(Board board);
    int updateBoard(Board board);
    int deleteBoard(int boardid);

}
