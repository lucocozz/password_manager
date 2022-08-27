import 'package:flutter/material.dart';
import 'package:password_manager/sources/theme/palette.dart';
import 'strength_indicator.dart';

class PasswordField extends StatefulWidget {
  final String? hintText;
  final bool? strengthIndicatorVisible;

  const PasswordField({
    Key? key,
    this.hintText,
    this.strengthIndicatorVisible = false,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.strengthIndicatorVisible == true) {
      _controller.addListener(() => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
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
        ),
        if ((widget.strengthIndicatorVisible ?? false) == true)
          const SizedBox(height: 4),
        if ((widget.strengthIndicatorVisible ?? false) == true)
          StrenghtIndicator(
            password: _controller.text,
            baseColor: Theme.of(context).brightness == Brightness.dark
                ? Palette.dark.baseStrengthIndicator
                : Palette.light.baseStrengthIndicator,
            spaceBetween: 8,
          ),
      ],
    );
  }
}
