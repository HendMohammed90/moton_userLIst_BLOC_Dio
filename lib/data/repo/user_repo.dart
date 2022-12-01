import 'package:moton_users_bloc_api/data/web_services/user_services.dart';

import '../models/user_model.dart';

class UserRepo {
  final UserWebServices userWebServices;

  UserRepo(this.userWebServices);

  Future<dynamic> getAllUsers() async {
    try {
      final users = await userWebServices.fetchAllUsers();
      print(users);

      return users.map((user) => Data.fromJson(user)).toList();
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
