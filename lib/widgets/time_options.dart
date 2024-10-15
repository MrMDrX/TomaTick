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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 150),
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.startTimer(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 50,
              width: 70,
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
                    fontSize: 20,
                    color: int.parse(time) == provider.selectedTime
                        ? Colors.redAccent.shade100
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
