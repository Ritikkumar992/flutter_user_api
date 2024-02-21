import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_api/style/style.dart';
import 'package:user_api/utility/utility.dart';

void main()
{
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future apicall() async{
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    if(response.statusCode == 200){
      setState(() {
        AppUtility.mapResponse = json.decode(response.body);
        AppUtility.listResponse = AppUtility.mapResponse['data'];
      });
    }
  }
  @override
  void initState(){
    apicall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return styleClass();
  }
}

