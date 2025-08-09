import 'package:flutter/material.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No vendors found.',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try a different search term.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
