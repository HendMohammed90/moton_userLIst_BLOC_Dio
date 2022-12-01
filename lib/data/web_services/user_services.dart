import 'package:dio/dio.dart';
import 'package:moton_users_bloc_api/data/models/user_model.dart';
import 'package:moton_users_bloc_api/utalites/constants.dart';

class UserWebServices {
  Dio dio = Dio();
  UserWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.Kapi,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  //Get All Characters
  Future<dynamic> fetchAllUsers() async {
    try {
      Response response = await dio.get(Constants.KallUsers);
      // print(response.data.toString());
      // print(response.data);
      return response.data as UserModel;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
