import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lg_task_two/core/theme/bloc/theme_bloc.dart';
import 'package:lg_task_two/core/theme/bloc/theme_event.dart';
import 'package:lg_task_two/core/theme/bloc/theme_state.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: state is LightThemeState
              ? const Icon(
                  Iconsax.moon,
                  color: Colors.indigo,
                )
              : const Icon(
                  Iconsax.sun_1,
                  color: Colors.yellow,
                ),
          onPressed: () {
            context.read<ThemeBloc>().add(
                  ToggleThemeEvent(),
                );
          },
        );
      },
    );
  }
}
