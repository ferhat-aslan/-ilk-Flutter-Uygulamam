import 'package:beklenti/user_data.dart';

import 'user_data.dart';
import 'package:flutter/material.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 90 + _userData.sporgunu - _userData.icilensigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);

    // ignore: unnecessary_statements
    _userData.secilicinsiyet == "KADIN" ? sonuc = sonuc + 3 : sonuc;

    return sonuc;
  }
}
