import 'package:flutter/material.dart';
import 'package:naam_jap_counter_app/utils/constants.dart';

class ScoreViewWidget extends StatelessWidget{
  final String scoreTopic;
  final int scoreTopicCount;

  const ScoreViewWidget({
    super.key,
    required this.scoreTopic,
    required this.scoreTopicCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          scoreTopic,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          scoreTopicCount.toString(),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textSecondary,
          ),
        ),
      ],
    );
  }
}