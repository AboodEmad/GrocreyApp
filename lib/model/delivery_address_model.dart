class DeliverAddressModel {
  String address, road, number;
  bool isSelected;

  DeliverAddressModel({
    required this.address,
    required this.road,
    required this.number,
    this.isSelected = false,
  });
}
