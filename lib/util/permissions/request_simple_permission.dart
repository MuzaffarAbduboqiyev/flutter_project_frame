import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission({
  required Permission permissionType,
}) async {
  var permission = await permissionType.status;

  if (permission != PermissionStatus.granted) {
    await permissionType.request();
    permission = await permissionType.status;
  }

  return permission == PermissionStatus.granted;
}
