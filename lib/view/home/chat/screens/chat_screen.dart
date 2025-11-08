import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _charTEController = TextEditingController();
  final List<ChatMessage> _messages = [];
  // late stt.SpeechToText _speech;
  bool _isListening = false;

  bool _hasTextWritten = false;

  @override
  void initState() {
    super.initState();
    // _speech = stt.SpeechToText();

    _messages.addAll([
      ChatMessage(text: 'Should I service my HVAC system?', isMe: true),
      ChatMessage(
        text:
            'It’s recommended to service your HVAC system at least once a year to ensure it runs efficiently and to prolong its lifespan.',
        isMe: false,
      ),
      ChatMessage(text: 'Should I service my HVAC system?', isMe: true),
    ]);

    _charTEController.addListener(
      () {
        if (_charTEController.text.isEmpty) {
          if (_hasTextWritten) {
            setState(() {
              _hasTextWritten = false;
            });
          }
        } else {
          if (!_hasTextWritten) {
            setState(() {
              _hasTextWritten = true;
            });
          }
        }
      },
    );
  }

  void _sendMessage() {
    final text = _charTEController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isMe: true));
      _charTEController.clear();
    });
  }

  @override
  void dispose() {
    _charTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
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
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                                softWrap: true,
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
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _charTEController,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 16.w,
                          ),
                          hintText: 'Type or say your question...',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (_hasTextWritten)
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/uparrow.svg',
                          color: AppColors.black,
                          height: 20.h,
                        ),
                        onPressed: _sendMessage,
                      ),
                    if (!_hasTextWritten)
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/mics.svg',
                          color: _isListening
                              ? AppColors.primary
                              : AppColors.black,
                          height: 20.h,
                        ),
                        onPressed: () {},
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
