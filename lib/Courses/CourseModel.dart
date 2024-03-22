import 'TeacherModel.dart';

class CourseModel{
  int id;
  String title;
  String desc;
  String videoUrl;
  String photo;
  int idTeacher;

  TeacherModel? teacher;

  CourseModel(this.id, this.title, this.desc, this.videoUrl, this.photo, this.idTeacher){
    initTeacher();
  }

  void initTeacher(){
    //send req to get teacher
    this.teacher = TeacherModel(1, 'Кирилл Михайлович', 'zyxel91@gmail.com', 'assets/kirill.png');
  }
}