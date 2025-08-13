import 'package:flutter/material.dart';
import 'breadcrumb_item.dart';

class DynamicBreadcrumbs extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Widget separator;
  final TextStyle? textStyle;
  final TextStyle? hoverTextStyle;

  const DynamicBreadcrumbs({
    super.key,
    required this.items,
    this.separator = const Text(' > '),
    this.textStyle,
    this.hoverTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> breadcrumbWidgets = [];

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final isLast = i == items.length - 1;

      breadcrumbWidgets.add(
        MouseRegion(
          cursor: item.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
          child: GestureDetector(
            onTap: item.onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade200
              ),
              child: Text(
                item.title,
                style: isLast
                    ? textStyle ?? DefaultTextStyle.of(context).style.copyWith(fontSize: 16, fontWeight: FontWeight.w400)
                    : (textStyle ?? DefaultTextStyle.of(context).style.copyWith( color: Colors.blue, fontSize: 16)),
              ),
            ),
          ),
        ),
      );

      if (!isLast) {
        breadcrumbWidgets.add(separator);
      }
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: breadcrumbWidgets,
    );
  }
}
