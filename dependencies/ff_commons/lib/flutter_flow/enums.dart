import 'package:collection/collection.dart';
    extension FFEnumExtensions<T extends Enum> on T {
    String serialize() => name;
  }

  extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
    T? deserialize(String? value) =>
        firstWhereOrNull((e) => e.serialize() == value);
  }
  
  