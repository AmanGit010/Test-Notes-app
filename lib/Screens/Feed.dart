import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Future<String> fetchData() async {
//   var url = await Uri.parse('http://192.168.1.7/letest_feeds');
//   var response = await http.get(url);
//   var data = jsonDecode(response.body);
//   String title = data["1"]["content"]["heading"];
//   // print("Response: ${response.body}");
//   if (response.statusCode == 200) {
//     return response.body;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

class feed extends StatefulWidget {
  const feed({super.key});

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  String desc = '';
  String title = '';

  String desc1 = '';
  String title1 = '';

  String desc2 = '';
  String title2 = '';

  String desc3 = '';
  String title3 = '';

  String desc4 = '';
  String title4 = '';

  double _height1 = 170.0; // initial height of the container
  double _height2 = 170.0; // initial height of the container
  double _height3 = 170.0; // initial height of the container
  double _height4 = 170.0; // initial height of the container

  // Future<dynamic> fetchData() async {
  //   var url = await Uri.parse('http://192.168.1.9/letest_feeds');
  //   var response = await http.get(url);
  //   var data = jsonDecode(response.body);
  //   // String desc = data["1"]["content"]["heading"];
  //   // print("Response: ${response.body}");
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       desc = data["1"]["content"]["body"];
  //       title = data["1"]["content"]["heading"];

  //       desc1 = data["2"]["content"]["body"];
  //       title1 = data["2"]["content"]["heading"];

  //       desc2 = data["3"]["content"]["body"];
  //       title2 = data["3"]["content"]["heading"];

  //       desc3 = data["4"]["content"]["body"];
  //       title3 = data["4"]["content"]["heading"];

  //       // desc4 = data["5"]["content"]["body"];
  //       // title4 = data["5"]["content"]["heading"];
  //     });
  //     // return response.body;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // void _toggleHeight1() {
  //   setState(() {
  //     _height1 = _height1 == 170.0
  //         ? 300.0
  //         : 170.0; // toggle the height between 100 and 200
  //   });
  // }

  // void _toggleHeight2() {
  //   setState(() {
  //     _height2 = _height2 == 170.0
  //         ? 300.0
  //         : 170.0; // toggle the height between 100 and 200
  //   });
  // }

  // void _toggleHeight3() {
  //   setState(() {
  //     _height3 = _height3 == 170.0
  //         ? 300.0
  //         : 170.0; // toggle the height between 100 and 200
  //   });
  // }

  // void _toggleHeight4() {
  //   setState(() {
  //     _height4 = _height4 == 170.0
  //         ? 300.0
  //         : 170.0; // toggle the height between 100 and 200
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      // debugShowCheckedModeBanner: false,
      child: SafeArea(
        child: Scaffold(
          body: DefaultTabController(
              length: 3,
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (BuildContext context, bool isScrolled) {
                  return [
                    SliverAppBar(
                      centerTitle: true,
                      leading: Image.asset(
                        "Images/logo_black.png",
                      ),
                      title: const Text('Learn Log'),
                      titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      backgroundColor: Colors.white,
                      snap: true,
                      pinned: true,
                      floating: true,

                      bottom: TabBar(
                        labelStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        dividerColor: Colors.black,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.black),
                        tabs: const [
                          // TextStyle(fontSize: 10),

                          Tab(
                            text: "Feeds",
                          ),
                          Tab(
                            text: "Latest",
                          ),
                          Tab(
                            // icon: Icons.favorite_border_rounded,
                            text: "Likes",
                          ),
                        ],
                      ),
                      elevation: 6,
                      // title: Text("Home"),
                      // centerTitle: true,
                      // floating: true,
                      // snap: true,
                    ),
                  ];
                },
                body: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isExpanded = !isExpanded;
                              },
                            );
                          },
                          // _toggleHeight1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 180, 204, 255),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  duration: const Duration(milliseconds: 900),
                                  // color: Colors.amberAccent,
                                  alignment: Alignment.center,
                                  // height: _height1,
                                  height: isExpanded ? 240 : 350,
                                  curve: Curves.easeInOutCubicEmphasized,
                                  // width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 20),
                                    child: Column(
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 10, vertical: 20),
                                        // child:
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                // "$title1",
                                                "Get started with Flutter development",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 3),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      // "$desc1",
                                                      "We already know there are a lot of frameworks out there that provide the cross-platform functionality then what makes flutter standalone in this rat race? Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bugs faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
                                                      maxLines:
                                                          isExpanded ? 7 : 100,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets
                                                  //           .symmetric(
                                                  //       // horizontal: 10,
                                                  //       vertical: 180),
                                                  //   child:
                                                  // )
                                                ],
                                              ),

                                              // ],
                                              // ),
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                    child:
                                                        Text("Know more...."),
                                                    onTap: () {
                                                      launchUrlString(
                                                          "https://docs.flutter.dev/get-started/install");
                                                      // _launchURL(url) async {
                                                      //   await launchUrl(
                                                      //       "www.google.com"
                                                      //           as Uri
                                                      // );
                                                    }
                                                    // },
                                                    ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isExpanded1 = !isExpanded1;
                              },
                            );
                          },
                          // _toggleHeight1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 180, 205),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  duration: const Duration(milliseconds: 900),
                                  // color: Colors.amberAccent,
                                  alignment: Alignment.center,
                                  // height: _height1,
                                  height: isExpanded1 ? 240 : 350,
                                  curve: Curves.easeInOutCubicEmphasized,
                                  // width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 20),
                                    child: Column(
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 10, vertical: 20),
                                        // child:
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                // "$title1",
                                                "Learn Django",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 3),
                                              child: Flex(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      // "$desc1",
                                                      "Django is a web development framework that assists in building and maintaining quality web applications. Django helps eliminate repetitive tasks making the development process an easy and time saving experience. This tutorial gives a complete understanding of Django.",
                                                      maxLines:
                                                          isExpanded1 ? 7 : 100,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: _toggleHeight2,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 30, vertical: 10),
                        //     child: AnimatedContainer(
                        //       decoration: BoxDecoration(
                        //         color: Colors.blueAccent.shade100,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       duration: Duration(milliseconds: 900),
                        //       // color: Colors.amberAccent,
                        //       alignment: Alignment.center,
                        //       height: _height2,
                        //       curve: Curves.easeInOutCubicEmphasized,
                        //       // width: 300,
                        //       child: Text("Container"),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isExpanded2 = !isExpanded2;
                              },
                            );
                          },
                          // _toggleHeight1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 229, 255, 200),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  duration: const Duration(milliseconds: 900),
                                  // color: Colors.amberAccent,
                                  alignment: Alignment.center,
                                  // height: _height1,
                                  height: isExpanded2 ? 240 : 350,
                                  curve: Curves.easeInOutCubicEmphasized,
                                  // width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 20),
                                    child: Column(
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 10, vertical: 20),
                                        // child:
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                // "$title2",
                                                "Learn React Native",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 3),
                                              child: Flex(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      // "$desc2",
                                                      "React Native is like React, but it uses native components instead of web components as building blocks. So to understand the basic structure of a React Native app, you need to understand some of the basic React concepts, like JSX, components, state, and props. If you already know React, you still need to learn some React Native specific stuff, like the native components. This tutorial is aimed at all audiences, whether you have React experience or not.",
                                                      maxLines:
                                                          isExpanded2 ? 7 : 100,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isExpanded3 = !isExpanded3;
                              },
                            );
                          },
                          // _toggleHeight1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 191, 255, 216),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              duration: const Duration(milliseconds: 900),
                              // color: Colors.amberAccent,
                              alignment: Alignment.center,
                              // height: _height1,
                              height: isExpanded3 ? 240 : 350,
                              curve: Curves.easeInOutCubicEmphasized,
                              // width: 300,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 20),
                                child: Column(
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 10, vertical: 20),
                                    // child:
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            // "$title3",
                                            "Learn Vue.js",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // ),
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 3),
                                              child: Expanded(
                                                child: Text(
                                                  // "$desc3",
                                                  "Vue is a JavaScript framework for building user interfaces. It builds on top of standard HTML, CSS, and JavaScript and provides a declarative and component-based programming model that helps you efficiently develop user interfaces, be they simple or complex.",
                                                  maxLines:
                                                      isExpanded3 ? 7 : 100,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // },
                ),
              )),
        ),
      ),
    );
  }
}
