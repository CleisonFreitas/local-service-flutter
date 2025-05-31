import 'package:flutter/material.dart';
import 'package:local_services/features/booking/components/booking_home.dart';
import 'package:local_services/features/booking/components/booking_notifications.dart';
import 'package:local_services/features/booking/components/navigate_bottom_bar.dart';

class CustomerBookingScreen extends StatefulWidget {
  const CustomerBookingScreen({super.key});

  @override
  State<CustomerBookingScreen> createState() => _CustomerBookingScreenState();
}

class _CustomerBookingScreenState extends State<CustomerBookingScreen> {
  final List<Widget> _pages = [
    /// Home page
    const BookingHome(),

    /// Navigation page (use placeholder or future content)
    Center(child: Text('Navigation Page')),

    /// Appointments page
    Center(child: Text('Appointments Page')),

    /// Notifications page
    const BookingNotifications(),

    /// Settings page
    Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigateBottomBar(pages: _pages);
  }
}
