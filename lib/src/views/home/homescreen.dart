import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFDE4D8),
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('Explore Yourself'),
          backgroundColor: const Color(0xFFD8CCF5),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 10,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFFADD9F4),
                child: Column(
                  children: const [
                    Text('Q.1 How much you know about yourself?'),
                    TextField(),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFFADD9F4),
                child: Column(
                  children: const [
                    Text('Q.1 What you like about Yourself?'),
                    TextField(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
