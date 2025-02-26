import 'package:flutter/material.dart';

class CommandButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CommandButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        fixedSize: const Size(250, 100),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
