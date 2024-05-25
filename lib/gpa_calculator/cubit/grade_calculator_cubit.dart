import 'package:astu/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'grade_calculator_state.dart';

class GradeCalculatorCubit extends Cubit<GradeCalculatorState> {
  GradeCalculatorCubit()
      : super(const GradeCalculatorState(
            courses: <Course>[], calculatedGrade: 0.0));

  void calculateGrade(List<Course> courses) {
    double calculatedGrade = 0.0;
    double sum = 0.0;
    final scores =
        List.generate(courses.length, (index) => courses[index].score);
    final creditHours =
        List.generate(courses.length, (index) => courses[index].score);
    for (int i = 0; i < scores.length; i++) {
      sum += scores[i] * creditHours[i];
    }

    calculatedGrade = sum /
        creditHours.fold(
            0.0, (previousValue, element) => previousValue + element);
    emit(state.copyWith(calculatedGrade: calculatedGrade));
  }

  void addCourse(Course course) {
    final courses = state.courses;
    courses.add(course);
    emit(state.copyWith(courses: courses));
  }
}
