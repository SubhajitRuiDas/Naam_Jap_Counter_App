import 'package:flutter/material.dart';
import 'package:naam_jap_counter_app/utils/constants.dart';
import 'package:naam_jap_counter_app/view/widgets/score_view_widget.dart';
import 'package:naam_jap_counter_app/viewmodel/track_jap_count_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final japCounterProvider = context.watch<TrackJapCountProvider>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 30),
      decoration: BoxDecoration(
        gradient: glowGradient,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreViewWidget(
                scoreTopic: "Naam Japs", 
                scoreTopicCount: japCounterProvider.dailyTotalCount,
              ),
              const SizedBox(width: 10,),
              ScoreViewWidget(
                scoreTopic: "Jap Count", 
                scoreTopicCount: japCounterProvider.malaJapCount,
              ),
              const SizedBox(width: 10,),
              ScoreViewWidget(
                scoreTopic: "Total Count", 
                scoreTopicCount: japCounterProvider.totalAllOverCount,
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 13.0,
                      animation: true,
                      percent: japCounterProvider.malaJapCountPercent,
                      center: Text(
                        "${japCounterProvider.malaJapCountPercentage}%",
                        style:
                          TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0, color: textSecondary
                          ),
                      ),
                      footer: Text(
                        "Mala Jap Count",
                        style:
                            TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 17.0,
                              color: textSecondary
                            ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: textMuted,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
              onPressed: () {
                context.read<TrackJapCountProvider>().increaseCount();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC84B),
                foregroundColor: Colors.white,
                elevation: 4,
                minimumSize: const Size(130, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Tap",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TrackJapCountProvider>().resetDailyCount();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: malaLightBrown,
                foregroundColor: Colors.white,
                elevation: 4,
                minimumSize: const Size(130, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Reset",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }
}