import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/models/avatar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AvatarSkinPicker extends StatelessWidget {
  const AvatarSkinPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AvatarBloc, AvatarState>(
      builder: (context, state) {
        AvatarData avatarData = state.avatarData!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i <= 4; i++)
              GestureDetector(
                onTap: () => context.read<AvatarBloc>().add(
                      UpdateAvatarDataEvent(
                        avatarData.copyWith(skin: i),
                      ),
                    ),
                child: Container(
                  height: .09 * size.width,
                  // margin: EdgeInsets.symmetric(vertical: 0.011 * size.width),
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: avatarData.skin == i ? 1 : 0,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: SvgPicture.asset(
                            'assets/svgs/vertical_selection_light.svg',
                            height: .1614 * size.width,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.018 * size.width,
                          ),
                          child: SvgPicture.asset(
                            'assets/svgs/skin_color_$i.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
