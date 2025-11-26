import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  const RoundedSearchBar({super.key, this.controller});

  @override
  State<RoundedSearchBar> createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  late final TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    _internalController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _internalController,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          if (_internalController.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                _internalController.clear();
              },
              child: Icon(Icons.close, size: 20.sp),
            ),
        ],
      ),
    );
  }
}
