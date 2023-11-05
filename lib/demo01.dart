import 'dart:ui';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class Demo01 extends StatefulWidget {
  const Demo01({super.key});

  @override
  State<Demo01> createState() => _Demo01State();
}

class _Demo01State extends State<Demo01> {
  List<String> imageUrlList = [
    "assets/images/1.jpeg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    // "assets/images/1.jpeg",
    // "assets/images/2.jpg",
    // "assets/images/3.jpg",
    // "assets/images/4.jpg",
    // "assets/images/5.jpg",
  ];

  int currentIndex = 0;

  late Gallery3DController controller;

  @override
  void initState() {
    controller = Gallery3DController(
        itemCount: imageUrlList.length,
        autoLoop: true,
        ellipseHeight: 0,
        minScale: 0.4);
    super.initState();
  }

  Widget buildGallery3D() {
    return Gallery3D(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        itemConfig: const GalleryItemConfig(
          width: 220,
          height: 300,
          radius: 10,
          // isShowTransformMask: true,
          // shadows: [
          //   BoxShadow(
          //       color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 5)
          // ]
        ),
        width: MediaQuery.of(context).size.width,
        height: 500,
        isClip: true,

        // currentIndex: currentIndex,
        onItemChanged: (index) {
           setState(() {
             currentIndex = index;
          });
        },
      itemBuilder: (context, index) {
  return Image.file(File(imageUrlList[index]));
}
);
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Expanded(
                child: BackgrounBlurView(
                  imageUrl: imageUrlList[currentIndex],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: buildGallery3D(),
              ),
            ],
          ),
          // Add the login setup here
          Container(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [
      Container(
        width: 333,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black),
        ),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: const Icon(Icons.person),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        width: 333,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black),
        ),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
          obscureText: true,
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Login'),
      ),
    ],
  ),
)

        ],
      ),
    ),
  );
}

}

class BackgrounBlurView extends StatelessWidget {
  final String imageUrl;
  const BackgrounBlurView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Image.file(
          File(imageUrl),
          fit: BoxFit.cover,
        ),
      ),

      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ))
    ]);
  }
}
