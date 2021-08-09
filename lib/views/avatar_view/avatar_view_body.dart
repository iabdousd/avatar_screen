import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/constants/theme.dart';
import 'package:avatar_screen/widgets/app_divider.dart';
import 'package:avatar_screen/widgets/avatar_pickers/eyebrows_picker.dart';
import 'package:avatar_screen/widgets/avatar_pickers/eyes_picker.dart';
import 'package:avatar_screen/widgets/avatar_pickers/hair_picker.dart';
import 'package:avatar_screen/widgets/avatar_pickers/mouth_picker.dart';
import 'package:avatar_screen/widgets/avatar_pickers/nose_picker.dart';
import 'package:avatar_screen/widgets/avatar_pickers/sex_picker.dart';
import 'package:avatar_screen/widgets/avatar_pickers/skin_picker.dart';
import 'package:avatar_screen/widgets/avatar_preview.dart';
import 'package:avatar_screen/widgets/primary_button.dart';

class AvatarViewBody extends StatelessWidget {
  const AvatarViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: kComplementaryBlueColor,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: .0275 * size.height + 0.03 * size.width,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Configura la apariencia de tu avatar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      AppDivider(
                        height: MediaQuery.of(context).size.width * 0.075,
                        angle: 2,
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AvatarPreview(),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            child: AvatarSexPicker(),
                          ),
                          Positioned(
                            right: 0,
                            child: AvatarSkinPicker(),
                          ),
                        ],
                      ),
                      AppDivider(),
                      AvatarHairPicker(),
                      AppDivider(),
                      AvatarEyebrowsPicker(),
                      AppDivider(),
                      AvatarEyesPicker(),
                      AppDivider(),
                      AvatarNosePicker(),
                      AppDivider(),
                      AvatarMouthPicker(),
                      AppDivider(
                        opacity: 1,
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                title: 'GUARDAR',
                onPressed: () {
                  context.read<AvatarBloc>().add(PutAvatarDataEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
