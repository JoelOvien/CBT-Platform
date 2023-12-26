class UserModel {
  String? accessToken;
  Data? data;
  String? refreshToken;
  String? status;

  UserModel({this.accessToken, this.data, this.refreshToken, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    refreshToken = json['refresh_token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['refresh_token'] = refreshToken;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? userID;
  String? surname;
  String? firstName;
  String? emailAddress;
  String? userStatus;
  String? userType;
  String? dateCreated;
  String? dateUpdated;
  String? lastAccessDate;
  String? departmentID;
  String? role;

  Data({
    this.userID,
    this.surname,
    this.firstName,
    this.emailAddress,
    this.userStatus,
    this.userType,
    this.dateCreated,
    this.dateUpdated,
    this.lastAccessDate,
    this.departmentID,
    this.role,
  });

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    surname = json['Surname'];
    firstName = json['FirstName'];
    emailAddress = json['EmailAddress'];
    userStatus = json['UserStatus'];
    userType = json['UserType'];
    dateCreated = json['DateCreated'];
    dateUpdated = json['DateUpdated'];
    lastAccessDate = json['LastAccessDate'];
    departmentID = json['DepartmentID'];
    role = json['Role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserID'] = userID;
    data['Surname'] = surname;
    data['FirstName'] = firstName;
    data['EmailAddress'] = emailAddress;
    data['UserStatus'] = userStatus;
    data['UserType'] = userType;
    data['DateCreated'] = dateCreated;
    data['DateUpdated'] = dateUpdated;
    data['LastAccessDate'] = lastAccessDate;
    data['DepartmentID'] = departmentID;
    data['Role'] = role;
    return data;
  }
}
