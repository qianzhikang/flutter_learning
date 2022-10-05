class NoticeModel {
  NoticeModel({
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
  late final List<NoticeContent> content;
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

  NoticeModel.fromJson(Map<String, dynamic> json){
    content = List.from(json['content']).map((e)=>NoticeContent.fromJson(e)).toList();
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

class NoticeContent {
  NoticeContent({
    required this.id,
    required this.content,
    required this.showFlag,
    required this.createTime,
  });
  late final int id;
  late final String content;
  late final bool showFlag;
  late final String createTime;

  NoticeContent.fromJson(Map<String, dynamic> json){
    id = json['id'];
    content = json['content'];
    showFlag = json['showFlag'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['content'] = content;
    _data['showFlag'] = showFlag;
    _data['createTime'] = createTime;
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
    required this.unsorted,
    required this.sorted,
  });
  late final bool empty;
  late final bool unsorted;
  late final bool sorted;

  Sort.fromJson(Map<String, dynamic> json){
    empty = json['empty'];
    unsorted = json['unsorted'];
    sorted = json['sorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empty'] = empty;
    _data['unsorted'] = unsorted;
    _data['sorted'] = sorted;
    return _data;
  }
}