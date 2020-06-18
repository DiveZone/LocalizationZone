library localization_zone_gen.builder;

import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:source_gen/source_gen.dart' show SharedPartBuilder;

import 'src/localization_zone_generator.dart';

Builder localizationZone(BuilderOptions _) => SharedPartBuilder(
  [LocalizationZoneGenerator()],
  'localizationZone'
);