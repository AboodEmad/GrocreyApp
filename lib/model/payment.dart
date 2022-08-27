class Payment {
  late String holderName;
  late String cardNumber;
  late String expDate;
  late String cvv;
  late String type;
  dynamic? userId;
  late String updatedAt;
  late String createdAt;
  int? id;

  Payment({
    required this.holderName,
    required this.cardNumber,
    required this.expDate,
    required this.cvv,
    required this.type,
    this.id,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
    type = json['type'];
    userId = json['user_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['holder_name'] = holderName;
    data['card_number'] = cardNumber;
    data['exp_date'] = expDate;
    data['cvv'] = cvv;
    data['type'] = type;
    return data;
  }
}
