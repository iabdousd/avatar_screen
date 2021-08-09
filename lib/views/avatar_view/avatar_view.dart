import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'avatar_view_body.dart';
import 'avatar_view_header.dart';

class AvatarView extends StatefulWidget {
  AvatarView({Key? key}) : super(key: key);

  @override
  _AvatarViewState createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AvatarBloc, AvatarState>(
        buildWhen: (previous, next) {
          return previous.loading && !next.loading ||
              !previous.loading && next.loading;
        },
        listener: (context, state) {
          if (state.done) {
            context.read<AvatarBloc>().add(
                  UpdateDoneEvent(false),
                );
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (state.avatarData != null)
                  Positioned(
                    top: .185 * size.width,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AvatarViewBody(),
                  ),
                if (state.avatarData != null) AvatarViewHeader(),
                BlocBuilder<AvatarBloc, AvatarState>(
                  builder: (context, state) {
                    if (state.loading)
                      return Container(
                        color: kDarkBlueColor.withOpacity(.5),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    return Container();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
