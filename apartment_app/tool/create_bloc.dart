import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart run tool/create_bloc.dart Login');
    exit(1);
  }

  final pascalName = args.first;
  final snakeName = _toSnakeCase(pascalName);

  final directory = Directory(snakeName);

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  File('${directory.path}/${snakeName}_bloc.dart').writeAsStringSync('''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part '${snakeName}_event.dart';
part '${snakeName}_state.dart';

class ${pascalName}Bloc extends Bloc<${pascalName}Event, ${pascalName}State> {
  ${pascalName}Bloc() : super(${pascalName}Initial()) {
    on<${pascalName}Event>((event, emit) {});
  }
}
''');

  File('${directory.path}/${snakeName}_event.dart').writeAsStringSync('''
part of '${snakeName}_bloc.dart';

sealed class ${pascalName}Event extends Equatable {
  const ${pascalName}Event();

  @override
  List<Object?> get props => [];
}
''');

  File('${directory.path}/${snakeName}_state.dart').writeAsStringSync('''
part of '${snakeName}_bloc.dart';

sealed class ${pascalName}State extends Equatable {
  const ${pascalName}State();

  @override
  List<Object?> get props => [];
}

final class ${pascalName}Initial extends ${pascalName}State {}
final class ${pascalName}Loading extends ${pascalName}State {}
final class ${pascalName}Failure extends ${pascalName}State {}
final class ${pascalName}Success extends ${pascalName}State {}
''');

  print('✅ ${pascalName}Bloc created successfully!');
}

String _toSnakeCase(String input) {
  return input
      .replaceAllMapped(
        RegExp(r'([a-z0-9])([A-Z])'),
        (match) => '${match.group(1)}_${match.group(2)}',
      )
      .toLowerCase();
}
