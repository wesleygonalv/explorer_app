import 'package:explorer_app/modules/shared/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Asset Widget 🗃️
class AssetItemWidget extends StatefulWidget {
  final String name;
  final AppIcon iconPrepend;
  final IconData? iconAppend;
  final Color? iconAppendColor;
  final Function()? onTap;
  final Widget? expandedWidget;

  const AssetItemWidget({
    super.key,
    required this.name,
    required this.iconPrepend,
    this.iconAppend,
    this.iconAppendColor,
    this.onTap,
    this.expandedWidget,
  });

  @override
  State<AssetItemWidget> createState() => _AssetItemWidgetState();
}

class _AssetItemWidgetState extends State<AssetItemWidget> {
  bool expandFlag = false;

  bool get _canExpandAction => widget.expandedWidget != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_canExpandAction) {
          if (mounted) {
            setState(() => expandFlag = !expandFlag);
          }
          widget.onTap?.call();
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15.w,
                child: _canExpandAction
                    ? Icon(
                        expandFlag
                            ? Icons.arrow_drop_down_sharp
                            : Icons.arrow_right_sharp,
                        color: Colors.grey,
                      )
                    : null,
              ),
              widget.iconPrepend,
              Flexible(
                child: Text(
                  widget.name,
                ),
              ),
              SizedBox(
                width: 15.w,
                child: widget.iconAppend == null
                    ? null
                    : Icon(
                        widget.iconAppend,
                        color: widget.iconAppendColor,
                      ),
              )
            ],
          ),
          if (expandFlag)
            Padding(
              padding: EdgeInsets.only(left: 0.05.sw),
              child: widget.expandedWidget,
            ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
