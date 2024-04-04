import 'package:flutter/material.dart';
import 'package:prototype/FlutterMethodChannel.dart';
import 'package:prototype/player/player_builder.dart';
import 'package:prototype/ui_view_swift.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MethodChannel Demo',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _batteryLevel = 'Battery Level.';
  @override
  void initState() {
    super.initState();
    FlutterNativeCodeListenerMethodChannel.configureChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("Method Channel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.yellow),
              ),
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuestionsBuilder()));

                // await FlutterNativeCodeListenerMethodChannel.invokeFromSwift();
              },
              child: const Text(
                'Trigger from ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            // Button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.yellow),
              ),
              onPressed: () async {
                // _batteryLevel = await FlutterNativeCodeListenerMethodChannel.getBatteryLevel();
                setState(() {});
              },
              child: const Text(
                'Get Battery Level',
                style: TextStyle(color: Colors.black),
              ),
            ),

            // const SwiftUiKit(),
            // To show battery percentage.
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
