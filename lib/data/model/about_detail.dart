class AboutDetail {
  final String instagramLink;
  final String mapLink;
  final String webText;
  final String androidText;
  final String phoneNumber;
  final String email;
  final String address;
  final String headerText;
  final String imageUrl;

  AboutDetail(
    this.instagramLink,
    this.mapLink,
    this.androidText,
    this.webText,
    this.phoneNumber,
    this.email,
    this.address,
    this.headerText,
    this.imageUrl,
  );

  factory AboutDetail.fromJson(Map<String, dynamic> json) {
    return AboutDetail(
      json['instagram_link'],
      json['map_link'],
      json['android_text'],
      json['web_text'],
      json['phone_number'],
      json['email'],
      json['address'],
      json['header'],
      json['image'],
    );
  }
}
