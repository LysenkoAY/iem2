import 'package:flutter/material.dart';
import 'package:get/get.dart';

//final String platform = GetPlatform.isWeb ? 'Web' : GetPlatform.isAndroid ? 'Android' : 'other';

String city = 'Анапа';
int menu = 0;
int indexMenu = -1;
int sumAll = 0;

class Product {
  String? group;
  String? name;
  String? description;
  int price;
  String? image;
  String? exp;
  int count = 0;
  bool favorite = false;

  Product(this.group, this.name, this.description, this.price, this.image,
      this.exp);

  String get image450 => 'assets/${image}450x450.$exp';

  String get image600 => 'assets/${image}600x500.$exp';

  int get sum => price * count;

  void notFavorite() {
    if (favorite) {
      favorite = false;
    } else {
      favorite = true;
    }
  }

  void incCount() {
    count = count + 1;
    sumAll = sumAll + price;
  }

  void decCount() {
    if (count >= 1) {
      count = count - 1;
      sumAll = sumAll - price;
    }
  }
}

final cityItems = {
  'Анапа': 'Ленина 134',
  'Краснодар': 'Тюляева 15',
  'Витязево': 'Черноморская 90'
};

final groups = [
  'СЕТЫ ИЗ РОЛЛОВ',
  'ФИРМЕННЫЕ РОЛЛЫ',
  'ГОРЯЧИЕ РОЛЛЫ',
  'СУШИ',
  'РОЛЛЫ',
  'ПИЦЦА',
  'БУРГЕРЫ',
  'СУПЫ',
  'САЛАТЫ',
  'ВТОРЫЕ БЛЮДА',
  'ХЛЕБ',
  'ХОЛОДНЫЕ ЗАКУСКИ',
  'СОУСЫ',
  'ДЕТСКОЕ МЕНЮ',
  'ДЕСЕРТЫ',
  'ГОРЯЧИЕ ЗАКУСКИ',
  'НАПИТКИ',
  'ГАРНИРЫ'
];

