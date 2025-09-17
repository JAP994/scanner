class ServiceModel {
  final String name;
  final String description;

  ServiceModel({required this.name, required this.description});

  factory ServiceModel.fromMap(Map<String, dynamic> json) {
    return ServiceModel(name: json['name'], description: json['description']);
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "description": description};
  }
}
