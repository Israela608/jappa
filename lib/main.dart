import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jappa/cubit/app_cubit_logics.dart';
import 'package:jappa/cubit/app_cubits.dart';
import 'package:jappa/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        //Create this cubit 'AppCubits()'
        create: (context) => AppCubits(
          //We create the service
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
