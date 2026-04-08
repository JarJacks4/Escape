// Example of your custom TikTokDataModel class
class TikTokDataModel {
  final String? video; // If this is an ID or reference, not the URL
  final List<String>? likes;
  final List<String>? bookmark;
  final int? id;
  final String? urlvideo; // This is the actual video URL
  final String? userPicture;
  final String? profilename;

  TikTokDataModel({
    this.video,
    this.likes,
    this.bookmark,
    this.id,
    this.urlvideo,
    this.userPicture,
    this.profilename,
  });

  // You might have a factory constructor here to parse JSON if coming from an API
  factory TikTokDataModel.fromJson(Map<String, dynamic> json) {
    return TikTokDataModel(
      video: json['video'] as String?,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bookmark: (json['bookmark'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as int?,
      urlvideo: json['urlvideo'] as String?,
      userPicture: json['userPicture'] as String?,
      profilename: json['profilename'] as String?,
    );
  }
}
