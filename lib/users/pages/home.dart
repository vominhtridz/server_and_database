import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/pages/cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // A simple list to hold cart items
  List<CartItem> cartItems = [];

  // Method to add items to cart
  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'ShopApp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Open search screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartScreen and pass cart items
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categories Section (same as before)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryChip(title: 'Electronics'),
                    CategoryChip(title: 'Clothing'),
                    CategoryChip(title: 'Accessories'),
                    CategoryChip(title: 'Home'),
                    CategoryChip(title: 'Books'),
                  ],
                ),
              ),
            ),
            // Products Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 10, // Number of products
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: 'Product $index',
                    price: 99.99 + index,
                    imageUrl: 'https://via.placeholder.com/150',
                    onAddToCart: () {
                      addToCart(CartItem(
                        title: 'Product $index',
                        price: 99.99 + index,
                        imageUrl: 'https://via.placeholder.com/150',
                      ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class CategoryChip extends StatelessWidget {
  final String title;

  const CategoryChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAddToCart,
                  child: const Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
