import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/domain/entity/platform.dart';

part 'system_requirement.freezed.dart';

enum SystemRequirementType {
  minimum,
  recommended,
}

@freezed
class SystemRequirement with _$SystemRequirement {
  const SystemRequirement._();

  const factory SystemRequirement({
    required SystemRequirementType type,
    required Platform platform,
    required List<String> params,
  }) = _SystemRequirement;

  factory SystemRequirement.fromMap(Map<String, dynamic> json) =>
      SystemRequirement(
        type: SystemRequirementType.values.firstWhere((element) {
          return element.toString().contains(json['type'] as String);
        }),
        platform: Utils.platformFromName(json['platform']),
        params:
            (json['params'] as List<dynamic>).map((e) => e as String).toList(),
      );

  Map<String, dynamic> toMap() => {
        'type': type.toString(),
        'platform': Utils.platformToName(platform),
        'params': params,
      };
}
