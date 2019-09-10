class ApiResponse {
  String url;
  String copyright;
  String copyrightLink;

  ApiResponse({this.url, this.copyright, this.copyrightLink});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      url: json['url'],
      copyright: json['copyright'],
      copyrightLink: json['copyright_link'],
    );
  }
}
