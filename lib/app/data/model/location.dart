class Location {
  late double latitude;
  late double longitude;
  late String location;

  Location({latitude, longitude, location}) {
    this.latitude = latitude;
    this.longitude = longitude;
    this.location = location;
  }

  Location.fromJson(Map<String, dynamic> json) {
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;

    return data;
  }
}
