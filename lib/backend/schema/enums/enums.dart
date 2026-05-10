import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum Role {
  User,
  Lucille,
}

enum Pronouns {
  HeHim,
  SheHer,
  TheyIs,
}

enum ExerciseDifficulty {
  Easy,
  Intermediate,
  Advanced,
}

enum LucilleMemories {
  Episodic,
  Semantic,
  Factual,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (Pronouns):
      return Pronouns.values.deserialize(value) as T?;
    case (ExerciseDifficulty):
      return ExerciseDifficulty.values.deserialize(value) as T?;
    case (LucilleMemories):
      return LucilleMemories.values.deserialize(value) as T?;
    default:
      return null;
  }
}
