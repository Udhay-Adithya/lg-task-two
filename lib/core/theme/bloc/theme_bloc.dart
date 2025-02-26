import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/core/theme/app_theme.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState(lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightThemeState) {
        emit(DarkThemeState(darkTheme));
      } else {
        emit(LightThemeState(lightTheme));
      }
    });
  }
}
