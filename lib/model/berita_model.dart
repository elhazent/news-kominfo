class BeritaModel {
  String? id;
  String? foto;
  String? judul;
  String? post;
  String? sumber;

  BeritaModel({this.id, this.foto, this.judul, this.post, this.sumber});

  BeritaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foto = json['foto'];
    judul = json['judul'];
    post = json['post'];
    sumber = json['sumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foto'] = this.foto;
    data['judul'] = this.judul;
    data['post'] = this.post;
    data['sumber'] = this.sumber;
    return data;
  }
}