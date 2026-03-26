import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum ActionPaneMotion {
  scroll,
  behind,
  drawer,
  stretch,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ActionPaneMotion):
      return ActionPaneMotion.values.deserialize(value) as T?;
    default:
      return null;
  }
}
