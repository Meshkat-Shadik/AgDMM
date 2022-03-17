import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IconWithButton extends StatelessWidget {
  const IconWithButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.isPhone,
  }) : super(key: key);
  final String text;
  final Icon icon;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        String phone = text.replaceAll('-', '');
        isPhone ? launch('tel://$phone') : launch('mailto:$text');
      },
      icon: Icon(icon.icon),
      label: Text(text),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    );
  }
}
