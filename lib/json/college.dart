class CollegeModel {
  int code;
  String msg;
  List<Data> data;

  CollegeModel({this.code, this.msg, this.data});

  CollegeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int addTime;
  String name;
  Null rank;
  String province;
  Null type;
  Null ministry;
  String tags;
  Null crowds;
  Null officialLink;
  Null graduateLink;
  Null recruitLink;
  Null brief;
  Null scholarship;
  Null nationalClassA;
  Null nationalClassB;
  Null worldClassA;

  Data(
      {this.id,
      this.addTime,
      this.name,
      this.rank,
      this.province,
      this.type,
      this.ministry,
      this.tags,
      this.crowds,
      this.officialLink,
      this.graduateLink,
      this.recruitLink,
      this.brief,
      this.scholarship,
      this.nationalClassA,
      this.nationalClassB,
      this.worldClassA});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addTime = json['add_time'];
    name = json['name'];
    rank = json['rank'];
    province = json['province'];
    type = json['type'];
    ministry = json['ministry'];
    tags = json['tags'];
    crowds = json['crowds'];
    officialLink = json['official_link'];
    graduateLink = json['graduate_link'];
    recruitLink = json['recruit_link'];
    brief = json['brief'];
    scholarship = json['scholarship'];
    nationalClassA = json['national_class_a'];
    nationalClassB = json['national_class_b'];
    worldClassA = json['world_class_a'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['add_time'] = this.addTime;
    data['name'] = this.name;
    data['rank'] = this.rank;
    data['province'] = this.province;
    data['type'] = this.type;
    data['ministry'] = this.ministry;
    data['tags'] = this.tags;
    data['crowds'] = this.crowds;
    data['official_link'] = this.officialLink;
    data['graduate_link'] = this.graduateLink;
    data['recruit_link'] = this.recruitLink;
    data['brief'] = this.brief;
    data['scholarship'] = this.scholarship;
    data['national_class_a'] = this.nationalClassA;
    data['national_class_b'] = this.nationalClassB;
    data['world_class_a'] = this.worldClassA;
    return data;
  }
}
