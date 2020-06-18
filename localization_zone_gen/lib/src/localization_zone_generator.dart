import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'package:localization_zone_annotations/localization_zone_annotations.dart';

class LocalizationZoneGenerator extends GeneratorForAnnotation<LocalizationZone> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }
}
 