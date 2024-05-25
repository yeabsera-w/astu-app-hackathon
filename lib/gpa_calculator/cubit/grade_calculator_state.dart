part of 'grade_calculator_cubit.dart';

class GradeCalculatorState extends Equatable {
  const GradeCalculatorState(
      {required this.courses, required this.calculatedGrade});

  final List<Course> courses;
  final double calculatedGrade;

  GradeCalculatorState copyWith(
      {List<Course>? courses, double? calculatedGrade}) {
    return GradeCalculatorState(
        courses: courses ?? this.courses,
        calculatedGrade: calculatedGrade ?? this.calculatedGrade);
  }

  @override
  List<Object> get props => [courses, calculatedGrade];
}
