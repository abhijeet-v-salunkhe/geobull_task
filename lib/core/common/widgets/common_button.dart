import 'package:flutter/cupertino.dart';
import 'package:geobull_task/core/constants/color_constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.child,
    this.width,
    this.height,
    required this.onTap,
    this.color,
  });

  final Widget? child;
  final double? width;
  final double? height;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? primaryColor,
        ),
        child: Center(
          child: Padding(padding: EdgeInsetsGeometry.all(15), child: child),
        ),
      ),
    );
  }
}