final List<Product> menus = [
  Product(
      'СЕТЫ ИЗ РОЛЛОВ',
      'СЕТ БОЛЬШАЯ КОМПАНИЯ',
      'Роллы: Катана, Ролл 4-сыра, Эби грин, изуми, Япония, Майами, ори-тори, том-мэй. Вес ролл - 1425гр, имбирь - 80гр, васаби -24гр, соевый соус - 240гр. 49шт',
      2100,
      '1411202006__bol_shaja_kompanija-',
      'jpg'),
  Product(
      'СЕТЫ ИЗ РОЛЛОВ',
      'СЕТ САМУРАЙ',
      'Сливочный, Цезарь темпура, Мураками, Фьюджи, Ролл с лососем. Вес ролл -785гр, имбирь - 50гр, васаби - 15гр, соевый соус - 150гр. 29шт',
      1190,
      '0406202211_41ed504f-6c7d-4b0f-95e0-f2e9749096d6-',
      'jpg'),
  Product(
      'СЕТЫ ИЗ РОЛЛОВ',
      'СЕТ ДЛЯ ДВОИХ',
      'Роллы: ори-тори, ролл с огурцом, калифорния с креветкой. вес ролл -450гр, имбирь -30гр, васаби-9гр, соевый соус -90гр.',
      750,
      '0406202211_fb497616-7909-4f15-b9dc-301ebcbfe98d-',
      'jpg'),
  Product(
      'СЕТЫ ИЗ РОЛЛОВ',
      'СЕТ HOT',
      'Роллы: Сяке кунсей маки, Камикадзе, Яки спайси лосось, Де-рибас. Вес ролл - 735гр, имбирь -40гр, васаби - 12гр, соус соевый - 120гр. 24шт',
      1190,
      '0406202211_099c4169-7136-4750-a568-78693f756656-',
      'jpg'),
  Product(
      'СЕТЫ ИЗ РОЛЛОВ',
      'СЕТ САКУРА',
      'Роллы: Сливочный, Аляска, Калифорния с креветкой, Ролл с огурцом, Ролл с тунцом, Эби грин, Фьюджи, ролл с лососем. Вес ролл - 1270гр, имбирь - 80гр, васаби -24гр, соевый соус - 240гр. 55шт',
      1990,
      '0406202211_85477d63-5fb4-4f7e-a912-2012310fed47-',
      'jpg'),
  Product(
      'ФИРМЕННЫЕ РОЛЛЫ',
      'ДЕ-РИБАС',
      'Фирменный ролл, запеченный с тигровой креветкой, сливочным сыром, томатами черри, кунжутом, фирменным соусом спасий и политый соусом Унаги, острый. Вес : ролла - 180гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      350,
      '1311202004_-',
      'jpg'),
  Product(
      'ФИРМЕННЫЕ РОЛЛЫ',
      'КОНТИНЕНТ СПЕШЛ',
      'Копченый угорь, авокадо, кунжут, сливочный сыр, фирменный соус Яки и соус Унаги. Вес : ролла - 245гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      460,
      '1311202004__speshl-',
      'jpg'),
  Product(
      'ФИРМЕННЫЕ РОЛЛЫ',
      'ORANGE МАКИ',
      'Нежный запечённый ролл с тигровой креветкой, лососем, икрой масаго, сыром Гауда, авокадо, японским майонезом и сливочным сыром. Вес ролла 240 гр., имбирь - 10гр, васаби - 3гр, соевый соус 30 гр.',
      430,
      '1311202004__maki-',
      'jpg'),
  Product(
      'ФИРМЕННЫЕ РОЛЛЫ',
      'ТОКИО РОЛЛ',
      'Вкуснейший ролл с лососем, угрем, авокадо, кунжутом и сливочным сыром, с фирменным соусом Яки и соусом Унаги. Вес : ролла - 250гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      530,
      '1311202003__roll-',
      'jpg'),
  Product(
      'ФИРМЕННЫЕ РОЛЛЫ',
      'ФИЛА ДЕЛЮКС',
      'Лосось, сливочный сыр, икра лосося. Вес : ролла - 195гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      520,
      '1211202001__deljuks-',
      'jpg'),
  Product(
      'ФИРМЕННЫЕ РОЛЛЫ',
      'ЙОКОГАМА',
      'Запеченный ролл с тигровой креветкой, копченым лососем, свежим лососем, сливочным сыром и кунжутом. Вес : ролла - 230гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      460,
      '1211202002_-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'КАМИКАДЗЕ',
      'Вкуснейший, хитовый, запеченный ролл с мидиями, фирменным соусом Яки, соусом Унаги, кунжутом и чесночной пастой. Вес : ролла - 220гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      280,
      '1311202004_-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'МЕКСИКА',
      'Ролл, обжаренный в кляре с панировочными сухарями, копченым лососем, авокадо и сливочным сыром. Вес : ролла - 190гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      320,
      '1311202004_mexica-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'ЯКИ СПАЙСИ КРЕВЕТКА',
      'Запеченный ролл с фирменным соусом Спайси, тигровой креветкой, поливается соусом Унаги и посыпается кунжутом. Вес : ролла - 125гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      250,
      '1311202004__spajjsi_(1)-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'МАЙАМИ',
      'Запеченный ролл с тигровой креветкой, японским омлетом, икрой масаго, сливочным сыром и соусом спайси. Вес : ролла - 170гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      280,
      '1211202002_mayami-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'ЯКИ СПАЙСИ ЛОСОСЬ',
      'Запеченный ролл с лососем, фирменным соусом Спайси, поливается соусом Унаги и посыпается кунжутом. Вес : ролла - 125гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      250,
      '1311202004__spajjsi_(1)-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      '4-СЫРА',
      'Превосходное сочетание четырех сыров: сливочного, Гауда, пармезана и моцареллы. Вес ролла :170гр имбирь 10гр, васаби 3гр, соевый соус 30гр',
      190,
      '1211202002_4_syra-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'СПАЙСИ ФИЛА',
      'Невероятное сочетание соуса спайси и запеченного лосося со сливочным сыром. Вес ролла : 113гр имбирь 10гр, васаби 3 гр, соевый соус 30гр',
      270,
      '1211202001__fila-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'РОЛЛ В КЛЯРЕ',
      'С тигровой креветкой, огурцом, авокадо. Вес : ролла -170гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      250,
      '1311202004__v_kljare-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'ЦЕЗАРЬ ТЕМПУРА',
      'Интерпретация салата "Цезарь" в виде ролла с обжаренной курицей, листом салата, сыром Пармезан, огурцом и одноименным фирменным соусом. Вес : ролла - 240гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      230,
      '1211202001__tempura-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'ЯКИ СПАЙСИ ТУНЕЦ',
      'Запеченный ролл с тунцом, фирменным соусом Спайси, поливается соусом Унаги и посыпается кунжутом. Вес : ролла - 125гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      0,
      '1311202004__spajjsi_(1)-',
      'jpg'),
  Product(
      'ГОРЯЧИЕ РОЛЛЫ',
      'ОСАКА',
      'Копченый лосось, сливочный сыр, омлет томаго, огурец. Вес : ролла - 190гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр.',
      200,
      '0406202210_895b7656-5e0c-42c8-9034-533a2a3f6b3d-',
      'jpg'),
  Product(
      'СУШИ',
      'СУШИ ОСТРОЕ С ТИГРОВОЙ КРЕВЕТКОЙ',
      'Тигровая креветка, рис, нори, соус спайси. суши - 40гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202012_OstrieSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ С ЛОСОСЕМ',
      'Лосось, рис. суши - 35гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202012_ZapechSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ ОСТРОЕ С ЛОСОСЕМ',
      'Лосось, рис, нори, соус спайси. суши - 40гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202012_OstrieSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ ОСТРОЕ С ТУНЦОМ',
      'Тунец, рис, нори, соус спайси. суши - 40гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202001_OstrieSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ С ТИГРОВОЙ КРЕВЕТКОЙ',
      'Тигровая креветка, рис. суши - 35гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202012_ZapechSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ С ВОДОРОСЛЯМИ ЧУКА',
      'Водоросли Чука, рис, нори. суши - 35гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      80,
      '2808202001_SushiChuko-',
      'png'),
  Product(
      'СУШИ',
      'ЗАПЕЧЕННОЕ СУШИ С ЛОСОСЕМ',
      'Лосось, рис, соус Яки, кунжут, соус Унаги, нори. суши - 45гр, имбирь 10гр, васаби - 3гр, соевый соус 20гр.',
      120,
      '2808202012_ZapechSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ С ИКРОЙ ТОБИКО',
      'Икра Тобико, рис, нори. суши - 35гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202001_SushiTobiko-',
      'png'),
  Product(
      'СУШИ',
      'ЗАПЕЧЕННОЕ СУШИ С МИДИЯМИ',
      'Мидии, рис, соус Яки, кунжут, соус Унаги, нори. суши - 45гр, имбирь 10гр, васаби - 3гр, соевый соус 20гр.',
      120,
      '2808202012_ZapechSushi-',
      'png'),
  Product(
      'СУШИ',
      'СУШИ С ТУНЦОМ',
      'Тунец, рис. суши - 35гр, имбирь - 10гр, васаби - 3гр, соевый соус - 20гр.',
      120,
      '2808202001_SushiTunets-',
      'png'),
  Product(
      'СУШИ',
      'ЗАПЕЧЕННОЕ СУШИ С ТИГРОВОЙ КРЕВЕТКОЙ',
      ' Тигровая креветка, рис, соус Яки, кунжут, соус Унаги, нори. суши - 45гр, имбирь 10гр, васаби - 3гр, соевый соус 20гр.',
      120,
      '2808202012_ZapechSushi-',
      'png'),
  Product(
      'СУШИ',
      'ЗАПЕЧЕННОЕ СУШИ С ТУНЦОМ',
      'Тунец, рис, соу яки, кунжут, соус унаги, нори. суши - 45гр, имбирь 10гр, васаби - 3гр, соевый соус 20гр.',
      120,
      '2808202012_ZapechSushi-',
      'png'),
  Product(
      'РОЛЛЫ',
      'ФИЛАДЕЛЬФИЯ',
      'Нежнейшее сочетание лосося, сливочного сыра, водорослей нори и риса вызывает нашу гордость, потому что в нем нет ничего лишнего - только лучший вкус. Вес : ролла - 210гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 8шь',
      390,
      '1311202003_-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'КАЛИФОРНИЯ С КРЕВЕТКОЙ',
      ' Классический ролл с тигровой креветкой, икрой масаго, огурцом, авокадо, соусом яки. Вес : ролла - 210гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр',
      400,
      '1311202004__s_krvetkojj-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'РОЛЛ С ЛОСОСЕМ',
      'Классический ролл с лососем, сливочным сыром, зеленым луком. Вес : ролла - 110гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 6шт',
      190,
      '1311202003__lososem-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'АЛЯСКА',
      'Копченый лосось, сливочный сыр, зеленый лук, кунжут. Вес : ролла - 195гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 8 шт',
      270,
      '1311202004_aliaska-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'ФЬЮДЖИ',
      'Необычное сочетание тигровой креветки, свежего апельсина, нежного сливочного сыра и пюре манго. Вес : ролла - 183гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 5шт',
      280,
      '1211202001_fyudzhi-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'ЯПОНИЯ',
      'Копченый лосось, икра масаго, сыр сливочный, японский омлет, зелень укропа. Вес : ролла - 190гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 8шт',
      280,
      '1211202010_japan-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'РОЛЛ С ТУНЦОМ',
      'Классический ролл с начинкой из тунца. Идеально подойдет для спортсменов из-за своей низкой калорийности. Вес : ролла - 110гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 6шт',
      230,
      '1311202004__s_tuncom-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'РОЛЛ С УГРЁМ',
      'Классический ролл с начинкой из угря. Идеально подойдет для спортсменов из-за своей низкой калорийности. Вес ролла 110гр, имбирь 10, васаби 3гр, соевый соус 30. 6шт',
      320,
      '1311202003__lososem-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'ЭБИ ГРИН',
      'Слегка островатый ролл с тигровой креветкой, икрой масаго и соусом Спайси. Вес: ролла - 180гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 8шт',
      330,
      '1311202003__grin-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'ЭБИ ТЕМПУРА',
      'Настоящая тигровая креветка в кляре, с икрой масаго и соусом Спайси. Вес : ролла - 190гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 8шт',
      330,
      '1211202001__tempura2-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'РОЛЛ С АВОКАДО',
      'Классический ролл с начинкой из авокадо. Идеально подойдет для спортсменов из-за своей низкой калорийности. Вес : ролла - 110гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 6шт',
      160,
      '1311202004__avokado-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'РОЛЛ С ОГУРЦОМ',
      'Классический ролл с начинкой из огурца. Идеально подойдет для спортсменов из-за своей низкой калорийности. Вес : ролла - 110гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 6шт',
      110,
      '1311202004__s_ogurcom-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'СЛИВОЧНЫЙ',
      'Легкий ролл со сливочным сыром, авокадо, вкус которого изящно дополняет икра масаго. Вес : ролла - 180 грамм, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 8шт',
      280,
      '1211202002_slivoch-',
      'jpg'),
  Product(
      'РОЛЛЫ',
      'РОЛЛ С МИДИЯМИ',
      'Классический ролл с начинкой из свежих мидий. Идеально подойдет для спортсменов из-за своей низкой калорийности. Вес : ролла - 110гр, имбирь - 10гр, васаби -3гр, соевый соус 30гр. 6шт',
      130,
      '1311202003__midijami-',
      'jpg'),
  Product('ПИЦЦА', '', '', 0, '', 'png'),
  Product('БУРГЕРЫ', '', '', 0, '', 'png'),
  Product('СУПЫ', '', '', 0, '', 'png'),
  Product('САЛАТЫ', '', '', 0, '', 'png'),
  Product('ВТОРЫЕ БЛЮДА', '', '', 0, '', 'png'),
  Product('ХЛЕБ', '', '', 0, '', 'png'),
  Product('ХОЛОДНЫЕ ЗАКУСКИ', '', '', 0, '', 'png'),
  Product('СОУСЫ', '', '', 0, '', 'png'),
  Product('ДЕТСКОЕ МЕНЮ', '', '', 0, '', 'png'),
  Product('ДЕСЕРТЫ', '', '', 0, '', 'png'),
  Product('ГОРЯЧИЕ ЗАКУСКИ', '', '', 0, '', 'png'),
  Product('НАПИТКИ', '', '', 0, '', 'png'),
  Product('ГАРНИРЫ', '', '', 0, '', 'png'),
];
