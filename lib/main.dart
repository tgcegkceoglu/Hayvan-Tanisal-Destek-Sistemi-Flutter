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
          labelLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF012340)),
          labelMedium:TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          labelSmall: TextStyle(color: Colors.white,fontSize: 12),
          headlineLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFF1F7E0))
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
