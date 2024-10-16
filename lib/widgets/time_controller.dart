import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomatick/provider/timer_service.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context, listen: false);
    return Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          onPressed: () {
            if (provider.isRunning) {
              provider.pause();
            } else {
              provider.start();
            }
          },
          icon: Icon(provider.isRunning ? Icons.pause : Icons.play_arrow),
          color: Colors.white,
          iconSize: 55,
        ),
      ),
    );
  }
}
