import 'package:flutter/material.dart';

import 'second_page.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  FirstPage({Key? key}) : super(key: key);

  bool isPalindrome(String input) {
    String filteredInput = input.replaceAll(RegExp(r"\s"), "").toLowerCase();
    return filteredInput == filteredInput.split('').reversed.join('');
  }

  void showDialogResult(BuildContext context) {
    String input = sentenceController.text;
    bool palindrome = isPalindrome(input);
    String message = palindrome ? 'isPalindrome' : 'not palindrome';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'assets/person.png',
                fit: BoxFit.contain,
                width: 170,
                height: 150,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: sentenceController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Palindrome',
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  showDialogResult(context);
                },
                child: const Text('Check'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(nameController.text),
                    ),
                  );
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
