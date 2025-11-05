import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injections/service_locator.dart';
import 'features/spot_finder/presentation/cubits/spots_cubit.dart';
import 'features/spot_finder/presentation/views/spot_finder_page.dart';

void main() async {
  ServiceLocator serviceLocator = ServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => slInstance<SpotsCubit>(instanceName: "spotsCubit"))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentz Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SpotFinderPage(),
    );
  }
}