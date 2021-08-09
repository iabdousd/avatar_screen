import 'package:avatar_screen/constants/theme.dart';
import 'package:flutter/material.dart';

ThemeData mainTheme(BuildContext context) => Theme.of(context).copyWith(
      primaryColor: kMainAquaColor,
      primaryColorLight: kSecondaryAquaColor,
      accentColor: kLightBlueColor,
      scaffoldBackgroundColor: kDarkBlueColor,
      backgroundColor: kDarkBlueColor,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Electrolize',
            bodyColor: kMainAquaColor,
            displayColor: kMainAquaColor,
          ),
      iconTheme: Theme.of(context).iconTheme.copyWith(
            color: kMainAquaColor,
          ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: kMainAquaColor,
            primaryVariant: kSecondaryAquaColor,
            secondary: kLightBlueColor,
            secondaryVariant: kComplementaryBlueColor,
            background: kDarkBlueColor,
          ),
    );
