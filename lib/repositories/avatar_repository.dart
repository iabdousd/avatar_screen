import 'package:avatar_screen/constants/api_config.dart';
import 'package:avatar_screen/models/avatar_data.dart';
import 'package:avatar_screen/models/user_info.dart';

import '../services/fetch_inspector.dart';

class AvatarRepository {
  static Future<AvatarData> getAvatarData() async {
    final res = await FetchInspector.get(kGetAvatarEndPoint);

    return AvatarData.fromJson(res.body);
  }

  static Future<UserInfo> getUserInfo() async {
    final res = await FetchInspector.get(kGetUserInfoEndPoint);

    return UserInfo.fromJson(res.body);
  }

  static Future<bool> putAvatarData(AvatarData avatarData) async {
    final res = await FetchInspector.put(
      kPutAvatarEndPoint,
      avatarData.toJson(),
    );
    return res.statusCode < 300;
  }

  static Future<bool> putUserInfo(UserInfo userInfo) async {
    final res = await FetchInspector.put(
      kPutNameEndPoint,
      userInfo.toJson(),
    );

    return res.statusCode < 300;
  }
}
