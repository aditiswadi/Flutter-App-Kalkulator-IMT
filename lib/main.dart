import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_imt/blocs/calculate/calculate_bloc.dart';
import 'package:kalkulator_imt/blocs/gender/gender_bloc.dart';
import 'package:kalkulator_imt/ui/pages/get_started_page.dart';
import 'package:kalkulator_imt/ui/pages/home_page.dart';
import 'package:kalkulator_imt/ui/pages/result_page.dart';
import 'package:kalkulator_imt/ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GenderBloc(),
        ),
        BlocProvider(
          create: (context) => CalculateBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/home': (context) => HomePage(),
          '/result': (context) => ResultPage(),
        },
      ),
    );
  }
}
