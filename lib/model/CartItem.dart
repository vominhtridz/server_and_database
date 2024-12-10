class CartItem {
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}
