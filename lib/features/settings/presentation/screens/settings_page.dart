import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/ssh_client_cubit/ssh_clent_cubit.dart';
import 'package:lg_task_two/core/common/ssh_connection/presentation/widgets/connection_indicator.dart';
import 'package:lg_task_two/core/utils/theme_switch_button.dart';
import 'package:lg_task_two/features/settings/presentation/widgets/connect_button.dart';
import 'package:lg_task_two/features/settings/presentation/widgets/input_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ipController = TextEditingController();
  final _portController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadCachedData();
  }

  Future<void> _loadCachedData() async {
    final cubit = context.read<SSHClientCubit>();
    final connectionData = await cubit.getCachedConnectionData();

    if (connectionData != null) {
      _ipController.text = connectionData.ip;
      _usernameController.text = connectionData.username;
      _passwordController.text = connectionData.password;
      _portController.text = connectionData.port.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: const [
          SSHConnectionIndicator(),
          ThemeSwitchButton(),
        ],
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InputField(
                  hintText: "Username",
                  controller: _usernameController,
                  prefixIcon: const Icon(Iconsax.user),
                ),
                const SizedBox(
                  height: 12,
                ),
                InputField(
                  hintText: "Password",
                  controller: _passwordController,
                  prefixIcon: const Icon(Iconsax.lock_1),
                  isObscureText: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                InputField(
                  hintText: "IP",
                  controller: _ipController,
                  prefixIcon: const Icon(Iconsax.code),
                ),
                const SizedBox(
                  height: 12,
                ),
                InputField(
                  hintText: "Port",
                  controller: _portController,
                  prefixIcon: const Icon(Iconsax.password_check),
                ),
                const SizedBox(
                  height: 48,
                ),
                ConnectButton(
                  buttonText: "Connect",
                  onPressed: () {
                    _formKey.currentState!.validate();
                    context.read<SSHClientCubit>().connect(
                          ip: _ipController.text,
                          username: _usernameController.text,
                          password: _passwordController.text,
                          port: int.parse(_portController.text),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
