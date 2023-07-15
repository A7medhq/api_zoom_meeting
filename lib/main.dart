import 'package:flutter/material.dart';
import 'package:zoom_test/http_request.dart';
import 'package:zoom_test/login_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? data;
  String? email;
  LoginModel? loginModel;

  getdata() async {
    // ApiRequest().login().then((loginModel) {
    //   setState(() {
    //     data = loginModel?.name;
    //     email = loginModel?.email;
    //   });
    // });

    loginModel = await ApiRequest().login();

    if (loginModel != null) {
      email = loginModel?.user.email;
      data = loginModel?.user.name;
      setState(() {});
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          data != null ? Text(data!) : const CircularProgressIndicator(),
          email != null ? Text(email!) : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
