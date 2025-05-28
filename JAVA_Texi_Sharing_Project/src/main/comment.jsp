db 셋팅하기
db이름 taxi_sharing
id/pw : root, 1234
CREATE TABLE user (
    uniqueId INT AUTO_INCREMENT PRIMARY KEY,  -- 자동 증가하는 고유 번호임
    userId VARCHAR(10) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(10) NOT NULL,
    sex VARCHAR(5) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    birth VARCHAR(10) NOT NULL
);
INSERT INTO user (userId, password, name, sex, phone, birth, age)
VALUES ('qwer12', 'qqwweerr', '신짱구', '남', '010-1111-2222', '2020-01-01', 6);
INSERT INTO user (userId, password, name, sex, phone, birth, age)
VALUES ('asdf1234', 'ooppoopp', '신짱아', '여', '010-1331-9988', '2022-05-01', 4);

CREATE TABLE reservation (
	resId INT PRIMARY KEY AUTO_INCREMENT,
	departure VARCHAR(10),
	destination VARCHAR(10),
	hour INT,
	carType VARCHAR(10),
	currentPeople INT,
	maxPeople INT,
	currentLuggage INT,
	maxLuggage INT,
	fare INT
);

INSERT INTO reservation (departure, destination, hour, carType, currentPeople, maxPeople, currentLuggage, maxLuggage, fare) VALUES ('배재대', '서대전역', 10, 'suv', 2, 6, 0, 4, 6400);

+확인하기는
select * from user;
select * from reservation;
desc user;
desc reservation;

틀만 만들어진 거지 수업 때 배운 내용 추가는 미흡해서 손 볼 게 많습니다.

해야되는 거
-fare고정 문제
-Car클래스 추상클래스 상속, StringTokenizer 등 넣고 싶은 거 활용