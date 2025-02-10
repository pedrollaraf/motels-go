import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: StickyHeaderExample(),
      ),
    ),
  );
}

class StickyHeaderExample extends StatelessWidget {
  const StickyHeaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 120,
            collapsedHeight: 120,
            backgroundColor: Colors.amber,
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
                                Tab(text: 'Tab 1'),
                                Tab(text: 'Tab 2'),
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
                          mainAxisSize: MainAxisSize.min, // Importante para não ocupar largura total
                          children: [
                            Text(
                              'Meu Botão',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8), // Espaçamento entre texto e ícone
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
            delegate: _StickyHeaderDelegate(),
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
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
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
