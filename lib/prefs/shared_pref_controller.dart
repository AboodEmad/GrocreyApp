import 'package:grocery_app/model/address.dart';
import 'package:grocery_app/model/payment.dart';
import 'package:grocery_app/model/payment_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

enum PrefKeys {
  language,
  id,
  name,
  email,
  loggedIn,
  gender,
  token,
  mobile,
  active,
  verified,
  cityId,
  storeId,
  fcmToken,
  tokenType,
  refreshToken
}

enum AddressPrefKeys { name, info, id, contactNumber, cityId, cityName }

enum PaymentPrefKeys {
  cvv,
  holderName,
  id,
  cardNumber,
  expDate,
  type,
}

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void save({required User user}) {
    _sharedPreferences.setBool(PrefKeys.active.name, user.active);
    _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    _sharedPreferences.setString(PrefKeys.name.name, user.name);
    _sharedPreferences.setString(PrefKeys.email.name, user.email ??= "");
    _sharedPreferences.setString(PrefKeys.fcmToken.name, user.fcmToken ??= "");
    _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
    _sharedPreferences.setString(PrefKeys.token.name, user.token);
    _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    _sharedPreferences.setBool(PrefKeys.verified.name, user.verified);
    _sharedPreferences.setString(PrefKeys.verified.name, user.cityId);
    _sharedPreferences.setString(PrefKeys.storeId.name, user.storeId);
    _sharedPreferences.setString(PrefKeys.tokenType.name, user.tokenType);
    _sharedPreferences.setString(PrefKeys.refreshToken.name, user.refreshToken);
  }

  void changeLanguage({required String langCode}) {
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  String get token => "${_sharedPreferences.get(PrefKeys.tokenType.name)} ${_sharedPreferences.get(PrefKeys.token.name)}";

  void saveDefaultAddress(Address address) {
    _sharedPreferences.setString(AddressPrefKeys.info.name, address.info);
    _sharedPreferences.setInt(AddressPrefKeys.id.name, address.id??0);
    _sharedPreferences.setString(AddressPrefKeys.name.name, address.name);
    _sharedPreferences.setString(
        AddressPrefKeys.contactNumber.name, address.contactNumber);
    _sharedPreferences.setInt(AddressPrefKeys.cityId.name, address.cityId);
  }

  void saveDefaultPayment(Payment payment) {
    _sharedPreferences.setInt(PaymentPrefKeys.id.name, payment.id!);
    _sharedPreferences.setString(PaymentPrefKeys.cvv.name, payment.cvv);
    _sharedPreferences.setString(
        PaymentPrefKeys.cardNumber.name, payment.cardNumber);
    _sharedPreferences.setString(
        PaymentPrefKeys.holderName.name, payment.holderName);
    _sharedPreferences.setString(PaymentPrefKeys.type.name, payment.type);
    _sharedPreferences.setString(PaymentPrefKeys.expDate.name, payment.expDate);
  }

  Address  getDefaultAddress(){
    return Address(
      id: getValueFor(AddressPrefKeys.id.name),
      name: getValueFor(AddressPrefKeys.name.name),
      info: getValueFor(AddressPrefKeys.info.name),
      contactNumber: getValueFor(AddressPrefKeys.contactNumber.name),
      cityId: getValueFor(AddressPrefKeys.cityId.name),
    );
  }

  Payment getDefaultPayment() {
    return Payment(
      holderName: getValueFor(PaymentPrefKeys.holderName.name),
      cardNumber: getValueFor(PaymentPrefKeys.cardNumber.name),
      expDate: getValueFor(PaymentPrefKeys.expDate.name),
      cvv: getValueFor(PaymentPrefKeys.cvv.name),
      type: getValueFor(PaymentPrefKeys.type.name),
      id: getValueFor<int>(PaymentPrefKeys.id.name)
    );
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }

// String get language =>
//     _sharedPreferences.getString(PrefKeys.language.name) ?? 'en';
//
// bool get loggedIn =>
//     _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;
}
