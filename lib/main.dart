import 'package:apitest/core/utilities/injector.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:apitest/features/reels/presentation/pages/reels_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init(); // Initialize dependencies
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<ReelsBloc>()), // Correct way to inject Bloc
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reels App',
        home: ReelsPage(),
      ),
    );
  }
}
