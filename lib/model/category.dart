class CategoryModel {
  String icon, text;
  bool isSelected;

  CategoryModel({
    required this.icon,
    required this.text,
    this.isSelected = false,
  });
}
