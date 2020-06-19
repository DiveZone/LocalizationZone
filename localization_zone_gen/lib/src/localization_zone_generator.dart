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
    if (element is! ClassElement) throw "$element is not a ClassElement";
    final ClassElement classElement = element as ClassElement;

    final String folder = annotation.read('folder').stringValue;
    final List<String> locales = annotation.read('locales').listValue.cast<String>();

    return '''
    ${_delegate(classElement, locales)}

    extension ${classElement.name}LocalizeZoneExtension on ${classElement.name} {
      

    }
    ''';
  }

  String _delegate(ClassElement classElement, List<String> locales) {
    String delegateName = '_${classElement.name}Delegate';
    String delegateConst = classElement.name.substring(0,1).toLowerCase() + classElement.name.substring(1) + 'Delegate';
    return '''
    class ${delegateName} extends LocalizationsDelegate<${classElement.name}> {
      const ${delegateName}();

      @override
      bool isSupported(Locale locale) {
        return ['en', 'nl'].contains(locale.languageCode);
      }

      @override
      Future<${classElement.name}> load(Locale locale) async {
        return null;
      }

      @override
      bool shouldReload(${delegateName} old) => false;
    }

    const LocalizationsDelegate<${classElement.name}> ${delegateConst} =
      _${classElement.name}Delegate();
    ''';
  }
}
 