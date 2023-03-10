class UserModel{
  String? name;
  String? email;
  String? phone;
  String img= "islam";

  UserModel(this.name, this.email, this.phone, this.img);

  Map<String , dynamic> toJson(){
    return {
      "username" : name ,
      "email" : email ,
      "phone" : phone,
      "img" : img ,
    };
  }

  UserModel.fromJson(Map<String , dynamic> json){
        name = json['username'];
        email = json['email'];
        phone = json['phone'];
        img = json['img'];
  }
}