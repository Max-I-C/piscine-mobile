import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  String text = "A simple text";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "A simple text", 
              style: TextStyle(
                fontSize: 26,
                fontWeight:  FontWeight.bold,
                color: const Color.fromARGB(255, 69, 212, 50) 
              ),
            ),
            ElevatedButton(onPressed: () {
                print("Button clicked");
              }, 
              child: const Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}