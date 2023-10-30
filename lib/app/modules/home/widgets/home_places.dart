import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/theme/jp_colors.dart';
import 'package:justplay/app/widgets/jp_picture.dart';

class HomePlaces extends StatelessWidget {
  const HomePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: JpPicture(
                  path: 'https://picsum.photos/${500 + index}',
                  width: 1.sw,
                  height: 0.2.sw,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Place ${index + 1}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: JpColors.white,
                      ),
                    ),
                    Text(
                      'Direction ${index + 1}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: JpColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
