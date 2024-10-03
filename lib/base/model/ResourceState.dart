class ResourceState<T> {

  final T? data;
  final bool isSuccess;
  final ErrorState? error;
  final bool isLoading;
  final bool isError;

  ResourceState({
    this.data,
    this.isSuccess = false,
    this.error,
    this.isLoading = false,
    this.isError = false,
  });
}

class ErrorState<ErrorData>{
  final String errorMessage;
  final ErrorData? errorBbone;

  ErrorState({required this.errorMessage, this.errorBbone});
}

