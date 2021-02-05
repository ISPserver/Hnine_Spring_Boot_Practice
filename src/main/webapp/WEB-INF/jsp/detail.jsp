<%@ page import="com.test.board.boardproject.domain.Board" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    List<Board> boardList = (List)request.getAttribute("detailList");
    Board board = boardList.get(0);
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

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function edit(){
            var obj={}; // empty json create
            obj["boardid"] = $("#boardid").val();
            obj["title"] = $("#title").val();
            obj["writer"] = $("#writer").val();
            obj["content"] = $("#content").val();

            var jsonString = JSON.stringify(obj); //전송 위해 직렬화(쪼개기)

            $.ajax({
                url:"/rest/board",
                type:"PUT",
                data:jsonString,
                contentType: "application/json;charset=utf-8",
                success: function(responseData){
                    alert("수정 성공");
                    location.href="/index/boardForm"
                },
                error:function (xhr,status,error){
                    alert("수정 실패");
                }
            })

        }

        function del(){
            $.ajax({
                url:"/rest/board/<%=board.getBoardid()%>",
                type:"DELETE",
                contentType: "application/json;charset=utf-8",
                success: function(responseData){
                    //console.log(responseData);
                    alert("삭제 성공");
                    location.href="/index/boardForm"
                },
                error:function (xhr,status,error){
                    alert("삭제 실패");
                }
            })

        }



    </script>
</head>
<body>
    <div class="container">
        <form>
            <input type="hidden" id="boardid" name="boardid" value="<%=board.getBoardid()%>">
            <input type="text" id="title" name="title" value="<%=board.getTitle()%>">
            <input type="text" id="writer" name="writer" value="<%=board.getWriter()%>">
            <textarea id="content" name="content" style="height:200px"><%=board.getContent()%></textarea>
            <input name="bt_edit" type="button" value="수정하기" onclick="edit()">
            <input name="bt_del" type="button" value="삭제하기" onclick="del()">
            <input name="bt_list" type="button" value="목록으로" onclick="location.href='/index/boardForm'">
        </form>
    </div>

</body>
</html>