class RegisteredCoursesModel {
  String? session;
  String? semester;
  String? userID;
  String? courseCode;
  String? dateCreated;
  String? dateUpdated;

  RegisteredCoursesModel({
    this.session,
    this.semester,
    this.userID,
    this.courseCode,
    this.dateCreated,
    this.dateUpdated,
  });

  RegisteredCoursesModel.fromJson(Map<String, dynamic> json) {
    session = json['Session'];
    semester = json['Semester'];
    userID = json['UserID'];
    courseCode = json['CourseCode'];
    dateCreated = json['DateCreated'];
    dateUpdated = json['DateUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Session'] = session;
    data['Semester'] = semester;
    data['UserID'] = userID;
    data['CourseCode'] = courseCode;
    data['DateCreated'] = dateCreated;
    data['DateUpdated'] = dateUpdated;
    return data;
  }
}
