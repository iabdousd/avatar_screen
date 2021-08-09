import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/avatar_bloc.dart';
import 'configs/theme.dart';
import 'views/home.dart';
import 'views/avatar_view/avatar_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AvatarBloc(),
      child: MaterialApp(
        theme: mainTheme(context),
        routes: {
          '/': (_) => HomeView(),
          '/avatar': (_) => AvatarView(),
        },
      ),
    );
  }
}
