package main;

import java.util.Scanner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.dao.UserDAO;
import com.dto.User;

public class main_test {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        UserDAO userDAO = new UserDAO();
        boolean running = true;

        while (running) {	//계속 도는 걸로
            System.out.println("=== 택시 쉐어링 시스템 ===");
            System.out.println("1. 회원가입");
            System.out.println("2. 로그인");
            System.out.println("3. 종료");
            System.out.print("메뉴 선택: ");
            String choice = sc.nextLine();

            switch (choice) {
                case "1":
                    // 회원가입
                    System.out.println("[회원가입]");
                    System.out.print("아이디를 입력하세요: ");
                    String userId = sc.nextLine();
                    System.out.print("비밀번호를 입력하세요: ");
                    String password = sc.nextLine();
                    System.out.print("이름을 입력하세요: ");
                    String name = sc.nextLine();
                    System.out.print("성별을 입력하세요 (남/여): ");
                    String sex = sc.nextLine();
                    System.out.print("전화번호를 입력하세요 (010-XXXX-XXXX): ");
                    String phone = sc.nextLine();
                    System.out.print("생년월일을 입력하세요 (YYYY-MM-DD): ");
                    String birth = sc.nextLine();
                    System.out.print("나이를 입력하세요: ");
                    Integer age = null;
                    try {
                        age = Integer.parseInt(sc.nextLine());	//배운 거. 문자열을을 숫자 타입으로 바꾸기
                    } catch (NumberFormatException e) {
                        System.out.println("숫자를 입력해주세요.");
                        break;
                    }

                    User newUser = new User(userId, password, name, sex, phone, birth, age);
                    boolean result = userDAO.insertUser(newUser);
                    if (result) {
                        System.out.println("✅ 회원가입이 완료되었습니다.");
                        postSignUpMenu(sc, userDAO);
                    } else {
                        System.out.println("❌ 회원가입 실패.");
                    }
                    break;

                case "2":	//바로 로그인
                    loginAndReserve(sc, userDAO);
                    break;

                case "3":	//종료하기
                    System.out.println("프로그램을 종료합니다.");
                    running = false;
                    break;

                default:
                    System.out.println("잘못된 입력입니다.");
            }

            System.out.println(); // 한 줄 공백
        }

