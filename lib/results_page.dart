import 'package:beklenti/constants.dart';
import 'package:beklenti/user_data.dart';
import 'package:flutter/material.dart';
import 'hesap.dart';

class resultPage extends StatelessWidget {
  final UserData _userData;
  resultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData)
                    .hesaplama()
                    .round()
                    .toString(), //string olduğu için hata vermedi
                style: kMetinstili,
              ))),
          Expanded(
              flex: 1,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "GERİ DÖN",
                    style: kMetinstili,
                  )))
        ],
      ),
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
    );
  }
}
