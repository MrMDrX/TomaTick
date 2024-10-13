import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomatick/utils/utils.dart';

class TimeOptions extends StatelessWidget {
  final double selectedTime = 1500;
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 150),
      child: Row(
        children: selectableTimes.map((time) {
          return Container(
            margin: const EdgeInsets.only(left: 10),
            height: 50,
            width: 70,
            decoration: int.parse(time) == selectedTime
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
                  fontSize: 20,
                  color: int.parse(time) == selectedTime
                      ? Colors.redAccent.shade100
                      : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
