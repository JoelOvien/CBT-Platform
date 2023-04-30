class UserModel {
  String? accessToken;
  String? refreshToken;
  String? status;
  User? user;

  UserModel({this.accessToken, this.refreshToken, this.status, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? idNumber;
  String? email;
  String? userType;
  String? createdAt;
  String? updatedAt;
  String? userId;

  User(
      {this.sId,
      this.name,
      this.idNumber,
      this.email,
      this.userType,
      this.createdAt,
      this.updatedAt,
      this.userId});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    idNumber = json['id_number'];
    email = json['email'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['id_number'] = idNumber;
    data['email'] = email;
    data['user_type'] = userType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    return data;
  }
}
