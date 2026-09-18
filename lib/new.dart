import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Shop',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Laptop",
      "price": 50000,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHh0TO3I7zSpAn5ykUnz6i8ijhl_EhRd7Murapg9zBIw&s"
    },
    {
      "name": "Headphones",
      "price": 2000,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdCbStL26AFbPzH6T3zOFopDC13H0-s4dh5PXpoZ9gsA&s=10"
    },
    {
      "name": "Smart Watch",
      "price": 3000,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdZsVTcqMHKaZrGgnxNgiMRtNy68IHqQiRVhAL-35TIA&s=10"
    },
    {
      "name": "Mouse",
      "price":850,
      "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXYy6PxymtQsTTCRauFa68ldA6zicbUlH4PZt1_iXKJA&s=10"
    },
    {
      "name": "Tablet",
      "price": 60000,
      "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoISWp1_RS6RCkpnqy-H-jGY-7KSs4s-gTmBnjg2F1LQ&s=10"
    },];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          IconButton(
            onPressed: () {
              print("Cart opened");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),

        itemCount: products.length,

        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            elevation: 4,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    product["image"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    product["name"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  "₹${product["price"]}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                ElevatedButton(
                  onPressed: () {
                    print(
                      "${product["name"]} added to cart",
                    );
                  },
                  child: const Text("Add to Cart"),
                ),

                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}