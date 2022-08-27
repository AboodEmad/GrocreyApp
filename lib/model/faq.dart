class Faq {
  late int id;
  late String questionEn,questionAr;
  late String answerEn,answerAr;
  bool isExpanded = false;

  Faq();

  Faq.fromJson(Map<String,dynamic> map){
    id = map["id"];
    questionEn = map["question_en"];
    questionAr = map["question_ar"];
    answerEn = map["answer_en"];
    answerAr = map["answer_ar"];
  }
}
