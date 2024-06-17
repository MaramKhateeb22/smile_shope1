
import 'package:flutter/cupertino.dart';

class slidingText extends StatelessWidget {
  const slidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_) {
        return SlideTransition(
            position: slidingAnimation,
            child: const Text('welcome you in My app',
            textAlign: TextAlign.center,));
      }
    );
  }
}
