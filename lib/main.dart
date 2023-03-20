import 'package:consultant/cubit/DiagnosisCubit.dart';
import 'package:consultant/cubit/systemCubit.dart';
import 'package:consultant/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DiagnosisCubit()),
        BlocProvider(create: (context) => SystemCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
              titleLarge:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              titleMedium:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              bodyMedium: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.white)),
        ),
        home: HomePage(),
      ),
    );
  }
}
