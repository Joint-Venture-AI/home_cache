// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TestScreen extends StatefulWidget {
//   final Color backgroundColor;
//   final Color foregroundColor;
//   final Duration duration;
//   final Duration delay;
//   final double width;
//   final double height;
//   final double thickness;

//   const TestScreen({
//     super.key,
//     this.foregroundColor = Colors.red,
//     this.backgroundColor = Colors.orange,
//     this.duration = const Duration(milliseconds: 3000),
//     this.delay = const Duration(milliseconds: 500),
//     this.width = 215,
//     this.height = 120,
//     this.thickness = 15,
//   });

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   bool _smallBarLoad = false;
//   bool _longBarLoad = false;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(milliseconds: widget.delay.inMilliseconds), () {
//       setState(() {
//         _smallBarLoad = true;
//       });
//     });

//     Future.delayed(
//       Duration(
//         milliseconds: widget.delay.inMilliseconds +
//             (widget.duration.inMilliseconds / 3).toInt(),
//       ),
//       () {
//         setState(() {
//           _longBarLoad = true;
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: Center(
//         child: Container(
//           width: widget.width,
//           height: widget.height,
//           color: Colors.blue,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 width: widget.thickness,
//                 height: widget.height,
//                 color: widget.backgroundColor,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AnimatedContainer(
//                       duration: Duration(
//                         milliseconds:
//                             (widget.duration.inMilliseconds / 3).toInt(),
//                       ),
//                       width: 15.w,
//                       height: _smallBarLoad ? widget.height : 0,
//                       color: widget.foregroundColor,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: widget.width - widget.thickness,
//                 height: widget.thickness,
//                 color: widget.backgroundColor,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     AnimatedContainer(
//                       duration: Duration(
//                         milliseconds:
//                             ((widget.duration.inMilliseconds / 3) * 2).toInt(),
//                       ),
//                       width: _longBarLoad ? widget.width - widget.thickness : 0,
//                       height: widget.thickness,
//                       color: widget.foregroundColor,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedCheckmarkWidget extends StatefulWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Duration duration;
  final Duration delay;
  final double width;
  final double height;
  final double thickness;
  final bool autoStart;
  final VoidCallback? onAnimationComplete;
  final bool loop;
  final Duration loopDelay;

  const AnimatedCheckmarkWidget({
    super.key,
    this.foregroundColor = Colors.red,
    this.backgroundColor = Colors.orange,
    this.duration = const Duration(milliseconds: 3000),
    this.delay = const Duration(milliseconds: 500),
    this.width = 215,
    this.height = 120,
    this.thickness = 15,
    this.autoStart = true,
    this.onAnimationComplete,
    this.loop = false,
    this.loopDelay = const Duration(milliseconds: 1000),
  });

  @override
  State<AnimatedCheckmarkWidget> createState() =>
      _AnimatedCheckmarkWidgetState();
}

class _AnimatedCheckmarkWidgetState extends State<AnimatedCheckmarkWidget> {
  bool _smallBarLoad = false;
  bool _longBarLoad = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    if (widget.autoStart) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    if (_isAnimating) return;

    setState(() {
      _isAnimating = true;
      _smallBarLoad = false;
      _longBarLoad = false;
    });

    // Start small bar animation
    Future.delayed(Duration(milliseconds: widget.delay.inMilliseconds), () {
      if (mounted) {
        setState(() {
          _smallBarLoad = true;
        });
      }
    });

    // Start long bar animation
    Future.delayed(
      Duration(
        milliseconds: widget.delay.inMilliseconds +
            (widget.duration.inMilliseconds / 3).toInt(),
      ),
      () {
        if (mounted) {
          setState(() {
            _longBarLoad = true;
          });
        }
      },
    );

    // Animation complete
    Future.delayed(
      Duration(
        milliseconds:
            widget.delay.inMilliseconds + widget.duration.inMilliseconds,
      ),
      () {
        if (mounted) {
          setState(() {
            _isAnimating = false;
          });
          widget.onAnimationComplete?.call();

          // Loop if enabled
          if (widget.loop) {
            Future.delayed(widget.loopDelay, () {
              if (mounted) {
                _startAnimation();
              }
            });
          }
        }
      },
    );
  }

  void startAnimation() {
    _startAnimation();
  }

  void resetAnimation() {
    setState(() {
      _smallBarLoad = false;
      _longBarLoad = false;
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 5.0,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Vertical bar container
            Container(
              width: widget.thickness,
              height: widget.height,
              color: widget.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds:
                          (widget.duration.inMilliseconds / 3).toInt(),
                    ),
                    width: widget.thickness,
                    height: _smallBarLoad ? widget.height : 0,
                    color: widget.foregroundColor,
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
            ),
            // Horizontal bar container
            Container(
              width: widget.width - widget.thickness,
              height: widget.thickness,
              color: widget.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds:
                          ((widget.duration.inMilliseconds / 3) * 2).toInt(),
                    ),
                    width: _longBarLoad ? widget.width - widget.thickness : 0,
                    height: widget.thickness,
                    color: widget.foregroundColor,
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
