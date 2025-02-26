import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/core/common/widgets/bottom_nav_bar.dart';
import 'package:lg_task_two/core/config/app_config.dart';
import 'package:lg_task_two/core/config/app_locale.dart';
import 'package:lg_task_two/core/theme/bloc/theme_bloc.dart';
import 'package:lg_task_two/core/theme/bloc/theme_state.dart';
import 'package:lg_task_two/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConfig.appName,
          theme: themeState.themeData,
          supportedLocales: AppLocale.supportedLocales,
          home: const BottomNavBar(),
        );
      },
    );
  }
}
