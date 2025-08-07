import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/constants/colors.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  DateTime? _selectedDate;
  bool _repeats = false;
  String? _selectedFrequency;

  final List<String> _frequencies = [
    'Weekly',
    'Biweekly',
    'Monthly',
    'Every Spring',
    'Every Summer',
    'Every Fall',
    'Every Winter',
    'Annually',
    'Biannually',
  ];
  final TextEditingController _taskNameController = TextEditingController(
    text: 'Task Name',
  );
  bool _isEditingTaskName = false;

  String get _dateText {
    if (_selectedDate == null) return '';
    return '${_selectedDate!.month.toString().padLeft(2, '0')}/'
        '${_selectedDate!.day.toString().padLeft(2, '0')}/'
        '${_selectedDate!.year}';
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgrey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                _isEditingTaskName
                    ? Expanded(
                        child: TextField(
                          controller: _taskNameController,
                          autofocus: true,
                          style: TextStyles.regular.copyWith(fontSize: 20.sp),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onSubmitted: (_) {
                            setState(() => _isEditingTaskName = false);
                          },
                        ),
                      )
                    : Text(
                        _taskNameController.text,
                        style: TextStyles.regular.copyWith(fontSize: 20.sp),
                      ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditingTaskName = true;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/add.svg',
                    width: 16.w,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: Colors.grey[400], thickness: 1, height: 1),
            SizedBox(height: 16.h),
            TextField(
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'mm/dd/yyyy',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: AppColors.lightgrey,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
              ),
              controller: TextEditingController(text: _dateText),
            ),

            SizedBox(height: 20.h),

            Row(
              children: [
                Checkbox(
                  value: _repeats,
                  activeColor: AppColors.primary,
                  onChanged: (bool? value) {
                    setState(() {
                      _repeats = value ?? false;
                      if (!_repeats) {
                        _selectedFrequency = null;
                      }
                    });
                  },
                ),
                Text(
                  'Repeats',
                  style: TextStyles.regular.copyWith(fontSize: 16.sp),
                ),
              ],
            ),

            if (_repeats)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Frequency',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedFrequency,
                      decoration: InputDecoration(
                        hintText: 'Value',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.r),
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 1.w,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                      ),
                      items: _frequencies
                          .map(
                            (freq) => DropdownMenuItem(
                              value: freq,
                              child: Text(freq),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            SizedBox(height: 40.h),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: TextStyles.regular.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyles.regular.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
