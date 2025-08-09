import 'package:flutter/material.dart';

class StartSearchingWidget extends StatelessWidget {
  const StartSearchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 80,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Start searching for vendors.',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
          SizedBox(height: 8),
          Text(
            'Find your favorite businesses here!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
