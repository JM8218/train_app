import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  const SeatPage({super.key, required this.departure, required this.arrival});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final Set<String> selectedSeats = {};

  void toggleSeat(String seatId) {
    setState(() {
      if (selectedSeats.contains(seatId)) {
        selectedSeats.remove(seatId);
      } else {
        selectedSeats.add(seatId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('좌석 선택', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // 출발역 -> 도착역 표시
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.departure,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
                const SizedBox(width: 5),
                const Icon(Icons.arrow_forward, color: Colors.purple),
                const SizedBox(width: 5),
                Text(widget.arrival,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
              ],
            ),
          ),
          // 좌석 상태 안내
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendBox(Colors.grey[300]!, '선택 안됨'),
              const SizedBox(width: 10),
              _legendBox(Colors.purple, '선택됨'),
            ],
          ),
          const SizedBox(height: 20),
          // 좌석 헤더
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 50, child: Center(child: Text('A'))),
                const SizedBox(width: 10),
                const SizedBox(width: 50, child: Center(child: Text('B'))),
                const SizedBox(width: 30), // 통로
                const SizedBox(width: 50, child: Center(child: Text('C'))),
                const SizedBox(width: 10),
                const SizedBox(width: 50, child: Center(child: Text('D'))),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // 좌석 선택 영역
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(15, (index) {
                  int seatNumber = index + 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // A열
                        seatBox(seatNumber, 'A'),
                        const SizedBox(width: 10),
                        // B열
                        seatBox(seatNumber, 'B'),
                        // 번호
                        SizedBox(
                          width: 30,
                          child: Center(
                            child: Text(
                              '$seatNumber',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // C열
                        seatBox(seatNumber, 'C'),
                        const SizedBox(width: 10),
                        // D열
                        seatBox(seatNumber, 'D'),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          // 예약 버튼
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (selectedSeats.isEmpty) {
                    // 선택 안했을 때 무반응
                  } else {
                    // 선택 했을 때
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text("예약"),
                        content: Text("선택된 좌석: ${selectedSeats.join(", ")}"),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text("취소"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            child: const Text("확인"),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('예약하기',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget seatBox(int number, String column) {
    String seatId = "$column$number";
    bool isSelected = selectedSeats.contains(seatId);
    return GestureDetector(
      onTap: () => toggleSeat(seatId),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _legendBox(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
