import 'package:places/data/model/place.dart';

/// имитация локального хранилища
class LocalStorage {
  LocalStorage._();

  static List<Place> cachePlaces = [];

  static List<Place> favoritesPlaces = [
    Place(
      id: 134,
      lat: 55.988344,
      lng: 37.608042,
      name: 'Часовня Смоленской иконы Божией Матери в Чиверево',
      urls: [
        'https://sobory.ru/pic/09160/09168_20081121_230953.jpg',
        'https://picsum.photos/1000/600?random=1',
        'https://picsum.photos/1000/600?random=2',
        'https://picsum.photos/1000/600?random=3',
        'https://picsum.photos/1000/600?random=4',
        'https://picsum.photos/1000/600?random=5',
        'https://picsum.photos/1000/600?random=6'
      ],
      placeType: 'other',
      description:
          'Первая деревянная часовня здесь была построена в 1844 году. Впоследствии она сгорела и на ее месте в 1902 году по проекту епархиального архитектора Николая Николаевича Благовещенского была построена кирпичная часовня.',
    ),
    Place(
      id: 136,
      lat: 55.993677,
      lng: 37.611009,
      name: 'Кафе Натюрморт',
      urls: [
        'https://img2.fonwall.ru/o/ht/cake-dessert-food-sweet.jpeg',
        'https://picsum.photos/1000/600?random=1',
        'https://picsum.photos/1000/600?random=2',
        'https://picsum.photos/1000/600?random=3',
        'https://picsum.photos/1000/600?random=4',
        'https://picsum.photos/1000/600?random=5',
        'https://picsum.photos/1000/600?random=6'
      ],
      placeType: 'cafe',
      description:
          'Банальные, но неопровержимые выводы, а также предприниматели в сети интернет являются только методом политического участия и смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Интерактивные прототипы призваны к ответу.',
    )
  ];

  static List<String> searchHistory = [];

  // /// 6. Настройки пользователя
  // static Map<String, dynamic> userSetting = {
  //   'isDarkTheme': false, // тема
  //   'isFirstStart': false, // первый запуск приложения
  // };
}
