// Модель данных интересных мест

class Sight {
  final String nameSights;
  final double lat, lon;
  final String url;
  final String details;
  final String type;

  Sight({
    this.nameSights,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
  });
}
