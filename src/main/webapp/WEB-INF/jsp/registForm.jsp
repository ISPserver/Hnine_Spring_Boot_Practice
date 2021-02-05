<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        function regist(){
            var obj={}; // empty json create
            obj["title"] = $("#title").val();
            obj["writer"] = $("#writer").val();
            obj["content"] = $("#content").val();

            var jsonString = JSON.stringify(obj); //전송 위해 직렬화(쪼개기)

            $.ajax({
                url:"/rest/board",
                type:"POST",
                data:jsonString,
                contentType: "application/json;charset=utf-8",
                success: function(responseData){
                    //console.log(responseData);
                    alert("등록 성공")
                    location.href="/index/boardForm"
                },
                error:function (xhr,status,error){
                    alert("등록 실패");
                }
            })

        }

    </script>
</head>
<body>
    <div class="container">
        <form>
            <input type="text" id="title" name="title" placeholder="Your name..">
            <input type="text" id="writer" name="writer" placeholder="Your last name..">
            <textarea id="content" name="content" placeholder="Write something.." style="height:200px"></textarea>
            <input name="bt_regist" type="button" value="등록하기" onclick="regist()">
            <input name="bt_list" type="button" value="목록으로" onclick="location.href='/index/boardForm'">
        </form>
    </div>

</body>
</html>