import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart run tool/create_feature.dart <feature_name>');
    exit(1);
  }

  final featureName = _toSnakeCase(args.first);

  final directories = [
    'lib/features/$featureName/data/data_source',
    'lib/features/$featureName/data/models',
    'lib/features/$featureName/data/repository',
    'lib/features/$featureName/domain/entities',
    'lib/features/$featureName/domain/repository',
    'lib/features/$featureName/domain/use_case',
    'lib/features/$featureName/presentation/bloc',
    'lib/features/$featureName/presentation/screens',
    'lib/features/$featureName/presentation/widgets',
  ];

  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
  }

  print('✅ Feature "$featureName" created successfully.');
}

String _toSnakeCase(String input) {
  return input
      .replaceAllMapped(
        RegExp(r'([a-z0-9])([A-Z])'),
        (match) => '${match.group(1)}_${match.group(2)}',
      )
      .replaceAll(' ', '_')
      .toLowerCase();
}
