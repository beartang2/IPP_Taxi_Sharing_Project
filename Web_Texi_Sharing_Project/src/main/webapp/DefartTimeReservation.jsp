<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   
    request.setCharacterEncoding("UTF-8");  //request, 한글 깨짐 방지

   
    String departure = request.getParameter("departure"); // 출발지와 도착지를 파라미터 통해 받아옴
    String arrival = request.getParameter("arrival");

   
    int duration = 0;  // 소요 시간 초기화

    
    if ((departure.equals("배재대학교") && arrival.equals("대전역")) ||
        (departure.equals("대전역") && arrival.equals("배재대학교"))) {
        duration = 25;  // 배재대학교 -> 대전역, 대전역 -> 배재대학교 선택하게 되면 소요시간이 25분 정도 걸린다고 나타내기 
    } else if ((departure.equals("배재대학교") && arrival.equals("서대전역")) ||
               (departure.equals("서대전역") && arrival.equals("배재대학교"))) {
        duration = 18;  //위와 동일
    } else if ((departure.equals("배재대학교") && arrival.equals("대전복합터미널")) ||
               (departure.equals("대전복합터미널") && arrival.equals("배재대학교"))) {
        duration = 30;  //위와 동일
    }
   
    java.util.List<String> times = new java.util.ArrayList<>(); // 출발 시간을 저장할 리스트 생성, String으로 사용

  
    for (int hour = 0; hour < 24; hour++) {  // 0~24시
        for (int min = 0; min < 60; min += 30) {  // 0~60분
            String hourmin = String.format("%02d시 %02d분", hour, min); // 시간과 분을 나타내는 문자열 생성
            times.add(hourmin);  // 생성된 hourmin 문자열을 리스트에 넣기
        }
    }
    times.add("24시 00분"); //24시도 리스트에 넣기
%>

<html>
<head>
    <title>택시 시간표</title>
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;  
            background-color: white;  
            margin: 0;  
            padding: 20px;  
            display: flex;  
            justify-content: center; 
            align-items: flex-start;  
            height: 100vh;  
        }

       
        table {
            border-collapse: collapse;  
            width: 40%;  
            font-size: 12px;  
            box-shadow: 0 0 8px rgba(0,0,0,0.1); 
            border-radius: 8px;  
            overflow: hidden;  
        }

      
        th, td {
            padding: 8px 10px;  
            text-align: center;  
            border-bottom: 1px solid #ddd;  
        }

      
        th {
            background-color: #d3d3d3; 
            font-weight: bold;  
        }

       
        td {
            background-color: white;
        }

        
        .btn {
            background-color: #d3d3d3;  
            border: none;  
            padding: 5px 10px;  
            font-size: 12px; 
            cursor: pointer; 
            border-radius: 5px; 
            transition: background-color 0.3s ease;  
        }

     
        .btn:hover {
            background-color: #bbb;  
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>택시차종</th>
            <th>택시번호</th>
            <th>출발지</th>
            <th>도착지</th>
            <th>출발시간</th>
            <th>소요시간</th>
            <th></th>
        </tr>
        <%
            int x = 0; 
            for (String time : times) { // 리스트에 저장된 시간 중 48번만 30분 간격으로
                if (x >= 48) break;  // 48번 넘어가면 출력 안하고 빠져나오기
        %>
        <tr>
            
            <td>SUV</td>  <!-- DB 내용을 넣을지 말지 몰라서 일단 예시로 나뒀습니다 -->
            <td>000아 0000</td>  <!-- 위와 동일 -->
            <td><%= departure %></td>  <!-- 출발지, 파라미터에서 받아온 값 -->
            <td><%= arrival %></td>  <!-- 도착지, 파라미터에서 받아온 값 -->
            <td><%= time %></td>  <!-- 출발 시간 -->
            <td><%= duration %>분 소요</td>  <!-- 예상 소요 시간 -->
            <td><button class="btn">예약하기</button></td>  <!-- 예약 버튼 -->
        </tr>
        <%
                x++;  // 출력되는 행 개수 더하기
            }
        %>
    </table>
</body>
</html>
