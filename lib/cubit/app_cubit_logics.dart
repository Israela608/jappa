import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jappa/cubit/app_cubit_states.dart';
import 'package:jappa/cubit/app_cubits.dart';
import 'package:jappa/pages/details_page.dart';
import 'package:jappa/pages/main_page.dart';
import 'package:jappa/pages/welome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          // This is like a Router
          //Using BlockBuilder we have found the state
          if (state is WelcomeState) {
            //Based on that state, we are redirecting to our desired page
            return WelcomePage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is DetailState) {
            return DetailsPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
