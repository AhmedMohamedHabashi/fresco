class CategoryModel {
  final String title;
  final String image;
  // final String id;

  CategoryModel({
    required this.title,
    required this.image /*required this.id*/,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
    // id: "clothes",
    title: "Clothes",
    image: "assets/images/categories/clothes.png",
  ),
  CategoryModel(
    // id: "mobile",
    title: "Mobile",
    image: "assets/images/categories/mobile.png",
  ),
  CategoryModel(
    // id: "laptop",
    title: "Laptop",
    image: "assets/images/categories/laptop.png",
  ),
  CategoryModel(
    // id: "shirts",
    title: "Shirts",
    image: "assets/images/categories/shirts.png",
  ),
  CategoryModel(
    // id: "sports_shoes",
    title: "Shoes",
    image: "assets/images/categories/sportsShoes.png",
  ),
  CategoryModel(
    // id: "sports",
    title: "Sports",
    image: "assets/images/categories/sports.png",
  ),
  CategoryModel(
    // id: "tshirts",
    title: "T-Shirts",
    image: "assets/images/categories/tshirts.png",
  ),
  CategoryModel(
    // id: "furniture",
    title: "Furniture",
    image: "assets/images/categories/furniture.png",
  ),
  CategoryModel(
    // id: "electronics",
    title: "Electronics",
    image: "assets/images/categories/electronics.png",
  ),
];
