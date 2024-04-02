
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prototype/ui_view_swift.dart';
import 'package:prototype/user/user.dart';
import 'dart:async';
import 'dart:convert';
import 'FlutterMethodChannel.dart';

void main() {
  runApp(const MyApp());
  FlutterNativeCodeListenerMethodChannel.instance.configureChannel();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FlutterNativeCodeListenerMethodChannel.instance.methodChannel!
        .setMethodCallHandler(this.methodHandler);
  }

  int _counter = 0;
  // 2-  The client and host sides of a channel are connected
  //through a channel name passed in the channel constructor.
  static const platform = MethodChannel('my_flutter_app.sendMessage');
  String _messageText = 'Unknown';

  Future<void> _sendMessageToNativeCode() async {
    try {
      // 3- invoke a method on the method channel,
      final user = User("Nomixe", "nomxie@example.com");
      // final jsonStr = {
      //   "name": "nomxie Akhtar",
      //   "email": "nomxie@example.com",
      // };

      final returnText =
          await platform.invokeMethod('sendMessage', json.encode(user));

      setState(() {
        _messageText = returnText;
      });
    } catch (error) {
      setState(() {
        _messageText = error.toString();
      });
    }
  }

  Future<void> methodHandler(MethodCall call) async {
    final String usersStringJson = call.arguments;
    Map<String, dynamic> userMap = json.decode(usersStringJson);
    var user = User.fromJson(userMap);

    switch (call.method) {
      case "receieveMessage":
        setState(() {
          // _messageText = "${user.name} ${user.email} receieveMessage";
          _messageText = "${user.email} ${user.name} receieveMessage";
        }); // this method name needs to be the same from invokeMethod in Android// you can handle the data here. In this example, we will simply update the view via a data service
        break;
      default:
        print('no method handler for method ${call.method}');
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(_messageText),
            Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: 200,
                  child: const SwiftUiKit()),
            ElevatedButton(
              onPressed: _sendMessageToNativeCode,
              child: const Text('Send Message to Native'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}