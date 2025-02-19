
import 'package:flutter/material.dart';
import 'package:offiql/Extension/theme.dart';
import 'package:offiql/Utils/customize_style.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatefulWidget {
  final int itemCount;
  final Color color;

  const ListShimmer({super.key, required this.itemCount, Color? color})
      : color = color ?? const Color(0xFF2B2F33);

  @override
  State<ListShimmer> createState() => _ListShimmerState();
}

class _ListShimmerState extends State<ListShimmer>
    with SingleTickerProviderStateMixin {
  OffiqlCustomizeStyle appStyle = OffiqlCustomizeStyle();
  late AnimationController _animationController;
  int animationIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    animationIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: widget.color,
          highlightColor: context.isDarkMode ? Colors.white10 : Colors.black12,
          period: Duration(seconds: 5),
          child: AnimatedEntryWidget(
            beginOffset: calculateSlideOffset(2),
            endOffset: calculateSlideOffset(0),
            controller: _animationController,
            index: inAnimatedIndex(),
            delayFactor: 1 / (2 * widget.itemCount),
            totalChildren: widget.itemCount,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: appStyle.sizes.horizontalBlockSize * 2,
                  left: appStyle.sizes.horizontalBlockSize * 4,
                  right: appStyle.sizes.horizontalBlockSize * 4),
              padding: appStyle.offiqlAllScreenPadding(ver: 4),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.color,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    appStyle.sizes.horizontalBlockSize * 6,
                  )),
              child: Row(
                spacing: appStyle.sizes.horizontalBlockSize * 4,
                children: [
                  Container(
                    width: appStyle.sizes.horizontalBlockSize * 12,
                    height: appStyle.sizes.horizontalBlockSize * 12,
                    decoration: BoxDecoration(
                        color: widget.color.withValues(alpha: 0.5),
                        shape: BoxShape.circle),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: appStyle.sizes.horizontalBlockSize * 4,
                          children: [
                            Container(
                              height: appStyle.sizes.horizontalBlockSize * 4,
                              width: constraints.maxWidth * 0.9,
                              decoration: BoxDecoration(
                                color: widget.color.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(
                                    appStyle.sizes.horizontalBlockSize * 1.5),
                              ),
                            ),
                            Container(
                              height: appStyle.sizes.horizontalBlockSize * 2,
                              width: constraints.maxWidth * 0.5,
                              decoration: BoxDecoration(
                                color: widget.color.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(
                                    appStyle.sizes.horizontalBlockSize * 0.8),
                              ),
                            ),
                            Container(
                              height: appStyle.sizes.horizontalBlockSize * 2,
                              width: constraints.maxWidth * 0.6,
                              decoration: BoxDecoration(
                                color: widget.color.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(
                                    appStyle.sizes.horizontalBlockSize * 0.8),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: widget.color,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Offset calculateSlideOffset(int index) {
    if (index == 0) {
      // From Top
      return const Offset(0, -10);
    } else if (index == 1) {
      // From Right
      return const Offset(2, 0);
    } else if (index == 2) {
      // From Bottom
      return const Offset(0, 20);
    } else if (index == 3) {
      // From Left
      return const Offset(-2, 0);
    } else {
      return const Offset(-1, 0);
    }
  }

  int inAnimatedIndex() {
    return animationIndex++;
  }
}

class AnimatedEntryWidget extends StatelessWidget {
  final int totalChildren;
  final Offset beginOffset;
  final Offset endOffset;
  final AnimationController controller;
  final int index;
  final double delayFactor;
  final Widget child;
  final holdDuration = 0.5;
  final exitDelayFactor = 0.1;
  final slowExitDuration = 1.0;

  const AnimatedEntryWidget({
    super.key,
    required this.beginOffset,
    required this.controller,
    required this.index,
    required this.child,
    this.delayFactor = 0.05,
    required this.totalChildren,
    required this.endOffset,
  });

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> offsetAnimation = TweenSequence<Offset>([
      // Entrance animation
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: beginOffset,
          // Enter from this offset (e.g., below, left, etc.)
          end: Offset.zero, // Hold at the center
        ).chain(CurveTween(curve: Curves.easeInOut)), // Slow, smooth entrance
        weight: 5,
      ),
      // Hold position (the item stays in the center for 2 seconds)
      TweenSequenceItem(
        tween: ConstantTween<Offset>(Offset.zero),
        // No movement, holding at center
        weight:
        totalChildren + (delayFactor * (index + 1)), // Hold for 2 seconds
      ),
      // Exit animation (with slow, smooth exit)
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero, // Start exiting from center
          end: endOffset, // End at exit position (e.g., above, right, etc.)
        ).chain(CurveTween(curve: Curves.easeInOut)), // Slow exit
        weight: 5, // Exit with the same duration as entrance
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          // Delay the entrance based on the child's index
          (delayFactor * index).clamp(0.0, 1.0),
          // Ensure that all elements enter first, then hold for 2 seconds, then exit
          (delayFactor * index + 1).clamp(0.0, 1.0),
          curve: Curves.linear,
        ),
      ),
    );

// Additional logic to control exit one-by-one after holding
    Future.delayed(Duration(milliseconds: (exitDelayFactor * index).round()),
            () {
          // Trigger the exit animation for each item one-by-one
          controller.repeat();
        });

    // Animation for fading in
    final Animation<double> fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          (delayFactor * index).clamp(0.0, 1.0),
          (delayFactor * (index + 1)).clamp(0.0, 1.0),
          curve: Curves.linear,
        ),
      ),
    );
    final Animation<double> scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          (delayFactor * index).clamp(0.0, 1.0),
          (delayFactor * (index + 1)).clamp(0.0, 1.0),
          curve: Curves.linear,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}