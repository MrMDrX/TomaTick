import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tomatick/provider/timer_service.dart';
import 'package:tomatick/utils/utils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    final minutes = (provider.currentDuration ~/ 60);
    final colors = renderColor(provider.currentState);
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(
          provider.currentState,
          style: GoogleFonts.montserrat(
            fontSize: screenWidth * 0.08,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeContainer(screenWidth, minutes, colors.bgColor),
            const SizedBox(width: 10),
            Text(
              ":",
              style: GoogleFonts.montserrat(
                fontSize: screenWidth * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            _buildTimeContainer(screenWidth, seconds.round(), colors.bgColor),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeContainer(
      double screenWidth, int timeValue, Color textColor) {
    return Container(
      width: screenWidth / 3.2,
      height: screenWidth / 3.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          timeValue < 10 ? "0$timeValue" : timeValue.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 70,
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
