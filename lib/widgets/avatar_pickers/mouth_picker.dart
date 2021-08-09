import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/models/avatar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AvatarMouthPicker extends StatelessWidget {
  const AvatarMouthPicker({Key? key}) : super(key: key);

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
                    height: 40,
                    child: GestureDetector(
                      onTap: () => context.read<AvatarBloc>().add(
                            UpdateAvatarDataEvent(
                              avatarData.copyWith(mouth: i),
                            ),
                          ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: avatarData.mouth == i ? 1 : 0,
                            child: SvgPicture.asset(
                              'assets/svgs/horizontal_selection_light.svg',
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_mouth_$i.svg',
                                width: .09 * size.width,
                              ),
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
