class ShareModel {
  ShareModel({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.empty,
  });
  late final List<Content> content;
  late final Pageable pageable;
  late final bool last;
  late final int totalPages;
  late final int totalElements;
  late final bool first;
  late final int size;
  late final int number;
  late final Sort sort;
  late final int numberOfElements;
  late final bool empty;

  ShareModel.fromJson(Map<String, dynamic> json){
    content = List.from(json['content']).map((e)=>Content.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    first = json['first'];
    size = json['size'];
    number = json['number'];
    sort = Sort.fromJson(json['sort']);
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e)=>e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['last'] = last;
    _data['totalPages'] = totalPages;
    _data['totalElements'] = totalElements;
    _data['first'] = first;
    _data['size'] = size;
    _data['number'] = number;
    _data['sort'] = sort.toJson();
    _data['numberOfElements'] = numberOfElements;
    _data['empty'] = empty;
    return _data;
  }
}

class Content {
  Content({
    required this.id,
    required this.userId,
    required this.title,
    required this.createTime,
    required this.updateTime,
    required this.isOriginal,
    required this.author,
    required this.cover,
    required this.summary,
    required this.price,
    required this.downloadUrl,
    required this.buyCount,
    required this.showFlag,
    required this.auditStatus,
    required this.reason,
  });
  late final int id;
  late final int userId;
  late final String title;
  late final String createTime;
  late final String updateTime;
  late final int isOriginal;
  late final String author;
  late final String cover;
  late final String summary;
  late final int price;
  late final String downloadUrl;
  late final int buyCount;
  late final int showFlag;
  late final String auditStatus;
  late final String reason;

  Content.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    isOriginal = json['isOriginal'];
    author = json['author'];
    cover = json['cover'];
    summary = json['summary'];
    price = json['price'];
    downloadUrl = json['downloadUrl'];
    buyCount = json['buyCount'];
    showFlag = json['showFlag'];
    auditStatus = json['auditStatus'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['title'] = title;
    _data['createTime'] = createTime;
    _data['updateTime'] = updateTime;
    _data['isOriginal'] = isOriginal;
    _data['author'] = author;
    _data['cover'] = cover;
    _data['summary'] = summary;
    _data['price'] = price;
    _data['downloadUrl'] = downloadUrl;
    _data['buyCount'] = buyCount;
    _data['showFlag'] = showFlag;
    _data['auditStatus'] = auditStatus;
    _data['reason'] = reason;
    return _data;
  }
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });
  late final Sort sort;
  late final int offset;
  late final int pageNumber;
  late final int pageSize;
  late final bool paged;
  late final bool unpaged;

  Pageable.fromJson(Map<String, dynamic> json){
    sort = Sort.fromJson(json['sort']);
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sort'] = sort.toJson();
    _data['offset'] = offset;
    _data['pageNumber'] = pageNumber;
    _data['pageSize'] = pageSize;
    _data['paged'] = paged;
    _data['unpaged'] = unpaged;
    return _data;
  }
}

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
  late final bool empty;
  late final bool sorted;
  late final bool unsorted;

  Sort.fromJson(Map<String, dynamic> json){
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empty'] = empty;
    _data['sorted'] = sorted;
    _data['unsorted'] = unsorted;
    return _data;
  }
}