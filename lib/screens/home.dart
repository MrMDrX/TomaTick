import 'package:flutter/material.dart';
import 'package:tomatick/widgets/progress_widget.dart';
import 'package:tomatick/widgets/time_controller.dart';
import 'package:tomatick/widgets/timer_card.dart';
import 'package:tomatick/widgets/time_options.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'TOMATICK',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(height: 32),
              TimerCard(),
              SizedBox(height: 32),
              TimeOptions(),
              SizedBox(height: 48),
              TimeController(),
              SizedBox(height: 48),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }
}
