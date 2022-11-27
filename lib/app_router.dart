import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton_users_bloc_api/business_logic/cubit/user_cubit.dart';
import 'package:moton_users_bloc_api/data/repo/user_repo.dart';
import 'package:moton_users_bloc_api/data/web_services/user_services.dart';
import 'package:moton_users_bloc_api/presintation/screens/homePage.dart';

class AppRouter {
  late UserRepo userRepoRepo;
  late CharacterCubit userCubitCubit;

  AppRouter() {
    userRepoRepo = UserRepo(UserWebServices());
    userCubitCubit = CharacterCubit(userRepoRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => userCubitCubit,
            child: MyHomePage(),
          ),
        );
    }
  }
}
