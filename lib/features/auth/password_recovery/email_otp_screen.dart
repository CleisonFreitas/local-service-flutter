import 'package:flutter/material.dart';
import 'package:local_services/shared/components/content_container.dart';

class EmailOtpScreen extends StatefulWidget {
  const EmailOtpScreen({super.key});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContentContainer(child: Text('Otp Screen')));
  }
}
