import '../../domain/entities/spot_entity.dart';

class SpotModel extends SpotEntity {
  const SpotModel({
    required super.id,
    required super.name,
    required super.type,
    super.isBest,
    super.parentName,
  });

  factory SpotModel.fromMap(Map<String, dynamic> map) {
    final parent = map['parent'] as Map<String, dynamic>?;
    return SpotModel(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      isBest: map['isBest'] is bool ? map['isBest'] : null,
      parentName: parent?['name']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'isBest': isBest,
      'parentName': parentName,
    };
  }
}
