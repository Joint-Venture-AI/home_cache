import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeHealthPieChart extends StatelessWidget {
  const HomeHealthPieChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          dataMap: const {
            'Completed': 80,
            'Remaining': 20,
          },
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 0,
          chartRadius: 200.w,
          colorList: [
            AppColors.primary,
            AppColors.red,
          ],
          chartType: ChartType.ring,
          ringStrokeWidth: 16.w,
          centerText: '',
          initialAngleInDegree: 270,
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: false,
          ),
        ),
        Container(
          width: 180.w,
          height: 180.h,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '80%',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'HOME HEALTH SCORE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
