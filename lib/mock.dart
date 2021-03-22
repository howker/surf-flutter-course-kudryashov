/// моковые (тестовые) объекты для имитации интересных мест

import 'package:places/domain/sight.dart';

final List<Sight> mocks = [
  Sight(
      nameSights: 'Чёрная дыра',
      lat: 38.858780,
      lon: 111.603179,
      url: 'https://joy-pup.com/wp-content/uploads/2019/03/hole_china.jpg',
      details: 'Пугающая черная дыра в Китае',
      type: 'необычное место'),
  Sight(
      nameSights: 'Гигантский смартфон в Омске',
      lat: 55.015528,
      lon: 73.425028,
      url: 'https://joy-pup.com/wp-content/uploads/2019/03/smartphone_omsk.jpg',
      details: 'Гигантский смартфон в Омске Российской Федерации',
      type: 'необычное место'),
  Sight(
      nameSights: 'Кладбище кораблей',
      lat: 51.285025,
      lon: 30.212353,
      url: 'https://joy-pup.com/wp-content/uploads/2019/03/ship_chernobil.jpg',
      details: 'Кладбище кораблей в городе Чернобыль Киевской области, Украина',
      type: 'необычное место'),
  Sight(
      nameSights: 'Астраханский кремль',
      lat: 46.349540,
      lon: 48.030772,
      url: 'https://cdn.photosight.ru/img/8/2a2/6386165_large.jpg',
      details: 'Астраханский кремль',
      type: 'Музей'),
];

Map filters = {
  'Отель': false,
  'Ресторан': false,
  'Особое место': false,
  'Парк': false,
  'Музей': false,
  'Кафе': false,
};

Map placesCategory = {
  'Кинотеатр': false,
  'Ресторан': false,
  'Особое место': false,
  'Театр': false,
  'Музей': false,
  'Кафе': false,
};

List searchHistory = [];
