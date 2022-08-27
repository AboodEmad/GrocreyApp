class Category {
 late int id;
 late String nameEn;
 late String nameAr;
 late String image;
 late String productsCount;
 late String subCategoriesCount;
 late String imageUrl;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.productsCount,
    required this.subCategoriesCount,
    required this.imageUrl,
  });


  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    productsCount = json['products_count'];
    subCategoriesCount = json['sub_categories_count'];
    imageUrl = json['image_url'];
  }

 Category.fromHomeJson(Map<String, dynamic> json) {
   id = json['id'];
   nameEn = json['name_en'];
   nameAr = json['name_ar'];
   image = json['image'];
   imageUrl = json['image_url'];
 }
}
