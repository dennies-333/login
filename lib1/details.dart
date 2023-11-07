import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String det;

  const Details({Key? key, required this.det}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}


class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.det,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            //Image.asset('assets/images/details_image.png'),
          ],
        ),
      ),
    );
  }
}
