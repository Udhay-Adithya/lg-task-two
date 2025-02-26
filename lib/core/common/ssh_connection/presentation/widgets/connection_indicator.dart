import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/ssh_client_cubit/ssh_clent_cubit.dart';

class SSHConnectionIndicator extends StatelessWidget {
  const SSHConnectionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SSHClientCubit, SSHClientState>(
      builder: (context, state) {
        if (state is SSHClientSuccess) {
          return Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          );
        } else if (state is SSHClientLoading) {
          return const Text('Connecting...');
        } else {
          return Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
