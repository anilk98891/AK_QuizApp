class QuestionsModel {
  final List<QuestionModel> question;

  QuestionsModel(this.question);

  QuestionsModel.fromJson(Map<String, dynamic> json)
      : question = json['question']
            .map<QuestionModel>((i) => QuestionModel.fromJson(i))
            .toList();
}
class QuestionModel {
  final question;
  final answer;
  final mode;
  final category;
  final List<OptionModel> option;

  QuestionModel(this.question, this.answer, this.option, this.mode, this.category);

  QuestionModel.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        this.answer = json['answer'],
        this.mode = json['mode'],
        this.category = json['category'],
        this.option = json['option']
            .map<OptionModel>((i) => OptionModel.fromJson(i))
            .toList();
}

class OptionModel {
  final text;
  final answer;

  OptionModel(this.text, this.answer);

  OptionModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        this.answer = json['answer'];
}