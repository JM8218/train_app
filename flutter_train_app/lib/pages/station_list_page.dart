import 'package:flutter/material.dart';
import '../constants/stations.dart';

class StationListPage extends StatelessWidget {
  final String title;
  const StationListPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFe0e0e0),
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                stationList[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context, stationList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
