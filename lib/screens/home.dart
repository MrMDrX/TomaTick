import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tomatick/provider/timer_service.dart';
import 'package:tomatick/utils/utils.dart';
import 'package:tomatick/widgets/progress_widget.dart';
import 'package:tomatick/widgets/time_controller.dart';
import 'package:tomatick/widgets/timer_card.dart';
import 'package:tomatick/widgets/time_options.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final colors = renderColor(provider.currentState);

    void showGoalReachedSnackBar() {
      final snackBar = SnackBar(
        content: Text(
          "Goal reached!Congratulations! You've reached your goal!",
          style: GoogleFonts.montserrat(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.greenAccent.shade400,
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (provider.goalReached) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showGoalReachedSnackBar();
      });
      provider.goalReached = false;
    }

    return Scaffold(
      backgroundColor: colors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.appBarColor,
        title: Text(
          'TOMATICK',
          style: GoogleFonts.montserrat(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 4),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<TimerService>(context, listen: false).reset();
            },
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
