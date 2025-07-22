import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _cloudDownloadFamily = 'CloudDownload';
  static const String _readMessageFamily = 'ReadMessage';
  static const String _fileZipFamily = 'FileZip';
  static const String _fileIconFamily = 'FileIcon';
  static const String _aiLogoFamily = 'AiLogo';

  // cloud-download
  static const IconData kcloudDownload = IconData(0xe000,
      fontFamily: _cloudDownloadFamily, fontPackage: "chat_u_i_kit_n2m29m");

  // read-message
  static const IconData kreadMessage = IconData(0xe000,
      fontFamily: _readMessageFamily, fontPackage: "chat_u_i_kit_n2m29m");

  // file-zip
  static const IconData kfileZip = IconData(0xe000,
      fontFamily: _fileZipFamily, fontPackage: "chat_u_i_kit_n2m29m");

  // file-icon
  static const IconData kfileIcon = IconData(0xe000,
      fontFamily: _fileIconFamily, fontPackage: "chat_u_i_kit_n2m29m");

  // ai_logo
  static const IconData kaiLogo = IconData(0xe000,
      fontFamily: _aiLogoFamily, fontPackage: "chat_u_i_kit_n2m29m");
}
