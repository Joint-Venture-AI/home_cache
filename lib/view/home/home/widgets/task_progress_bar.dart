import 'package:flutter/material.dart';

class HomeHealthScore extends StatelessWidget {
  final int percentage;
  final String subtitle;

  const HomeHealthScore(
      {super.key, required this.percentage, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 10,
                backgroundColor: Colors.grey[200],
                color: Color(0xFF1d545d),
                // valueColor: Color(0xFF1d545d),
              ),
            ),
            Column(
              children: [
                Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1d545d),
                    // color:getColorForPercentage(),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1d545d),
                    // color:getColorForPercentage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
