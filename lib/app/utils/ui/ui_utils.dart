import 'package:flutter/widgets.dart';
import 'package:quiz_me_app/enums/device_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceType.Tablet;
  }

  return DeviceType.Mobile;
}
