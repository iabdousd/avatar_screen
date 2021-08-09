import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<AvatarBloc>().add(GetAvatarDataEvent(
            'User name', // TODO: Replace with actual user's name
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Go to avatar screen'),
          onPressed: () {
            Navigator.of(context).pushNamed('/avatar');
          },
        ),
      ),
    );
  }
}
