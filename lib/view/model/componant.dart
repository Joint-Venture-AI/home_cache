class Component {
  final String name;
  final List<String> types;
  final List<String> materials;
  final List<String> additionalFields;
  final bool regularServiceNeeded;
  final String recommendedServiceCadence;
  final String season;
  final String reminderLeadTime;
  final String initialAlert;
  final String reminderAlert;

  Component({
    required this.name,
    required this.types,
    required this.materials,
    required this.additionalFields,
    required this.regularServiceNeeded,
    required this.recommendedServiceCadence,
    required this.season,
    required this.reminderLeadTime,
    required this.initialAlert,
    required this.reminderAlert,
  });
}
