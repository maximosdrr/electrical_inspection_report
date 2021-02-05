import 'package:ext_storage/ext_storage.dart';

Future<String> getDownloadPath() async {
  return ExtStorage.getExternalStoragePublicDirectory(
    ExtStorage.DIRECTORY_DOWNLOADS,
  );
}
