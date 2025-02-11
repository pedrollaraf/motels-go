import 'package:flutter/material.dart';
import 'package:moteis_go/common/commons.dart';

class StickyHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColorTheme.surfaceColor,
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Text(
        "Sticky Header",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  double get maxExtent => 300;
  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
