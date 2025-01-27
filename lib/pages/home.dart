import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cs_in_lab_project/pages/welcome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final List<String> _list = [
  //   'Microsoft Windows XP',
  //   'Microsoft Windows 7',
  //   'Kaspersky 2010',
  //   'ESET NOD32 Version 4',
  //   'MacOS 10.9',
  // ];

  Future<String> fetchData() async {
    final response = await http.get(
      // Uri.parse('https://api.wutthiphon.space/api/woodych_web/project'),
      Uri.parse('https://itpart.net/mobile/api/product1.php'),
    );
    if (response.statusCode == 200) {
      // return (json.decode(response.body))['title'];
      return response.body.toString();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
        child: Column(
          children: [
            const Text("API Test"),
            FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          '${snapshot.data}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );

    // Learning LAB
    // ListView.separated(
    //     itemBuilder: (context, index) => ListTile(
    //           title: Text(_list[index]),
    //           subtitle: const Text('Software'),
    //           leading: const Icon(Icons.apps),
    //           trailing: const Icon(Icons.arrow_forward_ios),
    //           onTap: () {
    //             debugPrint('Tap');
    //           },
    //         ),
    //     separatorBuilder: (context, index) => const Divider(),
    //     itemCount: _list.length),

    // ListView(
    //   children: [
    //     const ListTile(
    //       title: Text("Simulator", style: TextStyle(fontSize: 20)),
    //     ),
    //     ListTile(
    //       title: Text("Microsoft Windows XP"),
    //       subtitle: Text("Microsoft Corporation"),
    //       leading: Icon(Icons.apps),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //       tileColor: Colors.amber,
    //       onTap: () {},
    //     ),
    //     ListTile(
    //       title: Text("Microsoft Windows 7"),
    //       subtitle: Text("Microsoft Corporation"),
    //       leading: Icon(Icons.apps),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //       tileColor: Colors.amber,
    //       onTap: () {},
    //     ),
    //     ListTile(
    //       title: Text("Kaspersky 2010"),
    //       subtitle: Text("Kaspersky Lab"),
    //       leading: Icon(Icons.apps),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //       tileColor: Color.fromARGB(255, 79, 203, 137),
    //       onTap: () {},
    //     ),
    //     ListTile(
    //       title: Text("ESET NOD32 Version 4"),
    //       subtitle: Text("ESET"),
    //       leading: Icon(Icons.apps),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //       tileColor: Color.fromARGB(255, 79, 203, 137),
    //       onTap: () {},
    //     ),
    //     ListTile(
    //       title: Text("MacOS 10.9"),
    //       subtitle: Text("Apple Inc."),
    //       leading: Icon(Icons.apps),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //       onTap: () {},
    //     ),
    //     ListTile(
    //       title: Text("Exit"),
    //       leading: Icon(Icons.exit_to_app),
    //       onTap: () => Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => const Welcome())),
    //     ),
    //   ],
    // ),

    // body: Padding(
    //   padding: const EdgeInsets.all(16),
    //   // alignment: Alignment.center,
    //   child: Column(
    //     children: [
    //       const Text(
    //         '6504062620116 Wutthiphon Tasssana',
    //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             _text,
    //           ),
    //           const SizedBox(width: 10),
    //           ElevatedButton(
    //             onPressed: () {
    //               setStop();
    //               debugPrint('Opps ... Stop');
    //             },
    //             child: const Text(
    //               'Say Stop Loading',
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Image.network(
    //         'https://64.media.tumblr.com/016e08a0519172f53be9e62d1b2575f9/862f5002fea3d3c3-9a/s540x810/5b43fdd0865111096cad35f6bbca1fdd0c1aad57.png',
    //         width: 100,
    //       ),
    //       Padding(
    //         padding:
    //             const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(20),
    //           child: Image.asset(
    //             'assets/images/img1.jpg',
    //           ),
    //         ),
    //       ),
    //       const Column(
    //         children: [
    //           Row(
    //             children: [
    //               Icon(
    //                 Icons.calendar_month,
    //                 size: 30,
    //               ),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Expanded(
    //                 child: Text(
    //                   'วันที่ชาร์จ \nDate of charge',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 '9 ธันวาคม 2567',
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //       const Card(
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
    //           child: Text(
    //             'Hello World',
    //           ),
    //         ),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.all(16),
    //         decoration: const BoxDecoration(
    //           color: Colors.blue,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(20),
    //             bottomRight: Radius.circular(20),
    //           ),
    //         ),
    //         child: const Text(
    //           'Hello World',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //       const TextField(
    //         // obscureText: true,
    //         decoration: InputDecoration(
    //           labelText: 'Name',
    //           hintText: 'Enter your name',
    //           // icon: Icon(Icons.person),
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     setStart();
    //     debugPrint('Opps ... Start');
    //   },
    //   child: const Icon(Icons.play_arrow),
    // ),

    // Week 3
    // body: Container(
    //   padding: const EdgeInsets.all(16),
    //   alignment: Alignment.center,
    //   child: Column(
    //     children: [
    //       Image.network(
    //         'https://wutthiphon.space/assets/images/WoodyCH_Logo.png',
    //         width: 100,
    //       ),
    //       const SizedBox(height: 10),
    //       const Text(
    //         'ขอบคุณที่ใช้บริการ',
    //         style: TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       const Text(
    //         'เรายินดีที่ได้เป็นส่วนหนึ่งในการเดินทางของคุณ',
    //         style: TextStyle(
    //           fontSize: 18,
    //         ),
    //       ),
    //       const SizedBox(height: 40),
    //       const Row(
    //         children: [
    //           Text(
    //             'สรุปรายละเอียดการชาร์จ',
    //             style: TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             ),
    //             textAlign: TextAlign.left,
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 10),
    //       const Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 children: [
    //                   Icon(
    //                     Icons.calendar_month,
    //                     size: 30,
    //                   ),
    //                   Text(
    //                     'วันที่ชาร์จ',
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Text(
    //                 '9 ธันวาคม 2567',
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 children: [
    //                   Icon(
    //                     Icons.power,
    //                     size: 30,
    //                   ),
    //                   Text(
    //                     'สถานีชาร์จ',
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: [
    //                   Text(
    //                     'สถานีชาร์จ 1',
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   Text(
    //                     '? ????',
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // ),
  }
}
