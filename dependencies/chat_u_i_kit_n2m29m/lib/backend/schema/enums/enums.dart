import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum MessageStatus {
  SENT,
  DELIVERED,
  READ,
}

enum AttachmentType {
  IMAGE,
  VIDEO,
  FILE,
}

enum Role {
  USER,
  AI,
  SYSTEM,
}

enum UserStatus {
  ONLINE,
  OFFLINE,
  TYPING,
}

enum MenuType {
  Camera,
  Gallery,
  Video,
}

enum FileExtension {
  PDF,
  DOC,
  ZIP,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MessageStatus):
      return MessageStatus.values.deserialize(value) as T?;
    case (AttachmentType):
      return AttachmentType.values.deserialize(value) as T?;
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (UserStatus):
      return UserStatus.values.deserialize(value) as T?;
    case (MenuType):
      return MenuType.values.deserialize(value) as T?;
    case (FileExtension):
      return FileExtension.values.deserialize(value) as T?;
    default:
      return null;
  }
}
