import 'package:flutter/material.dart';
import 'package:travel_mate/data/services.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({super.key, required this.service});

  Services service;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.service.name),
        centerTitle: true,
      ),
    );
  }
}
