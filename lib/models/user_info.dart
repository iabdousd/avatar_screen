import 'dart:convert';

class UserInfo {
  final String name;
  final bool hasAvatar;
  UserInfo({
    required this.name,
    required this.hasAvatar,
  });

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] ?? '',
      hasAvatar: map['avatar']['skin'] != null,
    );
  }

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
