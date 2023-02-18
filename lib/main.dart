import 'package:consultant/cubit/DiagnosisCubit.dart';
import 'package:consultant/searchDiagnosis.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
          labelLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF21774A)),
          headlineLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFF1F7E0))
          ),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SearchDiagnosis(),
          '/searchDiagnosis': (context) => const SearchDiagnosis(),
        },
      ),
    );
  }
}
