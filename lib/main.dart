import 'package:hero_profile/blocs/character_list/character_list_bloc.dart';
import 'package:hero_profile/blocs/delegate/app_bloc_delegate.dart';
import 'package:hero_profile/repository/characters/characters_repos.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/entertainments_list/entertainments_list.dart';
import 'screens/home/home_page.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(AvengerInformationApp());
}

class AvengerInformationApp extends StatelessWidget {
  static const String title = 'Hero Profile';

//  final _home = HomePage(title: title);
//  final _home = HomePage();
  final _home = EntertainmentsList();

//  final _home = SplashPage(
//    splashLoadingCallback: (context) {
//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//              builder: (context) => HomePage(title: title)));
//    },
//  );

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<CharacterListBloc>(
            builder: (context) =>
                CharacterListBloc(repository: CharactersRepos()),
            dispose: (context, bloc) => bloc.dispose(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            theme: ThemeData(
              accentColor: Color(0xFF58060A),
              primaryColor: Colors.red[900],
            ),
            home: _home));
  }
}
