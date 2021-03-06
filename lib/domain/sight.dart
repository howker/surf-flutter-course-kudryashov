/// Модель данных интересных мест
class Sight {
  final String nameSights;
  final double lat, lon;
  final String url;
  final String details;
  final String type;
  final List<dynamic> urlsImages;
  final int id;

  Sight({
    this.nameSights,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
    this.urlsImages,
    this.id,
  });
}
