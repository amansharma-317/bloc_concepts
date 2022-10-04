import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/app_bloc.dart';
import 'package:foodapp/cubit/theme_cubit.dart';
import 'package:foodapp/screens/homepage.dart';
import 'package:foodapp/wishlist_bloc/wishlist_bloc.dart';

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
        BlocProvider(
          create: (BuildContext context) => AppBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => WishlistBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

