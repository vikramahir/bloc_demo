import 'package:demo_bloc_currency/presentation/covid/covid_screen.dart';
import 'package:demo_bloc_currency/presentation/covid/cubit/covid_cubit.dart';
import 'package:demo_bloc_currency/presentation/home/bloc/bloc/home_bloc.dart';
import 'package:demo_bloc_currency/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        routes: registerRouter(),
      ),
    );
  }

  registerRouter() {
    return <String, WidgetBuilder>{
      AppRoutes.covidScreen: (context) => BlocProvider<CovidCubit>(
            create: (context) => CovidCubit(),
            child: const CovidScreen(),
          ),
    };
  }
}
