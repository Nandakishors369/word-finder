import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_matrix/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController wordcontroller = TextEditingController();
  String getword = '';
  bool colorbool = false;
  Color color = Colors.blue;
  List<String> wordss = [
    'w',
    'h',
    'y',
    'k',
    'i',
    'a',
    'b',
    'u',
    't',
    'w',
    'h',
    'y',
    'k',
    'i',
    'a',
    'b',
    'u',
    't',
    'u',
    't'
  ];

  String name = "safeareabuildcontext";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheight20,
            Text(
              "Guess the Word",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            kheight20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (context, index) {
                  return box(index);

                  /* Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        name[index],
                      ),
                    ),
                  ); */
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: wordcontroller,
                decoration:
                    InputDecoration(enabledBorder: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //checking the word
                List wordIndex = [];
                getword = wordcontroller.text;
                var count = 0;
                for (int i = 0; i < getword.length; i++) {
                  for (int j = 0; j < name.length; j++) {
                    if (getword[i] == name[j]) {
                      wordIndex.insert(count, j);
                      count++;

                      log(j.toString());
                    } else {
                      log("words not found");
                    }
                  }
                }
                log(count.toString());
                log(wordIndex.toString());
                colorbool = true;
                setState(() {});
              },
              child: Text("Check the word"),
            ),
          ],
        ),
      )),
    );
  }

/*   Color? colorsChnage(index) {
    if (index - 1 == getword[index]) {
      return color = Colors.green;
    } else {
      return color = Colors.red;
    }
  } */

  Container box(index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          name[index],
        ),
      ),
    );
  }
}
