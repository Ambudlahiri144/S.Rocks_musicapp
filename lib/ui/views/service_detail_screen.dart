import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceTitle;

  const ServiceDetailScreen({super.key, required this.serviceTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceTitle),
      ),
      body: Center(
        child: Text(
          'You tapped on: $serviceTitle',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}