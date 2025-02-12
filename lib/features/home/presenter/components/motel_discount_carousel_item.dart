import 'package:flutter/material.dart';

class MotelDiscountCarouselItem extends StatelessWidget {
  const MotelDiscountCarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '20% de desconto',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text('Title', style: Theme.of(context).textTheme.titleLarge),
            Text('Location', style: Theme.of(context).textTheme.bodyMedium),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text('4.6 (123 avaliações)'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'a partir de 123123',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Reservar >'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
