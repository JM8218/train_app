🚄 Flutter Train Reservation App
Flutter로 제작된 심플한 기차 좌석 예매 앱 입니다.
출발역 → 도착역 → 좌석 선택 → 예약 확인까지의 흐름을 구현했습니다.

주요 기능
- 출발역 선택
- 도착역 선택
- 좌석 선택 (AD 열 / 115번 줄, 총 60석)

프로젝트 구조
lib/

- constants/
  - station.dart : 역 목록 (수서~부산)

- pages/
- home_page.dart : 출발역/도착역 선택 페이지
- seat_page.dart : 좌석 선택 및 예약 페이지
- station_list_page.dart : 역 선택 리스트 페이지

- main.dart : 앱 실행 진입점

화면 흐름
1. 출발역 선택
2. 도착역 선택
3. 좌석 선택 (클릭으로 선택/해제 가능)
4. 예약하기 → 선택된 좌석 확인 팝업

사용 기술 스택
- Flutter
- Dart
- Material Design 3 (M3)
- State 관리: setState

향후 개선 아이디어
- 기차 시간표 연동
- 날짜 및 시간 선택
- 좌석 선점 상태 표시
- 예약 내역 저장 (Firebase, SQLite 등)
- 예약 취소 기능
- 반응형 UI 및 애니메이션 효과
- -Dark mode 적용

참고사항
이 프로젝트는 스파르타 캠프에서 Flutter 기초 과제 제출 용도로 제작된 앱입니다.
실제 서비스로 확장하기 위해서는 예약 서버, DB 연동 등이 필요합니다.
