import 'package:flutter/material.dart';
import 'package:flutter_cs_in_lab_project/models/product.model.dart';
import 'package:flutter_cs_in_lab_project/pages/detail.dart';
import 'package:flutter_cs_in_lab_project/services/api.service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _Productstate();
}

class _Productstate extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EV App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Search Tap');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('Notifications Tap');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<dynamic>(
          future: APIService(
            url: "https://itpart.net/mobile/api/products.php",
            method: "GET",
          ).fetch(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                List<Product> products = (snapshot.data as List)
                    .map((item) => Product.fromJson(item))
                    .toList();

                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index].title),
                      subtitle: Text(products[index].description),
                      leading: Image.network(
                        'https://itpart.net/mobile/images/${products[index].imageUrl}',
                        width: 100,
                        height: 100,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(productID: products[index].id),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
