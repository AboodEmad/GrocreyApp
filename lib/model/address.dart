import 'city.dart';

class Address {
  int? id;
  late String name;
  late String info;
  late String contactNumber;
  double? lat;
  double? lang;
  late int cityId;
  City? city;
  bool isDefault = false;

  Address({
    this.id,
    required this.name,
    required this.info,
    required this.contactNumber,
    required this.cityId,
  });

  Address.empty();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    if (json.containsKey("city")) {
      city = City.fromJson(json["city"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['info'] = info;
    data['contact_number'] = contactNumber;
    data['city_id'] = cityId.toString();
    return data;
  }
}
