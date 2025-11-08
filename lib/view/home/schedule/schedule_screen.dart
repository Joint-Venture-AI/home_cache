import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/widget/task_tile_widget.dart';

import 'dialog/add_task_dialog.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Schedule',
                style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              _buildActionButtons(context),
              SizedBox(height: 24.h),
              Text(
                'Upcoming Tasks',
                style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12.h),
              _buildTaskList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: 30.w,
          height: 30.w,
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(122),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SvgPicture.asset(
            'assets/icons/download.svg',
            width: 16,
            height: 16,
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () => _showAddTaskDialog(context),
          child: Container(
            width: 30.w,
            height: 30.w,
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(122),
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SvgPicture.asset(
              'assets/icons/add.svg',
              width: 10.w,
              height: 10.w,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    if (_tasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks scheduled',
          style: AppTypoGraphy.regular.copyWith(color: Colors.grey),
        ),
      );
    }

    return Column(
      children: _tasks.map((task) {
        return TaskTileWidget(
          date: _formatDate(task.date),
          taskName: task.title,
          iconPath: task.iconPath,
          assignedTo: task.assignedTo,
          onDelete: () => _deleteTask(task.id),
        );
      }).toList(),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (_) => AddTaskDialog(
        onTaskAdded: (newTask) {
          setState(() {
            _tasks.add(newTask);
          });
        },
      ),
    );
  }

  void _deleteTask(String taskId) {
    setState(() {
      _tasks.removeWhere((task) => task.id == taskId);
    });
  }

  String _formatDate(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  String _getMonthName(int month) {
    return const [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ][month - 1];
  }
}

class Task {
  final String id;
  final String title;
  final DateTime date;
  final String iconPath;
  final String assignedTo;
  final bool repeats;
  final String? frequency;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.iconPath,
    required this.assignedTo,
    this.repeats = false,
    this.frequency,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.isCompleted = false,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // Helper method to format date
  String get formattedDate {
    return '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
  }

  // Convert to Map for storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'iconPath': iconPath,
      'assignedTo': assignedTo,
      'repeats': repeats,
      'frequency': frequency,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  // Create from Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      iconPath: map['iconPath'],
      assignedTo: map['assignedTo'],
      repeats: map['repeats'] ?? false,
      frequency: map['frequency'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  // Copy with method for immutability
  Task copyWith({
    String? id,
    String? title,
    DateTime? date,
    String? iconPath,
    String? assignedTo,
    bool? repeats,
    String? frequency,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      iconPath: iconPath ?? this.iconPath,
      assignedTo: assignedTo ?? this.assignedTo,
      repeats: repeats ?? this.repeats,
      frequency: frequency ?? this.frequency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
