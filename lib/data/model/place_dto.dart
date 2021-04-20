class PlaceDto {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<dynamic> urls;
  final String description;
  final double distance;

  PlaceDto(
    this.id,
    this.lat,
    this.lng,
    this.name,
    this.urls,
    this.description,
    this.distance,
  );

  PlaceDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        lat = json['lat'],
        lng = json['lng'],
        name = json['name'],
        urls = json['urls'],
        distance = json['distance'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['name'] = this.name;
    data['urls'] = this.urls;
    data['distance'] = this.distance;
    data['description'] = this.description;
    return data;
  }
}
