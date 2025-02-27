import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/ssh_client_cubit/ssh_clent_cubit.dart';
import 'package:lg_task_two/core/common/widgets/bottom_nav_bar.dart';
import 'package:lg_task_two/core/config/app_config.dart';
import 'package:lg_task_two/core/config/app_locale.dart';
import 'package:lg_task_two/core/theme/bloc/theme_bloc.dart';
import 'package:lg_task_two/core/theme/bloc/theme_state.dart';
import 'package:lg_task_two/features/home/presentation/blocs/clean_kml/clean_kml_bloc.dart';
import 'package:lg_task_two/features/home/presentation/blocs/clean_lg_logo/clean_lg_logo_bloc.dart';
import 'package:lg_task_two/features/home/presentation/blocs/refresh_lg/refresh_lg_bloc.dart';
import 'package:lg_task_two/features/home/presentation/blocs/send_lg_logo/send_lg_logo_bloc.dart';
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
        BlocProvider(
          create: (_) => SSHClientCubit()..getCachedConnectionData(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<RefreshLgBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<SendLgLogoBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<CleanLgLogoBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<CleanKmlBloc>(),
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
