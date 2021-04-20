class PlacesFilterRequestDto {
  final double lat;
  final double lng;
  final double radius;
  final List<String> typeFilter;
  final String nameFilter;

  PlacesFilterRequestDto(
    this.lat,
    this.lng,
    this.radius,
    this.typeFilter,
    this.nameFilter,
  );
}
