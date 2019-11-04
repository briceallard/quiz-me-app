import 'package:flutter/widgets.dart';
import 'package:quiz_me_app/enums/device_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation: $orientation \nDeviceType: $deviceType \nScreen Size: $screenSize \nLocalWidget Size: $localWidgetSize';
  }
}
