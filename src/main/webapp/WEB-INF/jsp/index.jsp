<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.test.board.boardproject.domain.Board" %>
<%
List<Board> boardList = (List)request.getAttribute("boardList");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Test Page</title>
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        * {box-sizing: border-box;}

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        input[type=button] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=button]:hover {
            background-color: #45a049;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a{
            text-decoration: none;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
       function regist(){
           $("#registForm").attr({
               action:"/index/registForm",
               method:"GET"
           });
           $("#registForm").submit();
       }
    </script>
</head>
<body>
    <table>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        <%for(int i=0; i<boardList.size(); i++){%>
        <% Board board = boardList.get(i); %>
        <tr>
            <td><%=board.getBoardid()%></td>
            <td><a href="/index/detailForm?boardid=<%=board.getBoardid()%>"><%=board.getTitle()%></a></td>
            <td><%=board.getWriter()%></td>
            <td><%=board.getContent()%></td>
            <td><%=board.getRegdate().substring(0,10)%></td>
            <td><%=board.getHit()%></td>
        </tr>
        <%}%>
    </table>
    <form id="registForm">
        <input type="button" value="글등록" onclick="regist()">
    </form>
</body>
</html>