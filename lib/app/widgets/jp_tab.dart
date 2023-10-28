import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/theme/jp_colors.dart';

class JpTab extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> views;

  const JpTab({
    required this.tabs,
    required this.views,
    super.key,
  }) : assert(tabs.length == views.length);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            labelStyle: TextStyle(
              color: JpColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            tabs: tabs.map((e) {
              return Tab(
                text: e,
                height: 30.h,
              );
            }).toList(),
            indicatorColor: JpColors.orange,
            labelColor: JpColors.black,
            dividerColor: Colors.transparent,
            indicatorWeight: 5.h,
            unselectedLabelColor: JpColors.blackLight,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
          ),
          Expanded(
            child: TabBarView(
              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
