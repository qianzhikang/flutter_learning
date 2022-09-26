class ItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;

  ItemModel({
    required this.appIcon,
    required this.appName,
    required this.appSize,
    required this.appDate,
    required this.appDescription,
    required this.appVersion,
  });
}

final List<ItemModel> appList = [
  ItemModel(
    appIcon: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.geekotq.com%2Fuploadfile%2F2021%2F0312%2F20210312043105902.jpg&refer=http%3A%2F%2Fwww.geekotq.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665587498&t=85ba12bb87b0d462194c3f6db95df689',
    appName: '优酷',
    appSize: '123.8MB',
    appDate: '2022-09-06',
    appDescription:
    '功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍',
    appVersion: 'Version7.1.9',
  ),
  ItemModel(
    appIcon: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn2.image.apk.gfan.com%2Fasdf%2FPImages%2F2012%2F7%2F8%2F264469_2572e33ab-b690-4f49-8e10-0fd88a8b522d.png&refer=http%3A%2F%2Fcdn2.image.apk.gfan.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665587460&t=9607d9371c445d36f6901451bc7a38e4',
    appName: 'bilibili',
    appSize: '109.8MB',
    appDate: '2022-09-11',
    appDescription: '功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍',
    appVersion: 'Version8.1.1',
  ),
  ItemModel(
    appIcon: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fmarketplace.canva.cn%2FMADSBhaJuU0%2F1%2Fthumbnail_large%2Fcanva-MADSBhaJuU0.png&refer=http%3A%2F%2Fmarketplace.canva.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665587520&t=e070ea884fdc6bcc293d56d632a4bcc3',
    appName: '土豆',
    appSize: '33.8MB',
    appDate: '2022-09-09',
    appDescription: '功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍功能介绍',
    appVersion: 'Version1.3.1',
  ),
];
