import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late int _selectedYear;
  late int _selectedMonth;

  final List<String> _months = List.generate(
      12, (index) => DateFormat('MMM').format(DateTime(0, index + 1)));
  final List<int> _years = List.generate(101, (index) => 1975 + index);

  @override
  void initState() {
    super.initState();
    _selectedYear = _focusedDay.year;
    _selectedMonth = _focusedDay.month;
  }

  void _updateFocusedDay() {
    setState(() {
      _focusedDay = DateTime(_selectedYear, _selectedMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Calendar',
                style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  DropdownButton<String>(
                    value: _months[_selectedMonth - 1],
                    items: _months
                        .map((month) => DropdownMenuItem(
                              value: month,
                              child: Text(
                                month,
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.black),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedMonth = _months.indexOf(value) + 1;
                          _updateFocusedDay();
                        });
                      }
                    },
                    underline: const SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp),
                  ),
                  Spacer(),
                  DropdownButton<int>(
                    value: _selectedYear,
                    items: _years
                        .map((year) => DropdownMenuItem(
                              value: year,
                              child: Text(
                                year.toString(),
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.black),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedYear = value;
                          _updateFocusedDay();
                        });
                      }
                    },
                    underline: const SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              TableCalendar(
                firstDay: DateTime.utc(1975, 1, 1),
                lastDay: DateTime.utc(2075, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _selectedYear = focusedDay.year;
                    _selectedMonth = focusedDay.month;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                    _selectedYear = focusedDay.year;
                    _selectedMonth = focusedDay.month;
                  });
                },
                headerVisible: false,
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
