import 'package:flutter/material.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';

class MotelHeaderItem extends StatelessWidget {
  final String motelName;
  final String motelNeighboor;
  final String motelDistance;
  final Decimal motelRating;
  final int reviewsCount;

  const MotelHeaderItem({
    super.key,
    required this.motelName,
    required this.motelNeighboor,
    required this.motelDistance,
    required this.motelRating,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            motelName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "$motelDistance km - $motelNeighboor",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              Text('${motelRating.formattedValue} - ($reviewsCount avaliações)'),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
