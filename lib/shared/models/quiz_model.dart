import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';

enum QuizLevel { facil, medio, dificil, perito }

extension QuizLevelStringExtension on String {

  QuizLevel get parse => {
    "facil": QuizLevel.facil,
    "medio": QuizLevel.medio,
    "dificil": QuizLevel.dificil,
    "perito": QuizLevel.perito,
  }[this]!;
}

extension StringQuizLevelExtension on QuizLevel {

  String get parse => {
    QuizLevel.facil: "facil",
    QuizLevel.medio: "medio",
    QuizLevel.dificil: "dificil",
    QuizLevel.perito: "perito",
  }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final QuizLevel level;
  final String image;

  QuizModel({
    required this.title,
    this.questionAwnsered = 0,
    required this.questions,
    required this.level,
    required this.image,
  });
    
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questionAwnsered': questionAwnsered,
      'questions': questions.map((question) => question.toMap()).toList(),
      'level': level.parse,
      'image': image,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'], 
      questionAwnsered: map['questionAwnsered'], 
      questions: List<QuestionModel>.from(map['questions']?.map((question) => QuestionModel.fromMap(question))),
      level: map['level'].toString().parse,
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
