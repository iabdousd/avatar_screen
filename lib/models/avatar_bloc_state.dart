import 'package:avatar_screen/models/avatar_data.dart';

class AvatarState {
  final String name;
  final bool noAvatar;
  final AvatarData? avatarData;
  final bool loading, hasError, done;
  final String errorText;

  AvatarState({
    required this.name,
    required this.avatarData,
    this.noAvatar: true,
    this.loading: false,
    this.hasError: false,
    this.done: false,
    this.errorText: '',
  });

  AvatarState copyWith({
    String? name,
    AvatarData? avatarData,
    bool? noAvatar,
    bool? loading,
    bool? hasError,
    bool? done,
    String? errorText,
  }) {
    return AvatarState(
      name: name ?? this.name,
      avatarData: avatarData ?? this.avatarData,
      noAvatar: noAvatar ?? this.noAvatar,
      loading: loading ?? this.loading,
      hasError: hasError ?? this.hasError,
      done: done ?? this.done,
      errorText: errorText ?? this.errorText,
    );
  }
}
