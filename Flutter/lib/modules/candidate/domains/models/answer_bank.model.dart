class AnswerBankModel {
  String? iD;
  String? userID;
  String? questionID;
  String? courseCode;
  String? correctAnswer;
  String? answerProvided;
  int? answerMark;
  String? session;
  String? semester;
  String? dateCreated;
  String? dateUpdated;

  AnswerBankModel({
    this.iD,
    this.userID,
    this.questionID,
    this.courseCode,
    this.correctAnswer,
    this.answerProvided,
    this.answerMark,
    this.session,
    this.semester,
    this.dateCreated,
    this.dateUpdated,
  });

  AnswerBankModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userID = json['UserID'];
    questionID = json['QuestionID'];
    courseCode = json['CourseCode'];
    correctAnswer = json['CorrectAnswer'];
    answerProvided = json['AnswerProvided'];
    answerMark = json['AnswerMark'];
    session = json['Session'];
    semester = json['Semester'];
    dateCreated = json['DateCreated'];
    dateUpdated = json['DateUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['UserID'] = userID;
    data['QuestionID'] = questionID;
    data['CourseCode'] = courseCode;
    data['CorrectAnswer'] = correctAnswer;
    data['AnswerProvided'] = answerProvided;
    data['AnswerMark'] = answerMark;
    data['Session'] = session;
    data['Semester'] = semester;
    data['DateCreated'] = dateCreated;
    data['DateUpdated'] = dateUpdated;
    return data;
  }
}
