abstract class NewsResponseState {}

class NewsResponseLoading extends NewsResponseState {}

class NewsResponseSuccess extends NewsResponseState {
  final Object data;

  NewsResponseSuccess({ required this.data });

}

class NewsResponseError extends NewsResponseState {
  final Exception error;

  NewsResponseError({ required this.error });

  String getMessage() {
    return error.toString();
  }
}