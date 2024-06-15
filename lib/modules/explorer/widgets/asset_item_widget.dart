import 'package:explorer_app/modules/shared/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Asset Widget 🗃️
class AssetItemWidget extends StatefulWidget {
  final String name;
  final AppIcon iconPrepend;
  final IconData iconAppend;
  final Function()? onTap;
  final Widget? expandedWidget;

  const AssetItemWidget({
    super.key,
    required this.name,
    required this.iconPrepend,
    required this.iconAppend,
    required this.onTap,
    required this.expandedWidget,
  });

  @override
  State<AssetItemWidget> createState() => _AssetItemWidgetState();
}

class _AssetItemWidgetState extends State<AssetItemWidget> {
  bool expandFlag = false;
  bool get _canExpandAction => widget.expandedWidget != null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_canExpandAction) {
          setState(() => expandFlag = !expandFlag);
        }
        widget.onTap?.call();
      },
      child: Row(
        children: [
          Column(
            children: [
              if (_canExpandAction)
                Icon(
                  expandFlag
                      ? Icons.arrow_drop_down_sharp
                      : Icons.arrow_right_sharp,
                ),
              widget.iconPrepend,
              Text(widget.name),
              Icon(widget.iconAppend),
            ],
          ),
          if (expandFlag)
            Padding(
              padding: EdgeInsets.only(right: 0.1.sw),
              child: widget.expandedWidget,
            )
        ],
      ),
    );
  }
}
