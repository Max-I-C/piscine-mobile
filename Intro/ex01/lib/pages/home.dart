import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String text = "A simple text";

    void changeText() {
        if (text == "Text changed after click!")
        {   
            setState(() {
                text = "A simple text";
            });
        }
        else{ 
            setState(() {
                text = "Text changed after click!";
            });
        }
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                            text,
                            style: TextStyle(
                            fontSize: 26,
                            fontWeight:  FontWeight.bold,
                            color: const Color.fromARGB(255, 69, 212, 50) 
                            ),
                        ),
                        ElevatedButton(
                            onPressed: changeText, 
                            child: const Text("Click"),
                        ),
                    ],
                ),
            ),
        );
    }
}