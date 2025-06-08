import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: icon,
      label: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF061730),
          fontSize: 14,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: const BorderSide(color: Color(0xFFCBD1DA)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
      ),
    );
  }
}