import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:a_bridge/a_bridge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _argument = ['Unknown'];
  final _aBridgePlugin = ABridge.create();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _aBridgePlugin.getArgumentPair();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    List<String> arguments;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      arguments =
          (await _aBridgePlugin.getArgumentList()) ?? ['No params received'];
    } on PlatformException {
      arguments =  ['No params received'];
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _argument = arguments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _argument.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_argument[index]),
                    onTap: () {
                      print('Tapped on ${_argument[index]}');
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Spacer between ListView and FlatButton
            TextButton(
              onPressed: () async {
                // Add your button onPressed logic here
                print('Button pressed');
                List<String> arguments = (await _aBridgePlugin.getArgumentList()) ?? ['No params received'];
                setState(() {
                _argument = arguments;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Press Me'),
            ),
          ],
        )
        ,
      ),
    );
  }
}
