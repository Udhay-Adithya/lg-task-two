import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lg_task_two/core/utils/theme_switch_button.dart';
import 'package:lg_task_two/features/settings/presentation/widgets/connect_button.dart';
import 'package:lg_task_two/features/settings/presentation/widgets/input_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final ipController = TextEditingController();
  final portController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: const [
          ThemeSwitchButton(),
        ],
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InputField(
                  hintText: "Username",
                  controller: usernameController,
                  prefixIcon: const Icon(Iconsax.user),
                ),
                const SizedBox(
                  height: 12,
                ),
                InputField(
                  hintText: "Password",
                  controller: passwordController,
                  prefixIcon: const Icon(Iconsax.lock_1),
                  isObscureText: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                InputField(
                  hintText: "IP",
                  controller: ipController,
                  prefixIcon: const Icon(Iconsax.code),
                ),
                const SizedBox(
                  height: 12,
                ),
                InputField(
                  hintText: "Port",
                  controller: portController,
                  prefixIcon: const Icon(Iconsax.password_check),
                ),
                const SizedBox(
                  height: 48,
                ),
                ConnectButton(buttonText: "Connect", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
