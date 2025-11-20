import 'package:device_info_plus/device_info_plus.dart';

class Utils {
  Utils._();

  static Future<String> getDeviceNameWithDeviceId() async {
    final deviceInfo = await DeviceInfoPlugin().deviceInfo;
    if (deviceInfo is AndroidDeviceInfo) {
      return '${deviceInfo.model} - ${deviceInfo.id}';
    } else if (deviceInfo is IosDeviceInfo) {
      return '${deviceInfo.model} - ${deviceInfo.identifierForVendor}';
    }
    return 'TempUserName-${DateTime.now().millisecondsSinceEpoch}'.trim();
  }
}
