import 'package:flutter/material.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';

class MotelHeaderItem extends StatelessWidget {
  final String motelImage;
  final String motelName;
  final String motelNeighboor;
  final String motelDistance;
  final Decimal motelRating;
  final int reviewsCount;

  const MotelHeaderItem({
    super.key,
    required this.motelImage,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                motelImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.image, size: 40),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        motelName,
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.grey[400],
                      size: 32,
                    ),
                  ],
                ),
                Text(
                  "$motelDistance km - $motelNeighboor",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1), // Borda âmbar
                        borderRadius: BorderRadius.circular(8), // Borda arredondada
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Espaçamento interno mínimo
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 12), // Ícone menor
                          const SizedBox(width: 1), // Espaçamento mínimo
                          Text(
                            motelRating.formattedValue,
                            style: TextStyle(fontSize: 12, height: 1), // Texto menor e altura reduzida
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$reviewsCount avaliações'),
                        const Icon(Icons.arrow_drop_down, size: 16),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
