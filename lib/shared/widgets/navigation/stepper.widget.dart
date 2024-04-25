import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class CustomStepper extends StatefulWidget {
  final int activeStep;
  final int steps;
  final double width;
  final double stepHeight;
  final Color? activeColor;
  final Color? defaultColor;

  const CustomStepper({
    super.key,
    required this.steps,
    required this.activeStep,
    this.stepHeight = 20.0,
    this.activeColor,
    this.defaultColor,
    this.width = 200,
  });

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeStep != widget.activeStep) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = widget.activeColor ?? kPrimaryColor;
    final Color defaultColor = widget.defaultColor ?? kBgGrayVisibility2;

    return SizedBox(
      width: widget.width.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.steps, (index) {
          final isCompleted = index < widget.activeStep;
          final isActive = index == widget.activeStep;

          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index < widget.steps - 1 ? 10 : 0),
              height: widget.stepHeight,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: isCompleted ? activeColor : defaultColor,
              ),
              child: isActive
                  ? AnimatedBuilder(
                      animation: _animation,
                      builder: (_, child) {
                        return Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: (1 - _animation.value) *
                                  (widget.width / widget.steps),
                              child: Container(
                                height: widget.stepHeight,
                                decoration: ShapeDecoration(
                                  shape: const StadiumBorder(),
                                  color: activeColor,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          );
        }),
      ),
    );
  }
}
