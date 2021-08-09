import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/models/avatar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AvatarEyebrowsPicker extends StatelessWidget {
  const AvatarEyebrowsPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AvatarBloc, AvatarState>(
      builder: (context, state) {
        AvatarData avatarData = state.avatarData!;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: .028 * size.width,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 1; i <= 4; i++)
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: GestureDetector(
                      onTap: () => context.read<AvatarBloc>().add(
                            UpdateAvatarDataEvent(
                              avatarData.copyWith(eyebrows: i),
                            ),
                          ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: avatarData.eyebrows == i ? 1 : 0,
                            child: SvgPicture.asset(
                              'assets/svgs/horizontal_selection_light.svg',
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 8,
                            right: 8,
                            bottom: 0,
                            child: SvgPicture.asset(
                              'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_eyebrows_$i.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
