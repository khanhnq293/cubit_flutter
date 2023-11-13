import 'package:flutter/material.dart';

class DoingDetail extends StatelessWidget {
  final String detailInfo;
  final int index;

  const DoingDetail({super.key, this.detailInfo = '', this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
              tag: index,
              child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: const Color(0xFF80CBC4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(detailInfo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 22))))),
    );
  }
}