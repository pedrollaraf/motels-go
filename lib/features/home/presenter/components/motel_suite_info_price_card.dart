import 'package:flutter/material.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class MotelSuiteInfoPriceCard extends StatelessWidget {
  final List<PeriodEntity> periods;
  const MotelSuiteInfoPriceCard({super.key, required this.periods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: periods.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final period = periods[index];
        return _buildPriceCard(period);
      },
    );
  }

  Widget _buildPriceCard(PeriodEntity periodEntity) {
    return Card(
      elevation: 0.1,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              periodEntity.formattedDuration,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("R\$ ${periodEntity.price.formattedValue}"),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      ),
    );
  }
}
