import 'package:collection/collection.dart';

enum FriendStatus {
  Friend,
  Pending,
  NotFriend,
}

enum Gender {
  Girl,
  Boy,
  Twins,
  DK,
}

enum Reaction {
  Like,
  Heart,
  LovelyEyes,
  Shock,
  Laugh,
  Sad,
  Angry,
}

enum Diaper {
  Wet,
  Dirty,
  Mixed,
  Dry,
}

enum SupportCategory {
  Question,
  Suggestion,
  Problem,
  Other,
}

enum CollaborationType {
  Products,
  Services,
}

enum DiscountType {
  Cash,
  Percent,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (FriendStatus):
      return FriendStatus.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (Reaction):
      return Reaction.values.deserialize(value) as T?;
    case (Diaper):
      return Diaper.values.deserialize(value) as T?;
    case (SupportCategory):
      return SupportCategory.values.deserialize(value) as T?;
    case (CollaborationType):
      return CollaborationType.values.deserialize(value) as T?;
    case (DiscountType):
      return DiscountType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
