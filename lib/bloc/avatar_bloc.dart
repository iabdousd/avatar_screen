import 'dart:typed_data';

import 'package:avatar_screen/models/user_info.dart';
import 'package:bloc/bloc.dart';

import 'package:avatar_screen/models/avatar_bloc_state.dart';
import 'package:avatar_screen/models/avatar_bloc_event.dart';
import 'package:avatar_screen/repositories/avatar_repository.dart';

export 'package:avatar_screen/models/avatar_bloc_state.dart';
export 'package:avatar_screen/models/avatar_bloc_event.dart';

class AvatarBloc extends Bloc<AvatarBlocEvent, AvatarState> {
  AvatarBloc()
      : super(
          AvatarState(
            name: '',
            avatarData: null,
          ),
        );

  @override
  Stream<AvatarState> mapEventToState(AvatarBlocEvent event) async* {
    if (event is GetAvatarDataEvent) {
      emit(state.copyWith(
        loading: true,
        name: event.name,
      ));
      final avatarData = await AvatarRepository.getAvatarData();
      final userInfo = await AvatarRepository.getUserInfo();
      emit(state.copyWith(
        loading: false,
        name: userInfo.name,
        noAvatar: !userInfo.hasAvatar,
        avatarData: avatarData,
      ));
    } else if (event is UpdateNameEvent) {
      emit(state.copyWith(
        name: event.name,
      ));
    } else if (event is UpdateAvatarDataEvent) {
      emit(state.copyWith(
        avatarData: event.avatarData,
      ));
    } else if (event is PutAvatarDataEvent) {
      if (state.avatarData != null) {
        emit(state.copyWith(loading: true));
        final success =
            (await AvatarRepository.putAvatarData(state.avatarData!)) &&
                (await AvatarRepository.putUserInfo(
                  UserInfo(
                    name: state.name,
                    hasAvatar: true,
                  ),
                ));
        emit(state.copyWith(
          loading: false,
          done: success,
          hasError: !success,
          errorText: success ? '' : 'Couldn\'t update your avatar',
        ));
      } else {
        emit(state.copyWith(
          hasError: true,
          errorText: 'Invalid avatar data',
        ));
      }
    } else if (event is UpdateDoneEvent) {
      emit(state.copyWith(
        done: event.done,
      ));
    }
  }
}
