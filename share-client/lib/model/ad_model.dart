
List swiperList = <Advertising>[
  Advertising(
      adUrl: 'https://pub.dev/packages/card_swiper',
      imgUrl: 'https://img1.sycdn.imooc.com/szimg/5cf47ccf0834940306000338-240-180.jpg'),
  Advertising(
      adUrl: 'https://pub.dev/packages/card_swiper',
      imgUrl: 'https://img3.sycdn.imooc.com/5c60f2e80984689c05400300-360-202.png'),
];

class Advertising {
  String imgUrl;
  String adUrl;
  Advertising({required this.imgUrl, required this.adUrl});
}