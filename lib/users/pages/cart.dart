import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/pages/home.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return CartItemCard(cartItem: cartItem);
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout logic here
                },
                child: Text(
                  "Thanh toán "
                  // 'Checkout - \$${cartItems.fold(0, (sum, item) => sum + item.totalPrice).toStringAsFixed(2)}',
                  // style: const TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            )
          : null,
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(cartItem.imageUrl, width: 50, height: 50),
      title: Text(cartItem.title),
      subtitle: Text('\$${cartItem.price.toStringAsFixed(2)} x ${cartItem.quantity}'),
      trailing: Text('\$${cartItem.totalPrice.toStringAsFixed(2)}'),
    );
  }
}
