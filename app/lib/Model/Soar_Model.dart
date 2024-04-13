class SoarModel {
  final String name;
  final String enName;
  final String revelationName;
  final List<Ayahs> ayahs;

  SoarModel({
    required this.name,
    required this.enName,
    required this.ayahs,
    required this.revelationName,
  });

  factory SoarModel.fromJson(dynamic json) {
    List<dynamic> ayahList = json['ayahs'];
    List<Ayahs> ayahs = ayahList.map((ayah) => Ayahs.fromJson(ayah)).toList();

    return SoarModel(
      ayahs: ayahs,
      name: json['name'],
      enName: json['englishName'],
      revelationName: json['revelationType'],
    );
  }
}

class Ayahs {
  final String text;
  final int number;
  final String Audio;
  Ayahs({required this.Audio, required this.text, required this.number});

  factory Ayahs.fromJson(dynamic json) {
    return Ayahs(
        Audio: json['audio'],
      number: json['number'],
      text: json['text'],

    );
  }
}
