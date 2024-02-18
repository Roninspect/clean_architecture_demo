import 'package:clean_architecture_demo/injection_container.dart';
import 'package:clean_architecture_demo/src/features/top/presentation/bloc/top_anime_bloc_bloc.dart';
import 'package:clean_architecture_demo/src/features/top/presentation/pages/top_anime_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopAnimeBlocBloc>(
      create: (context) => sl()..add(const GetTopAnime()),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TopAnimePage(),
      ),
    );
  }
}
