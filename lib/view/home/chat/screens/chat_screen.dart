import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/controller/chat_controller.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Chat messages
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller
                        .messages[controller.messages.length - 1 - index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Align(
                        alignment: message.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: message.isMe
                                ? AppColors.primary
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: message.isMe
                              ? Text(
                                  message.text,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.h),
                                      child: Image.asset(
                                        'assets/images/outline.png',
                                        width: 24.r,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      message.text,
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.black),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            // Input field
            SafeArea(
              child: Obx(() {
                bool hasText = controller.inputText.value.isNotEmpty;
                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.textController,
                            onChanged: controller.updateInput,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Type or say your question...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 16.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        if (hasText)
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/uparrow.svg',
                              color: AppColors.black,
                              height: 20.h,
                            ),
                            onPressed: controller.sendMessage,
                          )
                        else
                          Obx(() => controller.isLoading.value
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                )
                              : IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/mics.svg',
                                    color: AppColors.black,
                                    height: 20.h,
                                  ),
                                  onPressed: () {},
                                )),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
