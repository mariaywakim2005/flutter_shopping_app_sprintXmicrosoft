import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> productList = [
    {'image': 'assets/shirt1.jpeg', 'title': 'blue shirt'},
    {'image': 'assets/shirt2.jpeg', 'title': 'green shirt'},
    {'image': 'assets/shirt3.jpeg', 'title': 'yellow shirt'},
    {'image': 'assets/shirt4.jpg', 'title': 'pink shirt'},
  ];

  final List<Map<String, String>> offers = [
    {'image': 'assets/offer1.png', 'description': 'Discount 50% on Product 1'},
    {'image': 'assets/offer2.jpeg', 'description': 'Buy one get one free!'},
    {
      'image': 'assets/offer3.png',
      'description': 'Free shipping on orders > \$50',
    },
    {'image': 'assets/offer4.png', 'description': 'Special weekend sale'},
    {'image': 'assets/offer5.jpeg', 'description': 'Clearance: Up to 70% off'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Our Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Horizontal PageView (featured)
            SizedBox(
              height: 400,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/shirt1.jpeg', fit: BoxFit.cover),
                  Image.asset(
                    'assets/shirt2.jpeg',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Image.asset('assets/shirt3.jpeg', fit: BoxFit.cover),
                  Image.asset('assets/shirt4.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. GridView for products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // so it doesn't conflict with SingleChildScrollView
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 per row
                  childAspectRatio: 3 / 4, // adjust card size
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            product['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Item added to the cart"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 3. Hot Offers header
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hot Offers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 4. ListView.builder for offers
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Card(
                  child: Row(
                    children: [
                      Image.asset(
                        offer['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(offer['description']!),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
