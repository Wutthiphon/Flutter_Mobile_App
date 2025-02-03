import 'package:flutter/material.dart';
import 'package:flutter_cs_in_lab_project/models/product.model.dart';
import 'package:flutter_cs_in_lab_project/services/api.service.dart';

// Future<Product> fechtRecord({required String strUrl}) async {
//   final response = await http.get(Uri.parse(strUrl), headers: {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',
//   });

//   if (response.statusCode == 200) {
//     return Product.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

class DetailPage extends StatefulWidget {
  final int productID;
  const DetailPage({super.key, required this.productID});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // static const String baseUrl = 'https://itpart.net/mobile/api/'; // API json
  // String baseImgUrl = 'https://itpart.net/mobile/images/'; // base Image URL

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder(
                // future: fechtRecord(
                //     strUrl: '$baseUrl/product${widget.productID}.php'),
                future: APIService(
                  url:
                      'https://itpart.net/mobile/api/product${widget.productID}.php',
                  method: 'GET',
                ).fetch(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // until data is fetched, show loader
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    Product product = Product.fromJson(snapshot.data);

                    return Column(
                      children: [
                        // Text('${snapshot.data!.id}'),
                        Text(product.title,
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 10),
                        Image.network(
                          'https://itpart.net/mobile/images/${product.imageUrl}',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          product.description,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(fontSize: 18),
                    );
                  }
                  return const Text('No data available!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
