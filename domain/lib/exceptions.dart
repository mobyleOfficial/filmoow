abstract class FilmoowException implements Exception {}

class GenericException implements FilmoowException {}

class NoConnectionException implements FilmoowException {}

class UnauthorizedException implements FilmoowException {}

class UseCaseParamsNeededException implements FilmoowException {}

class EmptyFormFieldException implements FilmoowException {}