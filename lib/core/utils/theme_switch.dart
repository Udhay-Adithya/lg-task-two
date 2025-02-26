import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/core/theme/bloc/theme_bloc.dart';
import 'package:lg_task_two/core/theme/bloc/theme_event.dart';
import 'package:lg_task_two/core/theme/bloc/theme_state.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool switchValue = (state is DarkThemeState);
        return Switch.adaptive(
          value: switchValue,
          onChanged: (value) {
            switchValue = value;
            context.read<ThemeBloc>().add(
                  ToggleThemeEvent(),
                );
          },
        );
      },
    );
  }
}
