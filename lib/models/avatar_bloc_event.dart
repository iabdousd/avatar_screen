import 'package:avatar_screen/models/avatar_data.dart';

abstract class AvatarBlocEvent {}

class GetAvatarDataEvent extends AvatarBlocEvent {
  final String name;

  GetAvatarDataEvent(this.name);
}

class PutAvatarDataEvent extends AvatarBlocEvent {}

class UpdateDoneEvent extends AvatarBlocEvent {
  final bool done;

  UpdateDoneEvent(this.done);
}

class UpdateAvatarDataEvent extends AvatarBlocEvent {
  final AvatarData avatarData;

  UpdateAvatarDataEvent(this.avatarData);
}

class UpdateNameEvent extends AvatarBlocEvent {
  final String name;

  UpdateNameEvent(this.name);
}
