class QuestionBankModel {
  int? questionNumber;
  String? questionID;
  String? courseCode;
  String? answerTypeID;
  String? question;
  String? questionImage;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;
  String? correctAnswer;
  String? dateCreated;
  String? dateUpdated;

  QuestionBankModel(
      {this.questionNumber,
      this.questionID,
      this.courseCode,
      this.answerTypeID,
      this.question,
      this.questionImage,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.answer5,
      this.correctAnswer,
      this.dateCreated,
      this.dateUpdated});

  QuestionBankModel.fromJson(Map<String, dynamic> json) {
    questionNumber = json['QuestionNumber'];
    questionID = json['QuestionID'];
    courseCode = json['CourseCode'];
    answerTypeID = json['AnswerTypeID'];
    question = json['Question'];
    questionImage = json['QuestionImage'];
    answer1 = json['Answer1'];
    answer2 = json['Answer2'];
    answer3 = json['Answer3'];
    answer4 = json['Answer4'];
    answer5 = json['Answer5'];
    correctAnswer = json['CorrectAnswer'];
    dateCreated = json['DateCreated'];
    dateUpdated = json['DateUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['QuestionNumber'] = questionNumber;
    data['QuestionID'] = questionID;
    data['CourseCode'] = courseCode;
    data['AnswerTypeID'] = answerTypeID;
    data['Question'] = question;
    data['QuestionImage'] = questionImage;
    data['Answer1'] = answer1;
    data['Answer2'] = answer2;
    data['Answer3'] = answer3;
    data['Answer4'] = answer4;
    data['Answer5'] = answer5;
    data['CorrectAnswer'] = correctAnswer;
    data['DateCreated'] = dateCreated;
    data['DateUpdated'] = dateUpdated;
    return data;
  }
}
