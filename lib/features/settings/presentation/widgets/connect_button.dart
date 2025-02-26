import 'package:flutter/material.dart';

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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        fixedSize: const Size(200, 55),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
