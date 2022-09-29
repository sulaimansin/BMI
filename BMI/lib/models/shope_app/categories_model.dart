class qq {
  bool? status;
  Null? message;
  DataAll? dataAll;

  qq({this.status, this.message, this.dataAll});

  qq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    dataAll =
    json['dataAll'] != null ? new DataAll.fromJson(json['dataAll']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataAll != null) {
      data['dataAll'] = this.dataAll!.toJson();
    }
    return data;
  }
}

class DataAll {
  int? currentPage;
  List<DataLess>? dataLess;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  DataAll(
      {this.currentPage,
        this.dataLess,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  DataAll.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['dataLess'] != null) {
      dataLess = <DataLess>[];
      json['dataLess'].forEach((v) {
        dataLess!.add(new DataLess.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.dataLess != null) {
      data['dataLess'] = this.dataLess!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
Map<String, dynamic> toMap(){
  return {
    'name':name,
    'email':email,
    'password':password,
    'phone':phone,
    'uId':uId,
    'course':course,
    'courses':courses,
    'studentID':studentID,
    'isEmailVerified':isEmailVerified,
    'image':image,
  };
}

class DataLess {
  int? id;
  String? name;
  String? image;

  DataLess({this.id, this.name, this.image});

  DataLess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}