package com.dao;

public class FareCalc
{
	// 2025년도 기준 택시 요금 기준 변수들
    private static final int BASE_FARE = 4300;				// 기본 요금
    private static final double BASE_DISTANCE_KM = 1.8;		// 기본 요금 적용 거리	
    private static final double DISTANCE_PER_UNIT_M = 132.0;// 추가 거리 단위
    private static final int DISTANCE_UNIT_FARE = 100;		// 추가 거리 당 적용 금액
    private static final double NIGHT_SURCHARGE_RATE = 0.2;	// 심야 할증 비율 20%

    // 전체 택시 요금 계산 함수
    public static int calcTotalFare(double distanceKm, boolean isNightTime)
    {
        int fare = BASE_FARE;

        // 기본 거리보다 현재 거리가 더 크면
        if (distanceKm > BASE_DISTANCE_KM)
        {
        	// (현재 거리 - 기본 거리) * 1000 = 추가 거리
            double extraDistanceM = (distanceKm - BASE_DISTANCE_KM) * 1000;
            // ceil은 소수점이 있으면 다음 정수로 올림, (추가 거리 / 추가 거리 단위) = 추가된 거리 단위 개수
            int units = (int) Math.ceil(extraDistanceM / DISTANCE_PER_UNIT_M);
            // 요금에 (추가된 거리 단위 개수 * 추가 거리 당 요금)을 누적
            fare += units * DISTANCE_UNIT_FARE;
        }

        // 야간 시간대라면
        if (isNightTime)
        {	// 요금에 심야 할증을 적용
            fare += (int) (fare * NIGHT_SURCHARGE_RATE);
        }

        return fare;
    }

    // 인원 수만큼 나누어 1인 금액 계산 함수
    public static int calcPerPersonFare(double distanceKm, int peopleCount, boolean isNightTime)
    {
        int totalFare = calcTotalFare(distanceKm, isNightTime);
        
        // 전체 금액 / 인원 수
        return (int) Math.ceil((double) totalFare / peopleCount);
    }

    // 심야 시간 체크 함수
    public static boolean isNightTime(int hour)
    {
        return hour >= 23 || hour < 4;
    }

    // 예시 출력
    public static void main(String[] args)
    {
        double distanceKm = 2.0;
        int people = 4;
        int hour = 12;

        boolean isNight = isNightTime(hour);
        int total = calcTotalFare(distanceKm, isNight);
        int perPerson = calcPerPersonFare(distanceKm, people, isNight);

        System.out.println("이동 거리: " + distanceKm + "Km");
        System.out.println("인원 수: " + people + "명");
        System.out.println("출발 시각: " + hour + "시");
        System.out.println("총 요금: " + total + "원");
        System.out.println("1인당 요금: " + perPerson + "원");
    }
}

