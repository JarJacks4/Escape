import 'package:flutter/rendering.dart' show ScrollDirection;
import 'package:flutter/services.dart' show TextInputType;
import 'package:flutter/widgets.dart'
    show CrossAxisAlignment, MainAxisAlignment, MainAxisSize;

/// Which way a scrollable is moving.
///
/// Named for the ends of the list rather than for the screen: "up" and "down"
/// are wrong on a horizontal list, and Flutter's own [ScrollDirection] is named
/// for where the content travels relative to offset zero, so its `reverse`
/// means the user is scrolling *down* a normal list.
enum FFScrollDirection {
  /// Nothing has scrolled yet, or the list has come to rest.
  idle,

  /// Moving back towards the first item — scrolling up on a normal list.
  towardStart,

  /// Moving on towards the last item — scrolling down on a normal list.
  towardEnd,
}

extension FFScrollDirectionFromFlutter on ScrollDirection {
  /// This Flutter scroll direction as the FlutterFlow one.
  ///
  /// [ScrollDirection.forward] means the content is heading back towards offset
  /// zero, which is the user travelling towards the start of the list, and
  /// [ScrollDirection.reverse] is the opposite. The names invert here; that
  /// inversion is the reason this enum exists.
  FFScrollDirection get ffScrollDirection => switch (this) {
        ScrollDirection.idle => FFScrollDirection.idle,
        ScrollDirection.forward => FFScrollDirection.towardStart,
        ScrollDirection.reverse => FFScrollDirection.towardEnd,
      };
}

enum FFMainAxisSize { min, max }

extension FFMainAxisSizeToFlutter on FFMainAxisSize {
  MainAxisSize get flutterValue => switch (this) {
        FFMainAxisSize.min => MainAxisSize.min,
        FFMainAxisSize.max => MainAxisSize.max,
      };
}

enum FFMainAxisAlignment {
  start,
  center,
  end,
  spaceAround,
  spaceEvenly,
  spaceBetween,
}

extension FFMainAxisAlignmentToFlutter on FFMainAxisAlignment {
  MainAxisAlignment get flutterValue => switch (this) {
        FFMainAxisAlignment.start => MainAxisAlignment.start,
        FFMainAxisAlignment.center => MainAxisAlignment.center,
        FFMainAxisAlignment.end => MainAxisAlignment.end,
        FFMainAxisAlignment.spaceAround => MainAxisAlignment.spaceAround,
        FFMainAxisAlignment.spaceEvenly => MainAxisAlignment.spaceEvenly,
        FFMainAxisAlignment.spaceBetween => MainAxisAlignment.spaceBetween,
      };
}

enum FFCrossAxisAlignment { start, center, end, stretch, baseline }

extension FFCrossAxisAlignmentToFlutter on FFCrossAxisAlignment {
  CrossAxisAlignment get flutterValue => switch (this) {
        FFCrossAxisAlignment.start => CrossAxisAlignment.start,
        FFCrossAxisAlignment.center => CrossAxisAlignment.center,
        FFCrossAxisAlignment.end => CrossAxisAlignment.end,
        FFCrossAxisAlignment.stretch => CrossAxisAlignment.stretch,
        FFCrossAxisAlignment.baseline => CrossAxisAlignment.baseline,
      };
}

enum FFKeyboardType {
  text,
  multiline,
  number,
  decimal,
  signedDecimal,
  phone,
  dateTime,
  emailAddress,
  url,
  visiblePassword,
  name,
  streetAddress,
}

extension FFKeyboardTypeToFlutter on FFKeyboardType {
  TextInputType get flutterValue => switch (this) {
        FFKeyboardType.text => TextInputType.text,
        FFKeyboardType.multiline => TextInputType.multiline,
        FFKeyboardType.number => TextInputType.number,
        FFKeyboardType.decimal =>
          const TextInputType.numberWithOptions(decimal: true),
        FFKeyboardType.signedDecimal =>
          const TextInputType.numberWithOptions(signed: true, decimal: true),
        FFKeyboardType.phone => TextInputType.phone,
        FFKeyboardType.dateTime => TextInputType.datetime,
        FFKeyboardType.emailAddress => TextInputType.emailAddress,
        FFKeyboardType.url => TextInputType.url,
        FFKeyboardType.visiblePassword => TextInputType.visiblePassword,
        FFKeyboardType.name => TextInputType.name,
        FFKeyboardType.streetAddress => TextInputType.streetAddress,
      };
}
