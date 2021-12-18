import 'package:flutter/material.dart';

// ignore: camel_case_types
class iconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;
  iconCinsiyet({required this.cinsiyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: TextStyle(
              color: Colors.black54, fontSize: 24, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
