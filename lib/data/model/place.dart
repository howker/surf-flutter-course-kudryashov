class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<dynamic> urls;
  final String placeType;
  final String description;

  Place(
    this.id,
    this.lat,
    this.lng,
    this.name,
    this.urls,
    this.description,
    this.placeType,
  );
}
