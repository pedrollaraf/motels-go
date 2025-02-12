import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/features/home/presenter/components/motel_discount_carousel_item.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';
import 'package:shimmer/shimmer.dart';

class StickyHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColorTheme.surfaceColor,
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.motelsRequestState is MotelsLoadingState) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: MotelDiscountCarouselItem(),
            );
          } else {
            return Text(
              "Sticky Header",
              style: TextStyle(color: Colors.black, fontSize: 18),
            );
          }
        },
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
