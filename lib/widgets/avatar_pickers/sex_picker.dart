import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/models/avatar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AvatarSexPicker extends StatelessWidget {
  const AvatarSexPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AvatarBloc, AvatarState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 0.011
            // 0.02
            for (final gender in AvatarGender.values)
              GestureDetector(
                onTap: () => context.read<AvatarBloc>().add(
                      UpdateAvatarDataEvent(
                        state.avatarData!.copyWith(gender: gender),
                      ),
                    ),
                child: Container(
                  height: .1355 * size.width,
                  margin: EdgeInsets.symmetric(vertical: 0.011 * size.width),
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: state.avatarData!.gender == gender ? 1 : 0,
                        child: SvgPicture.asset(
                          'assets/svgs/vertical_selection_light.svg',
                          height: .1614 * size.width,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.02 * size.width,
                          ),
                          child: SvgPicture.asset(
                            'assets/svgs/${gender.toString().split('.').last}_symbol.svg',
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
