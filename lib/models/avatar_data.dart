import 'dart:convert';

enum AvatarGender {
  female,
  male,
}

class AvatarData {
  final AvatarGender gender;
  final int skin;
  final int hair;
  final int eyebrows;
  final int eyes;
  final int nose;
  final int mouth;

  String get genderAsString => gender.toString().split('.').last;

  AvatarData({
    required this.gender,
    this.skin: 1,
    this.hair: 1,
    this.eyebrows: 1,
    this.eyes: 1,
    this.nose: 1,
    this.mouth: 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'gender': gender.toString().split('.').last,
      'skin': skin,
      'hair': hair,
      'eyebrows': eyebrows,
      'eyes': eyes,
      'nose': nose,
      'mouth': mouth,
    };
  }

  factory AvatarData.fromMap(Map<String, dynamic> map) {
    return AvatarData(
      gender: map['gender'] != null
          ? AvatarGender.values.firstWhere(
              (element) => element.toString().split('.').last == map['gender'],
            )
          : AvatarGender.female,
      skin: map['skin'] ?? 1,
      hair: map['hair'] ?? 1,
      eyebrows: map['eyebrows'] ?? 1,
      eyes: map['eyes'] ?? 1,
      nose: map['nose'] ?? 1,
      mouth: map['mouth'] ?? 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvatarData.fromJson(String source) =>
      AvatarData.fromMap(json.decode(source));

  AvatarData copyWith({
    AvatarGender? gender,
    int? skin,
    int? hair,
    int? eyebrows,
    int? eyes,
    int? nose,
    int? mouth,
  }) {
    return AvatarData(
      gender: gender ?? this.gender,
      skin: skin ?? this.skin,
      hair: hair ?? this.hair,
      eyebrows: eyebrows ?? this.eyebrows,
      eyes: eyes ?? this.eyes,
      nose: nose ?? this.nose,
      mouth: mouth ?? this.mouth,
    );
  }
}
