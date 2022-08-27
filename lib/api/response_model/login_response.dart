import 'package:grocery_app/model/user.dart';

import '../../model/address.dart';
import '../../model/city.dart';

class UserData {
  late int id;
  late String name;
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
  late City city;
  late Store store;

  UserData();

  UserData.fromJson(Map<String, dynamic> json) {
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
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
    store = (json['store'] != null ? Store.fromJson(json['store']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['active'] = active;
    data['verified'] = verified;
    data['city_id'] = cityId;
    data['store_id'] = storeId;
    data['fcm_token'] = fcmToken;
    data['token'] = token;
    data['token_type'] = tokenType;
    data['refresh_token'] = refreshToken;
    data['city'] = city.toJson();
    data['store'] = store.toJson();
    return data;
  }

  User? toUser(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['active'] = active;
    data['verified'] = verified;
    data['city_id'] = cityId;
    data['store_id'] = storeId;
    data['fcm_token'] = fcmToken;
    data['token'] = token;
    data['token_type'] = tokenType;
    data['refresh_token'] = refreshToken;
    return User.fromJson(data);
  }
}

class Store {
  late int id;
  late String name;
  late String storeName;
  late String email;
  String? emailVerifiedAt;
  late String mobile;
  late String storeUuid;
  late String cityId;
  int? verificationCode;
  late String active;
  late String verified;
  String? firebaseKey;
  String? image;
  late String address;
  String? facebook;
  String? instagram;
  late String createdAt;
  late String updatedAt;

  Store();

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    storeName = json['store_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    storeUuid = json['store_uuid'];
    cityId = json['city_id'];
    verificationCode = json['verification_code'];
    active = json['active'];
    verified = json['verified'];
    firebaseKey = json['firebase_key'];
    image = json['image'];
    address = json['address'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['store_name'] = storeName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['mobile'] = mobile;
    data['store_uuid'] = storeUuid;
    data['city_id'] = cityId;
    data['verification_code'] = verificationCode;
    data['active'] = active;
    data['verified'] = verified;
    data['firebase_key'] = firebaseKey;
    data['image'] = image;
    data['address'] = address;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
