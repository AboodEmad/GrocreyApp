import 'package:grocery_app/api/api_setting.dart';

class User {
  late int id;
  late String name;
  late String password;
  String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late String cityId;
  late String storeId;
  String? fcmToken;
  late String token;
  late String tokenType;
  late String refreshToken;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
  }

  User.register({
    required this.name,
    required this.password,
    required this.mobile,
    required this.gender,
    required this.cityId,
  });

  User.update({
    required this.name,
    required this.gender,
    required this.cityId,
    this.password = "",
    this.mobile = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['city_id'] = cityId;
    data['STORE_API_KEY'] = ApiSettings.apiKey;
    return data;
  }

  Map<String, dynamic> toUpdateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    data['city_id'] = cityId;
    return data;
  }
}
