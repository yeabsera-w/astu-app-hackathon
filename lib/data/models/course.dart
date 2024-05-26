import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'course.g.dart';

enum Grade {
  aPlus("A+"),
  a("A"),
  aMinus("A-"),
  bPlus("B+"),
  b("B"),
  bMinus("B-"),
  cPlus("C+"),
  c("C"),
  cMinus("C-"),
  d("D"),
  f("F");

  final String letter;
  const Grade(this.letter);
}

extension GradeExtention on Grade {
  static Grade fromScore(double score) {
    if (score >= 90) {
      Grade.aPlus;
    } else if (85 <= score && score < 90) {
      return Grade.a;
    } else if (80 <= score && score < 85) {
      return Grade.aMinus;
    } else if (75 <= score && score < 80) {
      return Grade.bPlus;
    } else if (70 <= score && score < 75) {
      return Grade.b;
    } else if (65 <= score && score < 70) {
      return Grade.bMinus;
    } else if (60 <= score && score < 65) {
      return Grade.cPlus;
    } else if (50 <= score && score < 60) {
      return Grade.c;
    } else if (45 <= score && score < 50) {
      return Grade.cMinus;
    } else if (40 <= score && score < 45) {
      return Grade.d;
    }
    return Grade.f;
  }
}

@HiveType(typeId: 1)
class Course extends Equatable {
  const Course({required this.name, this.grade, this.score});
  @HiveField(0)
  final String name;
  @HiveField(1)
  final Grade? grade;
  @HiveField(2)
  final double? score;

  @override
  List<Object?> get props => [name];
}
