<%@ page contentType="text/html;charset=UTF-8" language="java" %> 

<html>
<head>
    <title>출발지/도착지 선택</title> 

    <style>   
        .container {  
            display: flex;              
            gap: 50px;                 
            margin-top: 50px;          
            justify-content: center;    
        }
        .box {
            background-color: #ddd;    
            border-radius: 20px;        
            padding: 20px;             
            width: 200px;              
        }
        .title {
            background-color: black;    
            color: white;              
            padding: 10px;              
            border-radius: 20px;      
            text-align: center;        
            margin-bottom: 10px;        
        }
        select {
            width: 100%;               
            padding: 8px;              
            font-size: 16px;           
        }
        .submit-box {
            text-align: center;      
            margin-top: 30px;        
        }
    </style>
</head>

<body>
    <!-- form 태그, GET 방식으로 출발직, 목적지 정보를 가지고 nextPage.jsp에 데이터 전송 -->
    <form action="DefartTimeReservation.jsp" method="GET"> 
       
        <div class="container">

            <!-- 출발지 선택 -->
            <div class="box">
                <div class="title">출발지 선택</div> 
                <select id="departure" name="departure" onchange="updateArrival()" required>
                    <!-- onchange 이벤트 발생 시 updateArrival 함수 호출 , onclick보다 동적으로 실시간 반응으로 효율적으로 처리 가능해서 onchange로 선택함-->
                    <option value=""> 선택 </option> 
                    <option value="배재대학교">배재대학교</option>
                    <option value="대전역">대전역</option>
                    <option value="서대전역">서대전역</option>
                    <option value="대전복합터미널">대전복합터미널</option>
                </select>
            </div>

            <!-- 도착지 선택 -->
            <div class="box">
                <div class="title">도착지 선택</div> 
                <select id="arrival" name="arrival" required>
                    <!-- 초기값으로 선택 옵션 하나만 있음 -->
                    <option value=""> 선택 </option> 
                </select>
            </div>
        </div>

        <!-- DefartTimeReservation.jsp로 보낼 버튼 -->
        <div class="submit-box">
            <button type="submit">검색</button>
        </div>
    </form>

    <!-- javascript 영역 -->
    <script>
        
        const Locations = ["배재대학교", "대전역", "서대전역", "대전복합터미널"]; // 전체 장소 목록 배열
      
        function updateArrival() {   // 출발지 선택 변경 시 호출되는 함수
            const departure = document.getElementById("departure").value;  // 출발지 select에서 선택했던 값 가져옴           
            const arrival = document.getElementById("arrival"); // 도착지 select 내용을 가져옴
            
            arrival.options.length = 0; // 도착지 옵션 전체 제거 (초기화)     
            arrival.options[0] = new Option("선택", "");  // 기본 옵션 '선택' 추가 
        
            if (departure === "배재대학교") {  // 출발지가 배재대학교이면             
                const remainArrival = Locations.filter(loc => loc !== "배재대학교"); // 도착지는 배재대학교를 제외한 나머지 장소들
                remainArrival.forEach((loc, x) => { // 각 장소를 도착지 옵션으로 추가
                    arrival.options[x + 1] = new Option(loc, loc);
                });
            } 
            else if (departure === "대전역" || departure === "서대전역" || departure === "대전복합터미널") { // 출발지가 대전역, 서대전역, 대전복합터미널 중 하나일 경우
                arrival.options[1] = new Option("배재대학교", "배재대학교"); // 도착지는 무조건 배재대학교 하나만 나오게끔
            }       
        }
    </script>
</body>
</html>
