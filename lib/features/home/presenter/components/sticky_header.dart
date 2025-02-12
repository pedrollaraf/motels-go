import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/features/home/presenter/components/motel_discount_carousel_item.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';
import 'package:shimmer/shimmer.dart';

class StickyHeader extends SliverPersistentHeaderDelegate {
  final CarouselSliderController _carouselController = CarouselSliderController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: Container(
        color: AppColorTheme.surfaceColor,
        alignment: Alignment.center,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.motelsRequestState is MotelsLoadingState) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: const MotelDiscountCarouselItem(
                  motelImage: "",
                  motelName: '',
                  motelNeighboor: '',
                  suiteDiscount: '',
                  suiteValue: '',
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        if (state.motelDataEntity != null)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ValueListenableBuilder<int>(
                              valueListenable: _currentIndex,
                              builder: (context, currentIndex, _) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: state.motelDataEntity!.motels.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () => _carouselController.animateToPage(entry.key),
                                      child: Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 4.0,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentIndex == entry.key ? Colors.orange : Colors.grey,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CarouselSlider(
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200.0,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                _currentIndex.value = index;
                              },
                            ),
                            items: state.motelDataEntity?.motels.map((modelEntity) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: MotelDiscountCarouselItem(
                                      motelImage: state.motelDataEntity!.motels.first.suites.last.photos.last,
                                      motelName: state.motelDataEntity!.motels.first.fantasyName,
                                      motelNeighboor: state.motelDataEntity!.motels.first.neighborhood,
                                      suiteDiscount: state.motelDataEntity!.motels.first.suites.last.periods.last.discount
                                              ?.discountAmount.formattedValue ??
                                          "",
                                      suiteValue:
                                          state.motelDataEntity!.motels.first.suites.last.periods.last.price.formattedValue,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildFilters(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildFilters() {
    final List<Map<String, IconData?>> filters = [
      {"filtrar": Icons.filter_alt},
      {"com desconto": null},
      {"disponíveis": null},
      {"hidro": null},
      {"piscina": null},
    ];

    return Container(
      color: AppColorTheme.backgroundColor,
      height: 60,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(filters[index].keys.first),
                    selected: false,
                    avatar: filters[index].values.first != null ? Icon(filters[index].values.first) : null,
                    onSelected: (bool value) {},
                  ),
                );
              },
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
