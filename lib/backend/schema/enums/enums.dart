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
    default:
      return null;
  }
}
