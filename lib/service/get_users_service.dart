import 'package:bloc_second/models/users_model.dart';
import 'package:dio/dio.dart';

class UsersService {
  Future<dynamic> getUsers() async {
    try {
      Response response = await Dio(BaseOptions(validateStatus: (statusCode) {
        if (statusCode! >= 199 && statusCode <= 599) {
          return true;
        } else {
          return false;
        }
      })).get("https://jsonplaceholder.typicode.com/users");
      // print(response.data);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UsersModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
