import 'package:bilgi_testi/SoruBankasi.dart';
import 'package:flutter/material.dart';

import 'Constans.dart'; //oluşturulan yeni class import edilmiştir

void main() {
  runApp(BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  bool secim = false;

  List<Widget> secimler = [];
  SoruBankasi soruBankasi = new SoruBankasi();

  void butonFonk(bool secim, bool dogruYanit) {
    if (soruBankasi.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: new Text("Tebrikler Oyunu Bitirdiniz"),
            content: new Text("Lütfen tuşa basınız"),
            actions: [
              new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    secimler = [];
                    soruBankasi.indexSifirla();
                  });
                },
                child: new Text("Başa Dön"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        if (secim == true) {
          if (dogruYanit == true) {
            secimler.add(kDogruIcon);
          } else {
            secimler.add(kYanlisIcon);
          }
        } else {
          setState(() {
            if (dogruYanit == false) {
              secimler.add(kDogruIcon);
            } else {
              secimler.add(kYanlisIcon);
            }
          });
        }
      });
      soruBankasi.sonrakiSoru();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //column içerisinde kilerin başa sona ve ortaya yaslanması için

      crossAxisAlignment: CrossAxisAlignment.stretch,
      //yatayda kolumn içerisindekilerin ekranı doldurması için
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruBankasi.getSorumetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //ekranda taşma işlemini engellemeke için kullanıladı
          //Wrap hem column gibi dikeyde hem de rowgibi  yatayda çalışabilmekte
          //direction: Axis.vertical, //column gibi çalışmasını sağladık
          children: secimler,
          spacing: 5, //yatayda boşluk verildi
          runSpacing: 5, //dikeyde boşluk verildi
          //alignment: WrapAlignment.end, //sağdan sola doğru öteleyerek sıralar
          //alignment: WrapAlignment.center, //ortan başlayarak öteleyerek ilerler
        ),
        Expanded(
          flex: 1, //ekranda ki kaplama alanı
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                      ), // foreground
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        print("İşaretlenen : yanlış");
                        secim = false;
                        bool dogruYanit = soruBankasi.getSoruyaniti();
                        butonFonk(secim, dogruYanit);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                      ), // foreground
                      child: Icon(
                        Icons.thumb_up,
                        size: 30.0,
                      ),
                      onPressed: () {
                        print("İşaretlenen : doğru");
                        secim = true;
                        bool dogruYanit = soruBankasi.getSoruyaniti();
                        butonFonk(secim, dogruYanit);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
