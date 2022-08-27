class HomeSlider {
  late String id, imageUrl;

  HomeSlider();

  HomeSlider.fromJson(Map<String, dynamic> json) {
    id = json['object_id'];
    imageUrl = json['image_url'];
  }
}
