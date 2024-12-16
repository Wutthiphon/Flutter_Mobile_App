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
            title: const Text('EV App'),
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

          // Learning LAB
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

          // Week 2
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

          // Week 3
          body: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/img2.png'),
              ),
              // Scroll Layout
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'EV Charging Calculator',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Current SOC %',
                                  hintText: 'Enter %',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Target SOC %',
                                  hintText: 'Enter %',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Charge Rate (A)',
                            hintText: 'Enter A',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            debugPrint('Calculate Tap');
                          },
                          icon: const Icon(Icons.check),
                          iconAlignment: IconAlignment.end,
                          label: const Text('Calculate'),
                        ),
                        const SizedBox(height: 10),
                        const Card(
                          child: ListTile(
                            leading: Icon(Icons.power),
                            title: Text('Volt'),
                            subtitle: Text('225'),
                          ),
                        ),
                        const Card(
                          child: ListTile(
                            leading: Icon(Icons.bolt),
                            title: Text('Watt Charge'),
                            subtitle: Text('4.1400'),
                          ),
                        ),
                        const Card(
                          color: Color.fromRGBO(255, 220, 24, 1),
                          child: ListTile(
                            leading: Icon(Icons.fast_forward),
                            title: Text('Charge Time'),
                            subtitle: Text('7.085'),
                          ),
                        ),
                        const Card(
                          color: Color.fromRGBO(182, 255, 188, 1),
                          child: ListTile(
                            leading: Icon(Icons.battery_full),
                            title: Text('Battery kWh'),
                            subtitle: Text('38.5'),
                          ),
                        ),
                        const Card(
                          color: Color.fromRGBO(191, 248, 241, 1),
                          child: ListTile(
                            leading: Icon(Icons.savings),
                            title: Text('Eff %'),
                            subtitle: Text('0.84'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
