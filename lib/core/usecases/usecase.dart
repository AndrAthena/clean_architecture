import '../resources/result.dart';

abstract class UseCase<Error, Output, Input> {
  Future<Result<Error, Output>> call(Input? input);
}
