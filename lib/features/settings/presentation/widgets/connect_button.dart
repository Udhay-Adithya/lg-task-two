import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/ssh_client_cubit/ssh_clent_cubit.dart';
import 'package:lg_task_two/core/common/widgets/loader.dart';
import 'package:lg_task_two/core/utils/show_snackbar.dart';

class ConnectButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const ConnectButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SSHClientCubit, SSHClientState>(
      listener: (context, state) {
        if (state is SSHClientFailure) {
          showSnackBar(context, state.message, SnackBarType.error);
        }
      },
      builder: (context, state) {
        if (state is SSHClientSuccess) {
          return ElevatedButton.icon(
            onPressed: () {},
            label: Text(
              "Connected",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            icon: Icon(
              Iconsax.tick_circle_copy,
              color: Theme.of(context).colorScheme.surface,
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fixedSize: const Size(180, 50),
              backgroundColor: Colors.greenAccent.shade400,
            ),
          );
        }
        final isLoading = state is SSHClientLoading;
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            fixedSize: const Size(250, 55),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: Loader(),
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
        );
      },
    );
  }
}
