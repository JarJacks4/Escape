import "package:chat_u_i_kit_n2m29m/backend/schema/enums/enums.dart"
    as chat_u_i_kit_n2m29m_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum Role {
  User,
  Assistant,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (chat_u_i_kit_n2m29m_enums.MessageStatus):
      return chat_u_i_kit_n2m29m_enums.MessageStatus.values.deserialize(value)
          as T?;
    case (chat_u_i_kit_n2m29m_enums.AttachmentType):
      return chat_u_i_kit_n2m29m_enums.AttachmentType.values.deserialize(value)
          as T?;
    case (chat_u_i_kit_n2m29m_enums.Role):
      return chat_u_i_kit_n2m29m_enums.Role.values.deserialize(value) as T?;
    case (chat_u_i_kit_n2m29m_enums.UserStatus):
      return chat_u_i_kit_n2m29m_enums.UserStatus.values.deserialize(value)
          as T?;
    case (chat_u_i_kit_n2m29m_enums.MenuType):
      return chat_u_i_kit_n2m29m_enums.MenuType.values.deserialize(value) as T?;
    case (chat_u_i_kit_n2m29m_enums.FileExtension):
      return chat_u_i_kit_n2m29m_enums.FileExtension.values.deserialize(value)
          as T?;
    default:
      return null;
  }
}
