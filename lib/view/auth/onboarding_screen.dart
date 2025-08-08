import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/animation_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const AnimatedHCLogo(
                  //   size: 200,
                  //   houseColor: Color(0xFF2D5A5A),
                  //   checkmarkColor: Color(0xFFFF4444),
                  // ),

                  // TestScreen(),

                  AnimatedCheckmarkWidget(),

                  SizedBox(height: 32.h),
                  Image.asset('assets/logos/tagline.png', height: 50.h),
                  SizedBox(height: 48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Column(
                      children: [
                        TextButtonWidgetLight(
                          text: 'Sign Up',
                          onPressed: () => Get.toNamed(AppRoutes.signup),
                        ),
                        SizedBox(height: 15.h),
                        TextWidgetButton(
                          text: 'Log In',
                          onPressed: () => Get.toNamed(AppRoutes.login),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedHCLogo extends StatefulWidget {
  final double size;
  final Color houseColor;
  final Color checkmarkColor;

  const AnimatedHCLogo({
    super.key,
    required this.size,
    required this.houseColor,
    required this.checkmarkColor,
  });

  @override
  State<AnimatedHCLogo> createState() => _AnimatedHCLogoState();
}

class _AnimatedHCLogoState extends State<AnimatedHCLogo>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _drawController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _drawAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _drawController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _drawAnimation = CurvedAnimation(
      parent: _drawController,
      curve: Curves.easeInOut,
    );

    _startLoop();
  }

  void _startLoop() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 300));
      await _fadeController.forward();
      await _drawController.forward();
      await Future.delayed(const Duration(seconds: 1));
      _fadeController.reset();
      _drawController.reset();
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _drawController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size * 1.5,
      child: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _drawAnimation]),
        builder: (context, _) {
          return CustomPaint(
            painter: HCLogoPainter(
              fadeValue: _fadeAnimation,
              drawValue: _drawAnimation,
              houseColor: widget.houseColor,
              checkmarkColor: widget.checkmarkColor,
            ),
          );
        },
      ),
    );
  }
}

class HCLogoPainter extends CustomPainter {
  final Animation<double> fadeValue;
  final Animation<double> drawValue;
  final Color houseColor;
  final Color checkmarkColor;

  HCLogoPainter({
    required this.fadeValue,
    required this.drawValue,
    required this.houseColor,
    required this.checkmarkColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    // Draw house roof
    paint.color = houseColor;
    final roofPath = Path()
      ..moveTo(size.width * 0.22, size.height * 0.55)
      ..lineTo(size.width * 0.5, size.height * 0.15)
      ..lineTo(size.width * 0.7, size.height * 0.35);
    canvas.drawPath(roofPath, paint);

    // Draw HC text
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'HC',
        style: TextStyle(
          color: houseColor,
          fontSize: size.width * 0.20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final textOffset = Offset(
      (size.width - textPainter.width) / 2,
      size.height * 0.4,
    );
    textPainter.paint(canvas, textOffset);

    final fadedPaint = Paint()
      ..color = checkmarkColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final container1 = Path()
      ..moveTo(size.width * 0.3, size.height * 0.7)
      ..lineTo(size.width * 0.48, size.height * 0.85);
    final container2 = Path()
      ..moveTo(size.width * 0.48, size.height * 0.85)
      ..lineTo(size.width * 0.7, size.height * 0.54);

    canvas.drawPath(container1, fadedPaint);
    canvas.drawPath(container2, fadedPaint);

    final animatedPaint = Paint()
      ..color = checkmarkColor.withOpacity(fadeValue.value)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final container1Progress = drawValue.value.clamp(0.0, 0.5) * 2;
    final container2Progress = (drawValue.value - 0.5).clamp(0.0, 0.5) * 2;

    if (drawValue.value <= 0.5) {
      final metric = container1.computeMetrics().first;
      canvas.drawPath(metric.extractPath(0, metric.length * container1Progress),
          animatedPaint);
    } else {
      canvas.drawPath(container1, animatedPaint);
      final metric = container2.computeMetrics().first;
      canvas.drawPath(metric.extractPath(0, metric.length * container2Progress),
          animatedPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
