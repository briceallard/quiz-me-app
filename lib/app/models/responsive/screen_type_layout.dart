import 'package:flutter/widgets.dart';
import 'package:quiz_me_app/app/models/responsive/responsive_builder.dart';
import 'package:quiz_me_app/enums/device_type.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout(
      {Key key, @required this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceType == DeviceType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }

      if (sizingInformation.deviceType == DeviceType.Desktop) {
        if (desktop != null) {
          return desktop;
        }
      }

      return mobile;
    });
  }
}
