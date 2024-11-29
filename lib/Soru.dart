class Soru {
  String _soruMetni;
  bool _soruYaniti;

  Soru(this._soruMetni, this._soruYaniti);

  bool get soruYaniti => _soruYaniti;

  set soruYaniti(bool value) {
    _soruYaniti = value;
  }

  String get soruMetni => _soruMetni;

  set soruMetni(String value) {
    _soruMetni = value;
  }
}
