import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = 'Loading...';

  void setStop() {
    setState(() {
      _text = 'Stop Loading => Loading...';
    });
  }

  void setStart() {
    setState(() {
      _text = 'Loading...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 23, 137, 109),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 137, 109)),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('CS App'),
            // leading: IconButton(
            //   icon: const Icon(Icons.menu),
            //   onPressed: () {
            //     debugPrint('Opps ... Menu');
            //   },
            // ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  debugPrint('Opps ... Search');
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  debugPrint('Opps ... Notifications');
                },
              ),
            ],
          ),
          // body: Container(
          //   padding: const EdgeInsets.all(16),
          //   alignment: Alignment.center,
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
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(20),
          //         child: Image.asset(
          //           'assets/images/img1.jpg',
          //         ),
          //       ),
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
          body: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.network(
                  'https://wutthiphon.space/assets/images/WoodyCH_Logo.png',
                  width: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'ขอบคุณที่ใช้บริการ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'เรายินดีที่ได้เป็นส่วนหนึ่งในการเดินทางของคุณ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Text(
                      'สรุปรายละเอียดการชาร์จ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 30,
                            ),
                            Text(
                              'วันที่ชาร์จ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '9 ธันวาคม 2567',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.power,
                              size: 30,
                            ),
                            Text(
                              'สถานีชาร์จ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'สถานีชาร์จ 1',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '? ????',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
