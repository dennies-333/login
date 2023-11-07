import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scan/second_page.dart';

class Demo01 extends StatefulWidget {
  const Demo01({Key? key}) : super(key: key);

  @override
  State<Demo01> createState() => _Demo01State();
}

Future<void> authenticateUser(BuildContext context) async {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final username = usernameController.text;
  final password = passwordController.text;

  const url = 'https://dicoman.dist.ac.in/api/login'; // Replace with your server's URL

  final credentials = {
    'username': username,
    'password': password,
  };

  final headers = {
    'Content-Type': 'application/json',
  };

  final body = json.encode(credentials);

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    print(response.body);
    final Map<String, dynamic> responseData = json.decode(response.body);
    String staffid = responseData['staff_id'].toString();
    String status = responseData['status'].toString();
    String category = responseData['category'].toString();

    if (status == '1') {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Second(staffid: staffid, category: category),
        ),
      );
    }
  } else {
    // Handle authentication failure
    // You can display an error message or perform other actions
  }
}

class _Demo01State extends State<Demo01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF25273e), // Set the background color for the whole screen
      body: Stack(
        children: [
          // Image.asset(
          //   "assets/images/1.jpeg",
          //   fit: BoxFit.cover,
          //   height: MediaQuery.of(context).size.height / 2, // Set the height of the image to the top half
          //   width: double.infinity,
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 333,
                  decoration: const BoxDecoration(
                    color: Color(0xFF25273e), 
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 247, 246, 246)),
                      prefixIcon: const Icon(Icons.person,
                      color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF25273e), // Change the background color to Color(0xFF25273e)
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 72, 255, 0), width: 2.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 333,
                  decoration: const BoxDecoration(
                    color: Color(0xFF25273e), // Change the background color to Color(0xFF25273e)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      prefixIcon: const Icon(Icons.lock,
                      color: Colors.white),
                      suffixIcon: const Icon(Icons.visibility_off, color: Color.fromARGB(255, 252, 252, 252)),
                      filled: true,
                      fillColor: const Color(0xFF25273e), // Change the background color to Color(0xFF25273e)
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 0, 255, 55), width: 2.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 333,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      authenticateUser(context);
                      // Handle the login action
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ), // Change the button's background color to red
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Color(0xFF25273e)), // Change the text color to Color(0xFF25273e)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