        sc.close();
    }

    // 회원가입 후 로그인/예약/종료 메뉴
    private static void postSignUpMenu(Scanner sc, UserDAO userDAO) {
        while (true) {
            System.out.println("1. 로그인");
            System.out.println("2. 예약");
            System.out.println("3. 종료");
            System.out.print("선택: ");
            String next = sc.nextLine();

            switch (next) {
                case "1":
                    loginAndReserve(sc, userDAO);
                    return;
                case "2":	//사실상 바로 2번 x
                    System.out.println("※ 먼저 로그인해야 예약 가능합니다.");
                    break;
                case "3":
                    System.out.println("프로그램을 종료합니다.");
                    System.exit(0);
                default:
                    System.out.println("잘못된 입력입니다.");
            }
        }
    }

    // 로그인 후 예약 기능 흐름
    private static void loginAndReserve(Scanner sc, UserDAO userDAO) {
        System.out.println("[로그인]");
        System.out.print("아이디: ");
        String id = sc.nextLine();
        System.out.print("비밀번호: ");
        String pw = sc.nextLine();

        User loginUser = userDAO.login(id, pw);
        if (loginUser != null) {
            System.out.println("✅ 로그인 성공! " + loginUser.getName() + "님 환영합니다.");
            System.out.println("▶ 예약 메뉴로 이동합니다...");
            //db 세팅해야 돌아감.
            System.out.print("출발지 입력: ");	//테스트할 때 '배재대' 입력 해야 됨
            String departure = sc.nextLine();
            System.out.print("목적지 입력: ");	//테스트할 때 '서대전역' 입력 해야 됨
            String destination = sc.nextLine();
            System.out.print("희망 시간 (ex: 10): ");	//테스트할 때 10 해야 됨
            int hour = Integer.parseInt(sc.nextLine());  // sc.nextInt() 다음에 nextLine() 호출 문제 방지

            String sql = "SELECT * FROM reservation WHERE departure = ? AND destination = ? AND hour >= ?";	//정한 시간 이후의 시간들 출력

            try (Connection conn = com.util.DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setString(1, departure);
                pstmt.setString(2, destination);
                pstmt.setInt(3, hour);

                ResultSet rs = pstmt.executeQuery();

                System.out.println("예약 가능한 목록:");
                boolean found = false;
                while (rs.next()) {
                    found = true;
                    System.out.println("예약번호: " + rs.getInt("resId") +
                                       ", 출발지: " + rs.getString("departure") +
                                       ", 도착지: " + rs.getString("destination") +
                                       ", 시간: " + rs.getInt("hour") +
                                       ", 차량 종류: " + rs.getString("carType") +
                                       ", 현재 인원: " + rs.getInt("currentPeople") +
                                       ", 최대 인원: " + rs.getInt("maxPeople") +
                                       ", 현재 짐: " + rs.getInt("currentLuggage") +
                                       ", 최대 짐: " + rs.getInt("maxLuggage"));
                }
                if (!found) {
                    System.out.println("조건에 맞는 예약이 없습니다.");
                    return;
                }

                // 예약 번호 선택
                System.out.print("예약 번호를 입력하세요: ");
                int selectedResId = Integer.parseInt(sc.nextLine());

                // 짐 유무 확인
                System.out.print("짐이 있습니까? (y/n): ");
                String luggageInput = sc.nextLine().trim().toLowerCase();

                // 선택한 예약 정보 조회
                String selectSql = "SELECT * FROM reservation WHERE resId = ?";
                try (PreparedStatement selectPstmt = conn.prepareStatement(selectSql)) {
                    selectPstmt.setInt(1, selectedResId);
                    ResultSet selectedRs = selectPstmt.executeQuery();

                    if (selectedRs.next()) {
                        int currentPeople = selectedRs.getInt("currentPeople");
                        int maxPeople = selectedRs.getInt("maxPeople");
                        int currentLuggage = selectedRs.getInt("currentLuggage");
                        int maxLuggage = selectedRs.getInt("maxLuggage");

                        // 인원 +1 체크
                        if (currentPeople + 1 > maxPeople) {
                            System.out.println("❌ 최대 인원 초과로 예약할 수 없습니다.");
                            return;
                        }

                        // 짐 유무에 따라 +1 체크
                        int addLuggage = 0;
                        if (luggageInput.equals("y")) {
                            addLuggage = 1;
                            if (currentLuggage + addLuggage > maxLuggage) {
                                System.out.println("❌ 최대 짐 개수 초과로 예약할 수 없습니다.");
                                return;
                            }
                        }

                        // 예약 정보 업데이트
                        String updateSql = "UPDATE reservation SET currentPeople = currentPeople + 1, currentLuggage = currentLuggage + ? WHERE resId = ?";
                        try (PreparedStatement updatePstmt = conn.prepareStatement(updateSql)) {
                            updatePstmt.setInt(1, addLuggage);
                            updatePstmt.setInt(2, selectedResId);
                            int updateCount = updatePstmt.executeUpdate();

                            if (updateCount > 0) {
                                System.out.println("✅ 예약이 완료되었습니다!");
                                System.out.println("예약 현황:");
                                System.out.println("예약번호: " + selectedResId);
                                System.out.println("인원: " + (currentPeople + 1) + " / " + maxPeople);
                                System.out.println("짐: " + (currentLuggage + addLuggage) + " / " + maxLuggage);
                                //여기에 거리에 따른 인원 대비 fareCalc 넣으면 될 듯. 
                                //FareCalc에서 배재대->서대전 4.5km이런 거 미리 넣어 놓은 다음에 계산된 값 바로 가져오는 형식으로.
                            } else {
                                System.out.println("❌ 예약 업데이트에 실패했습니다.");
                            }
                        }
                    } else {
                        System.out.println("해당 예약번호를 찾을 수 없습니다.");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("DB 조회 중 오류가 발생했습니다.");
            }
        } else {
            System.out.println("❌ 로그인 실패: 아이디 또는 비밀번호가 올바르지 않습니다.");
        }
    }
}
