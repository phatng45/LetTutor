import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
          const Text("Login"),
          TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  contentPadding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                  fillColor: Colors.white70)),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                contentPadding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                fillColor: Colors.white70),
          )
        ])));
  }
}
