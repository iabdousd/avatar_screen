import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/constants/theme.dart';
import 'package:avatar_screen/models/avatar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AvatarPreview extends StatelessWidget {
  final Size? customSize;
  final bool transparent;
  final EdgeInsets? margin;
  const AvatarPreview({
    Key? key,
    this.transparent: false,
    this.customSize,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = customSize ?? MediaQuery.of(context).size;
    return BlocBuilder<AvatarBloc, AvatarState>(
      builder: (context, state) {
        AvatarData avatarData = state.avatarData!;
        return Container(
          width: .315 * size.width,
          height: .315 * size.width,
          padding: EdgeInsets.only(
            right: 0.033 * size.width,
            left: 0.033 * size.width,
            bottom: 0.033 * size.width,
          ),
          margin: margin ?? EdgeInsets.all(.015 * size.width),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: transparent ? Colors.transparent : kDarkBlueColor,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0.033 * size.width,
                left: avatarData.gender == AvatarGender.male
                    ? 0.01 * size.width
                    : 0,
                right: avatarData.gender == AvatarGender.male
                    ? 0.01 * size.width
                    : 0,
                bottom: avatarData.gender == AvatarGender.male
                    ? 0.01 * size.width
                    : 0,
                child: Image.asset(
                  'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_skin_${avatarData.skin}.png',
                ),
              ),
              Positioned(
                top:
                    customSize != null ? 0.09 * size.width : 0.111 * size.width,
                left: avatarData.gender == AvatarGender.female
                    ? 0.05 * size.width
                    : 0.065 * size.width,
                right: avatarData.gender == AvatarGender.female
                    ? 0.05 * size.width
                    : 0.065 * size.width,
                child: SvgPicture.asset(
                  'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_eyes_${avatarData.eyes}.svg',
                ),
              ),
              Positioned(
                top: customSize != null ? 0.085 * size.width : 0.1 * size.width,
                left: avatarData.gender == AvatarGender.female
                    ? 0.05 * size.width
                    : 0.06 * size.width,
                right: avatarData.gender == AvatarGender.female
                    ? 0.05 * size.width
                    : 0.06 * size.width,
                child: SvgPicture.asset(
                  'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_eyebrows_${avatarData.eyebrows}.svg',
                ),
              ),
              Positioned(
                top: avatarData.gender == AvatarGender.female
                    ? 0.156 * size.width
                    : 0.146 * size.width,
                left: 0.05 * size.width,
                right: 0.05 * size.width,
                child: SvgPicture.asset(
                  'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_nose_${avatarData.nose}_skin_${avatarData.skin}.svg',
                  width: .0388 * size.width,
                ),
              ),
              Positioned(
                top: avatarData.gender == AvatarGender.female
                    ? 0.188 * size.width
                    : 0.178 * size.width,
                left: 0.05 * size.width,
                right: 0.05 * size.width,
                child: SvgPicture.asset(
                  'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_mouth_${avatarData.mouth}.svg',
                  width: .065 * size.width,
                ),
              ),
              Positioned(
                top: avatarData.gender == AvatarGender.female
                    ? avatarData.hair == 4
                        ? 0.02 * size.width
                        : 0.01 * size.width
                    : avatarData.hair == 6
                        ? 0.02 * size.width
                        : -0.05 * size.width,
                bottom: avatarData.gender == AvatarGender.female
                    ? 0
                    : avatarData.hair == 6
                        ? 0.02 * size.width
                        : avatarData.hair == 3 ||
                                avatarData.hair == 4 ||
                                avatarData.hair == 5
                            ? 0.08 * size.width
                            : customSize != null
                                ? 0.09 * size.width
                                : null,
                left: avatarData.gender == AvatarGender.female
                    ? 0
                    : avatarData.hair == 6
                        ? 0.01 * size.width
                        : 0.05 * size.width,
                right: avatarData.gender == AvatarGender.female
                    ? 0
                    : avatarData.hair == 6
                        ? 0.01 * size.width
                        : 0.059 * size.width,
                child: SvgPicture.asset(
                  'assets/svgs/${avatarData.genderAsString}/${avatarData.genderAsString}_hair_${avatarData.hair}.svg',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
