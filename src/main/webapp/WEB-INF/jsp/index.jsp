<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.test.board.boardproject.domain.Board" %>
<%@ page import="com.test.board.boardproject.common.Pager" %>
<%
    List<Board> boardList = (List)request.getAttribute("boardList");
    Pager pager = new Pager();
    pager.init(request, boardList);
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
        .pageNum{
            font-size:15pt;
            color:blue;
            font-weight:bold;
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
    <%int num = pager.getNum(); %>
    <%int curPos = pager.getCurPos(); %>
    <%for(int i=1; i<=pager.getPageSize(); i++){%>
    <%if(num<1) break; %>
    <%if(pager.getNum()<1) break; %>
    <% Board board = boardList.get(curPos++); %>
    <tr>
        <td><%=num--%></td>
        <td><a href="/index/detailForm?boardid=<%=board.getBoardid()%>"><%=board.getTitle()%></a></td>
        <td><%=board.getWriter()%></td>
        <td><%=board.getContent()%></td>
        <td><%=board.getRegdate().substring(0,10)%></td>
        <td><%=board.getHit()%></td>
    </tr>
    <%}%>
    <tr>
        <td colspan="6" style="text-align:center">
            <%if(pager.getFirstPage()==1){%>
            <a href="javascript:alert('첫번째 페이지 입니다.')">◀</a>
            <%}else{%>
            <a href="/index/boardForm?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
            <%}%>
            <%for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){%>
            <%if(i>pager.getTotalPage()) break; %>
            <a <%if(pager.getCurrentPage()==i){ %>class="pageNum"<%}%>href="/index/boardForm?currentPage=<%=i%>">[<%=i%>]</a>
            <%}%>
            <%if(pager.getLastPage()>pager.getTotalPage()){%>
            <a href="javascript:alert('마지막 페이지 입니다.')">▶</a>
            <%}else{%>
            <a href="/index/boardForm?currentPage=<%=pager.getLastPage()+1%>">▶</a>
            <%}%>
        </td>
    </tr>
</table>
<form id="registForm">
    <input type="button" value="글등록" onclick="regist()">
</form>
</body>
</html>