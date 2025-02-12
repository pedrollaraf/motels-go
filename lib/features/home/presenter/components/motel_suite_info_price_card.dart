import 'package:flutter/material.dart';

class MotelSuiteInfoPriceCard extends StatelessWidget {
  const MotelSuiteInfoPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1 hora',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('R 79,00'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      ),
    );
  }
}
