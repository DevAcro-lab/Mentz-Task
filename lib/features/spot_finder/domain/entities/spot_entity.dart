class SpotEntity {
  final String id;
  final String name;
  final String type;
  final bool? isBest;
  final String? parentName;


  const SpotEntity({
    required this.id,
    required this.name,
    required this.type,
    this.isBest,
    this.parentName,
  });
}