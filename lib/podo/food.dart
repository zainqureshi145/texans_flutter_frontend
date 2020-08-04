class Food {
  String img;
  String tag;

  Food({this.img, this.tag});

  Food.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['tag'] = this.tag;
    return data;
  }
}
