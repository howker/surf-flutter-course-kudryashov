import 'package:flutter/material.dart';

/// моковые (тестовые) объекты для имитации интересных мест

import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_card.dart';

final List<Sight> mocks = [
  Sight(
      urlsImages: [
        'https://cdn.photosight.ru/img/8/2a2/6386165_large.jpg',
        'https://www.miroworld.ru/wp-content/uploads/2018/10/Astrahanskij-kreml.jpg',
        'https://wikiway.com/upload/resize_cache/hl-photo/437/628/1024_800_1/astrahanskiy_kreml_15.jpg',
        'https://wikiway.com/upload/hl-photo/20c/6f4/astrahanskiy_kreml_4.jpg',
      ],
      nameSights: 'Астраханский кремль',
      lat: 46.349540,
      lon: 48.030772,
      url: 'https://cdn.photosight.ru/img/8/2a2/6386165_large.jpg',
      details: 'Астраханский кремль',
      type: 'Музей'),
  Sight(
      nameSights: 'Ресторан  Белуга',
      lat: 46.354357,
      lon: 48.033053,
      url:
          'https://i1.photo.2gis.com/images/branch/8/1125899943872413_ffb7.jpg',
      details: 'славится своими рыбными блюдами',
      type: 'Ресторан'),
  Sight(
      nameSights: 'Ресторан  Пряности',
      lat: 46.352273,
      lon: 48.033619,
      url: 'https://fb.ru/misc/i/gallery/43527/3214514.jpg',
      details: 'Кухня: европейская, итальянская, японская',
      type: 'Ресторан'),
  Sight(
      nameSights: 'Ресторан  Брюнетка и браконьер',
      lat: 46.349953,
      lon: 48.041677,
      url:
          'https://avatars.mds.yandex.net/get-altay/1899727/2a0000016b902917279fc4dea94440130f4b/XXXL',
      details: 'Кухня:европейская, авторская, смешанная',
      type: 'Ресторан'),
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

const double userLat = 46.348838;
const double userLng = 48.029816;

List<Sight> sortedByRadius = [];

final List<Sight> mocksPhotos = [
  Sight(
      nameSights: 'Астраханский кремль',
      lat: 46.349540,
      lon: 48.030772,
      url: 'https://cdn.photosight.ru/img/8/2a2/6386165_large.jpg',
      details: 'Астраханский кремль',
      type: 'Музей'),
  Sight(
      nameSights: 'Ресторан  Белуга',
      lat: 46.354357,
      lon: 48.033053,
      url:
          'https://i1.photo.2gis.com/images/branch/8/1125899943872413_ffb7.jpg',
      details: 'славится своими рыбными блюдами',
      type: 'Ресторан'),
  Sight(
      nameSights: 'Ресторан  Пряности',
      lat: 46.352273,
      lon: 48.033619,
      url: 'https://fb.ru/misc/i/gallery/43527/3214514.jpg',
      details: 'Кухня: европейская, итальянская, японская',
      type: 'Ресторан'),
  Sight(
      nameSights: 'Ресторан  Брюнетка и браконьер',
      lat: 46.349953,
      lon: 48.041677,
      url:
          'https://avatars.mds.yandex.net/get-altay/1899727/2a0000016b902917279fc4dea94440130f4b/XXXL',
      details: 'Кухня:европейская, авторская, смешанная',
      type: 'Ресторан'),
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
];
