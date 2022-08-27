class ProductOffer {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String image;
  late String discountRatio;
  late String originalPrice;
  late String discountPrice;
  late String productId;
  late String startDate;
  late String endDate;
  late bool expired;
  late String imageUrl;

  ProductOffer();

  ProductOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    image = json['image'];
    discountRatio = json['discount_ratio'];
    originalPrice = json['original_price'];
    discountPrice = json['discount_price'];
    productId = json['product_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    expired = json['expired'];
    imageUrl = json['image_url'];
  }
}
