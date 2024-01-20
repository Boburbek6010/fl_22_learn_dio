import 'package:fl_22_learn_dio/models/user_model.dart';
import 'package:fl_22_learn_dio/services/dio_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<dynamic>? userModel;
  bool isLoading = false;

  Future<void> getData()async{
    userModel = await DioService.fetchData();
    if(userModel != null){
      isLoading = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ?ListView.builder(
        itemBuilder: (_, index){
          var item = UserModel.fromJson(userModel![index]);
          return ListTile(
            title: Text(item.name ?? "No name"),
            subtitle: Text(item.phone ?? "No phone number"),
          );
        },
        itemCount: userModel?.length ?? 0,
      ) :const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
