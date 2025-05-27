import 'package:flutter/material.dart';

class CustomerBookingScreen extends StatefulWidget {
  const CustomerBookingScreen({super.key});

  @override
  State<CustomerBookingScreen> createState() => _CustomerBookingScreenState();
}

class _CustomerBookingScreenState extends State<CustomerBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("hi customer"));
  }
}
