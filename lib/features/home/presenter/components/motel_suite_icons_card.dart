import 'package:flutter/material.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class MotelSuiteIconsCard extends StatelessWidget {
  final List<CategoryItemEntity> categories;

  const MotelSuiteIconsCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (categories.isNotEmpty) _buildIcon(categories.first.icon),
                if (categories.length > 1) _buildIcon(categories[1].icon),
                if (categories.length > 2) _buildIcon(categories[2].icon),
                _buildSeeAllItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String icon) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          icon,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.image, size: 40));
          },
        ),
      ),
    );
  }

  Widget _buildSeeAllItem() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "ver todos",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 4), // Espaçamento entre o texto e o ícone
        Icon(
          Icons.arrow_downward,
          size: 16,
          color: Colors.grey,
        ),
      ],
    );
  }
}
