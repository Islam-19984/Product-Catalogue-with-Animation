import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: themeController.themeMode.value,
      home: const CatalogPage(),
    );
  }
}

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light.obs;

  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  var _isTapped = false;

  // Sample products list
  final products = [
    Product(name: 'Laptop', imageUrl: 'https://via.placeholder.com/150', price: 1200),
    Product(name: 'Smartphone', imageUrl: 'https://via.placeholder.com/150', price: 800),
    Product(name: 'Headphones', imageUrl: 'https://via.placeholder.com/150', price: 200),
  ];

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store'),
        actions: [
          IconButton(
            icon: Icon(
              themeController.themeMode.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                _isTapped = !_isTapped;
              });
              Get.snackbar('Product', product.name, snackPosition: SnackPosition.BOTTOM);
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: _isTapped ? Colors.blueAccent : Colors.white,
              child: Card(
                child: Column(
                  children: [
                    Image.network(product.imageUrl),
                    Text(product.name),
                    Text('\$${product.price}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
