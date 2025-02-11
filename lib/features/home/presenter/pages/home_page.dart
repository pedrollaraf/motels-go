import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/di/app_di.dart';
import 'package:moteis_go/features/home/presenter/components/sticky_header.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';

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
                      _buildListView(),
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
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
      ),
    );
  }
}
