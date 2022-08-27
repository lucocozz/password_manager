import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

class StrenghtIndicator extends StatefulWidget {
  final String password;
  final double? spaceBetween;
  final Color baseColor;

  const StrenghtIndicator({
    Key? key,
    required this.password,
    this.spaceBetween,
    required this.baseColor,
  }) : super(key: key);

  @override
  State<StrenghtIndicator> createState() => _StrenghtIndicatorState();
}

class _StrenghtIndicatorState extends State<StrenghtIndicator> {
  Color _colorState({
    required Color weak,
    required Color low,
    required Color medium,
    required Color strong,
  }) {
    double strength = estimatePasswordStrength(widget.password);

    if (strength > 0.0 && strength < 0.25) {
      return weak;
    } else if (strength >= 0.25 && strength < 0.5) {
      return low;
    } else if (strength >= 0.5 && strength < 0.75) {
      return medium;
    } else if (strength >= 0.75) {
      return strong;
    } else {
      return widget.password.isNotEmpty ? weak : widget.baseColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              height: 3,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                color: _colorState(
                  weak: Colors.red,
                  low: Colors.orange,
                  medium: Colors.blue,
                  strong: Colors.green,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(width: widget.spaceBetween ?? 0),
          Expanded(
            child: AnimatedContainer(
              height: 3,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                color: _colorState(
                  weak: widget.baseColor,
                  low: Colors.orange,
                  medium: Colors.blue,
                  strong: Colors.green,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(width: widget.spaceBetween ?? 0),
          Expanded(
            child: AnimatedContainer(
              height: 3,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                color: _colorState(
                  weak: widget.baseColor,
                  low: widget.baseColor,
                  medium: Colors.blue,
                  strong: Colors.green,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(width: widget.spaceBetween ?? 0),
          Expanded(
            child: AnimatedContainer(
              height: 3,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                color: _colorState(
                  weak: widget.baseColor,
                  low: widget.baseColor,
                  medium: widget.baseColor,
                  strong: Colors.green,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
