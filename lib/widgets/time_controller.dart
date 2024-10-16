import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomatick/provider/timer_service.dart';
import 'package:tomatick/utils/utils.dart';

class TimeController extends StatelessWidget {
  const TimeController({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final colors = renderColor(provider.currentState);

    final totalDuration = provider.selectedTime;
    final remainingTime = provider.currentDuration;
    final progress = remainingTime / totalDuration;

    final screenSize = MediaQuery.of(context).size;
    final size = screenSize.width * 0.24;

    return Container(
      width: size,
      height: size,
      decoration:
          const BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size * 0.92,
            height: size * 0.92,
            child: CircularProgressIndicator(
              strokeWidth: size * 0.08,
              value: progress,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(colors.appBarColor),
            ),
          ),
          // Icon Button
          IconButton(
            onPressed: () {
              if (provider.isRunning) {
                provider.pause();
              } else {
                provider.start();
              }
            },
            icon: Icon(provider.isRunning ? Icons.pause : Icons.play_arrow),
            color: Colors.white,
            iconSize: size * 0.55,
          ),
        ],
      ),
    );
  }
}
