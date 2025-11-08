import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomChartIndicator extends StatelessWidget {
  const CustomChartIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: {'Complete': 80, 'empty': 4, 'left': 20, 'empty1': 4},
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 2.0,
      colorList: [
        AppColors.primary,
        AppColors.white,
        AppColors.red,
        AppColors.white
      ],
      initialAngleInDegree: 270,
      chartType: ChartType.ring,
      ringStrokeWidth: 6,
      centerText: "80%",
      centerTextStyle: TextStyle(
          fontSize: 32.sp, color: AppColors.black, fontWeight: FontWeight.w200),
      legendOptions: const LegendOptions(
        showLegends: false,
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
      ),
    );
  }
}
