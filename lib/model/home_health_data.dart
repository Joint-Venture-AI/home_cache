class HomeHealthModel {
  final double health;
  final double totalTasks;
  final double completedTasks;

  HomeHealthModel({
    required this.health,
    required this.totalTasks,
    required this.completedTasks,
  });

  factory HomeHealthModel.fromJson(Map<String, dynamic> json) {
    return HomeHealthModel(
      health: (json['health'] as num).toDouble(),
      totalTasks: (json['totalTasks'] as num).toDouble(),
      completedTasks: (json['completedTasks'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'health': health,
      'totalTasks': totalTasks,
      'completedTasks': completedTasks,
    };
  }
}

class MyData {
  final int completed;
  final int pending;

  MyData({
    required this.completed,
    required this.pending,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      completed: json['completed'],
      pending: json['pending'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
      'pending': pending,
    };
  }
}
