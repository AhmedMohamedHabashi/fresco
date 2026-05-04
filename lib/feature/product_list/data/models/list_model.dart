class ListModel {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  const ListModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });
  static const List<ListModel> listphoto = [
    ListModel(
      image: 'assets/images/cart_home_3.jpg',
      title: 'Nike Air Jordon ',
      subtitle: "Nike shoes flexible ",
      price: 'EGP 1,200 ',
      rating: 'Review (4.6)',
    ),
    ListModel(
      image: 'assets/images/cart_home_4.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,100 ',
      rating: 'Review (4.5)',
    ),
    ListModel(
      image: 'assets/images/cart_home_5.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,000 ',
      rating: 'Review (4.8)',
    ),
    ListModel(
      image: 'assets/images/cart_home_9.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,500',
      rating: 'Review (4.7)',
    ),
    ListModel(
      image: 'assets/images/cart_home_6.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible',
      price: 'EGP 1,800 ',
      rating: 'Review (4.3)',
    ),
    ListModel(
      image: 'assets/images/cart_home_1.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible',
      price: 'EGP 1,900',
      rating: 'Review (4.9)',
    ),
  ];
}
