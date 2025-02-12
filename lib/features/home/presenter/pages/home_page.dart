import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/di/app_di.dart';
import 'package:moteis_go/features/home/presenter/components/motel_header_item.dart';
import 'package:moteis_go/features/home/presenter/components/motel_suite_card.dart';
import 'package:moteis_go/features/home/presenter/components/motel_suite_icons_card.dart';
import 'package:moteis_go/features/home/presenter/components/motel_suite_info_price_card.dart';
import 'package:moteis_go/features/home/presenter/components/sticky_header.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<HomeCubit>()..getMotels(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      expandedHeight: 120,
                      collapsedHeight: 120,
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).padding.top),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    // Leading Icon
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.list, color: Colors.white),
                                    ),

                                    // TabBar centralizada
                                    Expanded(
                                      child: TabBar(
                                        dividerHeight: 0,
                                        dividerColor: null,
                                        tabs: [
                                          Tab(text: HomeStrings.goNow),
                                          Tab(text: HomeStrings.goOtherDay),
                                        ],
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.white70,
                                        indicatorColor: Colors.white,
                                      ),
                                    ),

                                    // Actions
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.search, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        HomeStrings.myLocation,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: StickyHeader(),
                    ),
                  ],
                  body: TabBarView(
                    children: [
                      _buildListView(),
                      _buildListViewText(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      color: AppColorTheme.backgroundColor,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.motelsRequestState is MotelsLoadingState) {
            return _buildListShimmer();
          } else if (state.motelsRequestState is MotelsSuccessState) {
            final motelData = state.motelDataEntity?.motels ?? [];
            final suiteData = motelData.first.suites;
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: suiteData.length,
              itemBuilder: (context, index) {
                final suite = suiteData[index];
                return Column(
                  children: [
                    MotelHeaderItem(
                      motelName: motelData.first.fantasyName,
                      motelNeighboor: motelData.first.neighborhood,
                      motelDistance: motelData.first.distance.formattedValue,
                      motelRating: motelData.first.rating,
                      reviewsCount: motelData.first.reviewCount,
                    ),
                    MotelSuiteCard(
                      suiteImageUrl: suite.photos.first,
                      suiteName: suite.name,
                    ),
                    const SizedBox(height: 2),
                    MotelSuiteIconsCard(
                      categories: suite.categoryItems,
                    ),
                    const SizedBox(height: 2),
                    MotelSuiteInfoPriceCard(),
                  ],
                );
              },
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  ListView _buildListShimmer() {
    return ListView(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: MotelHeaderItem(
            motelName: '',
            motelNeighboor: '',
            motelDistance: '',
            motelRating: Decimal(),
            reviewsCount: 0,
          ),
        ),
        const SizedBox(height: 2),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: MotelSuiteCard(
            suiteImageUrl: '',
            suiteName: '',
          ),
        ),
        const SizedBox(height: 2),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: MotelSuiteIconsCard(
            categories: [],
          ),
        ),
        const SizedBox(height: 2),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: MotelSuiteInfoPriceCard(),
        ),
      ],
    );
  }

  Widget _buildListViewText() {
    return Container(
      color: AppColorTheme.backgroundColor,
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
      ),
    );
  }
}
