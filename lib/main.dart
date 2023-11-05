import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
  late Stream<ConnectivityResult> streamconnectivity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connectivity connectivity = Connectivity();
    streamconnectivity = connectivity.onConnectivityChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: StreamBuilder(
        stream: streamconnectivity,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == ConnectivityResult.wifi) {
              return Text("wifi");
            } else if (snapshot.data == ConnectivityResult.mobile) {
              return Text("Mobile data");
            } else {
              return Text("offline");
            }
          } else {
            return Text("${snapshot.error}");
          }
        },
      ),
    );
  }
}
