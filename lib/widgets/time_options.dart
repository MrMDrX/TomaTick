import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tomatick/provider/timer_service.dart';
import 'package:tomatick/utils/utils.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final colors = renderColor(provider.currentState);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 150),
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.startTimer(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: screenWidth * 0.1, // Proportional height
              width: screenWidth * 0.15, // Proportional width
              decoration: int.parse(time) == provider.selectedTime
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    )
                  : BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.white30,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
              child: Center(
                child: Text(
                  (int.parse(time) ~/ 60).toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: screenWidth * 0.05, // Proportional font size
                    color: int.parse(time) == provider.selectedTime
                        ? colors.bgColor
                        : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
