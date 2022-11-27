import 'package:dio/dio.dart';
import 'package:moton_users_bloc_api/utalites/constants.dart';

class UserWebServices {
  Dio? dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.Kapi,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  //Get All Characters
  Future<List<dynamic>?> fetchAllUsers() async {
    try {
      Response response = await dio!.get(Constants.KallUsers);
      // print(response.data.toString());
      print(response.data);
      return response.data;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
