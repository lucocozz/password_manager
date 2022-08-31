import 'package:flutter/material.dart';
import 'package:password_manager/sources/theme/palette.dart';
import 'strength_indicator.widget.dart';

class PasswordField extends StatefulWidget {
  final String? hintText;
  final bool? strengthIndicatorVisible;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PasswordField({
    Key? key,
    this.hintText,
    required this.controller,
    this.validator,
    this.strengthIndicatorVisible = false,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    if (widget.strengthIndicatorVisible == true) {
      widget.controller.addListener(() => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: _obscureText,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: () => setState(() => _obscureText = !_obscureText),
              splashRadius: 1,
              padding: const EdgeInsets.only(right: 8),
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
        if ((widget.strengthIndicatorVisible ?? false) == true)
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: StrenghtIndicator(
              password: widget.controller.text,
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? Palette.dark.baseStrengthIndicator
                  : Palette.light.baseStrengthIndicator,
              spaceBetween: 8,
            ),
          ),
      ],
    );
  }
}
