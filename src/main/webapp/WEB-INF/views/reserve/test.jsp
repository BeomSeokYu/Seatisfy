<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>라운드 모서리 테이블</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        .table-rounded {
            border-radius: 10px;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">라운드 모서리 테이블</h1>
        <table class="table table-borderless table-striped table-hover table-rounded">
            <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">이름</th>
                    <th scope="col">나이</th>
                    <th scope="col">성별</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>김철수</td>
                    <td>28</td>
                    <td>남</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>박영희</td>
                    <td>25</td>
                    <td>여</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>이동민</td>
                    <td>32</td>
                    <td>남</td>
                </tr>
            </tbody>
        </table>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>


