import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/platform.dart';

part 'system_requirement.freezed.dart';

enum SystemRequirementType {
  minimum,
  recommended,
}

@freezed
class SystemRequirement with _$SystemRequirement {
  const factory SystemRequirement({
    required SystemRequirementType type,
    required Platform platform,
    required List<String> params,
  }) = _SystemRequirement;
}
