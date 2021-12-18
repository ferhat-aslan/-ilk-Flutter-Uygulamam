import 'package:beklenti/constants.dart';
import 'package:beklenti/results_page.dart';
import 'package:beklenti/user_data.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconCinsiyet.dart';
import 'Mycontainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String secilicinsiyet = 'vdd';
  double icilensigara = 0.0;
  double sporgunu = 3;
  int boy = 170;
  int kilo = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {},
                    child: outlinedbox("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {},
                    child: outlinedbox("KİLO"),
                  ),
                ),
                //
              ],
            ),
          ),
          //
          Expanded(
            child: MyContainer(
              onPress: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Gün Spor Yapıyorsunuz?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${sporgunu.round()}', //icilensigara.round().tostring()
                    style: kSayiStili,
                  ),
                  //slider
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: sporgunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporgunu = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              onPress: () {},
              child: Column(
                children: [
                  Text(
                    "Günde Kaç sigara içiyorsunuz?",
                    style: kMetinstili,
                  ),
                  Text(
                    ' ${icilensigara.round()}', //icilensigara.round().tostring()
                    style: kSayiStili,
                  ),
                  //slider
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilensigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilensigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilicinsiyet = 'KADIN';
                        print(secilicinsiyet);
                      });
                    },
                    renk: secilicinsiyet == 'KADIN'
                        ? Colors.lightBlue.shade100
                        : Colors.white,
                    child: iconCinsiyet(
                      cinsiyet: "KADIN",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilicinsiyet = 'ERKEK';
                        print(secilicinsiyet);
                      });
                    },
                    renk: secilicinsiyet == 'ERKEK'
                        ? Colors.lightBlue.shade100
                        : Colors.white,
                    child: iconCinsiyet(
                      cinsiyet: "ERKEK",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
          //
          TextButton(
            style: TextButton.styleFrom(
              elevation: 50.0,
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => resultPage(UserData(
                            kilo: kilo,
                            boy: boy,
                            icilensigara: icilensigara,
                            secilicinsiyet: secilicinsiyet,
                            sporgunu: sporgunu,
                          ))));
            },
            child: Text(
              'Hesapla',
              style: kMetinstili,
            ),
          )
        ],
      ),
    );
  }

  Row outlinedbox(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kMetinstili,
            )),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == "BOY" ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),

        ///+++---
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
                child: Text("+"),
              ),
            ),
            ButtonTheme(
                minWidth: 36,
                child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        label == "BOY" ? boy-- : kilo--;
                      });
                    },
                    child: Text("-")))
          ],
        )
      ],
    );
  }
}
