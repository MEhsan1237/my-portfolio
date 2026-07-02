import '../models/project_model.dart';

class ProjectsViewModel {
  final List<ProjectModel> projects = [
    ProjectModel(
      title: "News App",
      image: "assets/images/news.one.png",
      description: "Real-time news aggregator with category filtering and beautiful UI.",
      url: "https://github.com/MEhsan1237/news-app",
      tags: ["Flutter", "Rest API", "NewsAPI"],
    ),
    ProjectModel(
      title: "Blood Donation",
      image: "assets/images/blood.one.png",
      description: "Connecting donors with recipients through real-time notifications.",
      url: "https://github.com/MEhsan1237/Blood_Donation_App",
      tags: ["Flutter", "Firebase", "Maps"],
    ),
    ProjectModel(
      title: "E-Commerce App",
      image: "assets/images/eproducts1.png",
      description: "Premium shopping experience with smooth transitions and clean code.",
      url: "https://github.com/MEhsan1237/UI-Kit-E-commerce",
      tags: ["Flutter", "Provider", "Animations"],
    ),
    ProjectModel(
      title: "Task Manager",
      image: "assets/images/todo.two.png",
      description: "Efficient task tracking with local storage and clean architecture.",
      url: "https://github.com/MEhsan1237/Update_TodoApp",
      tags: ["Flutter", "Hive", "Clean Code"],
    ),
    ProjectModel(
      title: "Quiz App",
      image: "assets/images/quiz.one.png",
      description: "Interactive quiz application with real-time scoring and leaderboards.",
      url: "https://github.com/MEhsan1237/Quiz-App-",
      tags: ["Flutter", "Firebase", "Animations"],
    ),
    ProjectModel(
      title: "Covid App",
      image: "assets/images/virus.two.png",
      description: "Real-time COVID-19 tracking application and interactive charts",
      url: "https://github.com/MEhsan1237/covid_app",
      tags: ["Flutter", "Vaccine", "Graphs"],
    ),
    ProjectModel(
      title: "Food App UI",
      image: "assets/images/food.one.png",
      description: "Delicious UI design for food delivery and restaurant booking.",
      url: "https://github.com/MEhsan1237/Food_Panda_App",
      tags: ["Flutter", "UI Kit", "Design"],
    ),
    ProjectModel(
      title: "BMI App",
      image: "assets/images/calculator.one.png",
      description: "A BMI calculates Body Mass using the user's height and weight.",
      url: "https://github.com/MEhsan1237/BMI-app",
      tags: ["Flutter", "Logic", "Math"],
    ),
  ];

  // Helper getters for projects in rows (if needed)
  List<ProjectModel> get projectsRow1 => projects.length >= 3 ? projects.sublist(0, 3) : projects;
  List<ProjectModel> get projectsRow2 => projects.length >= 6 ? projects.sublist(3, 6) : (projects.length > 3 ? projects.sublist(3) : []);
  List<ProjectModel> get projectsRow3 => projects.length > 6 ? projects.sublist(6) : [];
}
