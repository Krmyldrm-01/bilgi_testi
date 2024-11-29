import 'Soru.dart';

class SoruBankasi {
  int _index = 0;
  List<Soru> _sorular = [
    Soru("1.Titanic gelmiş geçmiş en büyük gemidir", false),
    Soru("2.Dünyadaki tavuk sayısı insan sayısından fazladır", true),
    Soru("3.Kelebeklerin ömrü bir gündür", false),
    Soru("4.Dünya düzdür", false),
    Soru("5.Kaju fıstığı aslında bir meyvenin sapıdır", true),
    Soru("6.Fatih Sultan Mehmet hiç patates yememiştir", true),
  ];

  String getSorumetni() {
    return _sorular[_index].soruMetni;
  }

  bool getSoruyaniti() {
    return _sorular[_index].soruYaniti;
  }

  List<Soru> get sorular => _sorular;

  set sorular(List<Soru> value) {
    _sorular = value;
  }

  void sonrakiSoru() {
    if (_index >= sorular.length - 1) {
      _index = 0;
    } else {
      print("bana gelmiyor");
      _index++;
    }
  }

  bool testBittiMi() {
    if (_index >= sorular.length - 1) {
      return true;
    } else
      return false;
  }

  void indexSifirla() {
    _index = 0;
  }
}
