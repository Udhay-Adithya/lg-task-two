import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final Icon prefixIcon;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    this.isObscureText = false,
  });

  @override
  State<InputField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<InputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hintText,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: widget.controller,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              errorStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.red),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Iconsax.eye_slash : Iconsax.eye,
                      ),
                      onPressed: _toggleVisibility,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            autofillHints:
                widget.isObscureText ? const [AutofillHints.password] : null,
            validator: (value) {
              if (widget.isObscureText) {
                if (value!.isEmpty) {
                  return "${widget.hintText} is missing!";
                }
                return null;
              }
              if (value!.isEmpty) {
                return "${widget.hintText} is missing!";
              }
              return null;
            },
            obscureText: _obscureText,
          ),
        ],
      ),
    );
  }
}
