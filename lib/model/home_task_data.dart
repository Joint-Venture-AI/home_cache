class HomeTaskData {
  final Tasks tasks;
  final int health;
  final MyData myData;

  HomeTaskData({
    required this.tasks,
    required this.health,
    required this.myData,
  });

  factory HomeTaskData.fromJson(Map<String, dynamic> json) => HomeTaskData(
        tasks: Tasks.fromJson(json["tasks"]),
        health: json["health"],
        myData: MyData.fromJson(json["my_data"]),
      );

  Map<String, dynamic> toJson() => {
        "tasks": tasks.toJson(),
        "health": health,
        "my_data": myData.toJson(),
      };
}

// Needed models:

class Tasks {
  final Season season;
  final List<dynamic> overdue;
  final List<dynamic> upcoming;
  final List<dynamic> completed;

  Tasks({
    required this.season,
    required this.overdue,
    required this.upcoming,
    required this.completed,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        season: Season.fromJson(json["season"]),
        overdue: List<dynamic>.from(json["overdue"].map((x) => x)),
        upcoming: List<dynamic>.from(json["upcoming"].map((x) => x)),
        completed: List<dynamic>.from(json["completed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "season": season.toJson(),
        "overdue": List<dynamic>.from(overdue.map((x) => x)),
        "upcoming": List<dynamic>.from(upcoming.map((x) => x)),
        "completed": List<dynamic>.from(completed.map((x) => x)),
      };
}

class Season {
  final DateTime start;
  final DateTime end;

  Season({
    required this.start,
    required this.end,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
      };
}

class MyData {
  final int completed;
  final int pending;

  MyData({
    required this.completed,
    required this.pending,
  });

  factory MyData.fromJson(Map<String, dynamic> json) => MyData(
        completed: json["completed"],
        pending: json["pending"],
      );

  Map<String, dynamic> toJson() => {
        "completed": completed,
        "pending": pending,
      };
}
