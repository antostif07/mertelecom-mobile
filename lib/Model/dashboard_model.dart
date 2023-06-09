import 'dart:convert';

class DashboardModel {
  DashboardModel({
    required this.totalProjects,
    required this.totalTasks,
    required this.totalCompletedProjects,
  });

  int totalProjects;
  int totalTasks;
  int totalCompletedProjects;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
      totalProjects: json['totalProjects'],
      totalTasks: json['totalTasks'],
      totalCompletedProjects: json['totalCompletedProjects']
  );

  Map<String, dynamic> toJson() => {
    "totalProjects": totalProjects,
    "totalTasks": totalTasks,
    "totalCompletedProjects": totalCompletedProjects,
  };

  static List<DashboardModel> dashboardFromJson(String str) =>
      List<DashboardModel>.from(json.decode(str).map((x) => DashboardModel.fromJson(x)));
}