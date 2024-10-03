import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/ResourceState.dart';

abstract class BaseCubit<Request, Response>
    extends Cubit<ResourceState<Response>> {
  BaseCubit() : super(ResourceState());

  Future<void> process(Future<Response> Function() process) async {
    emit(ResourceState(isLoading: true));
    try {
      final response = await process();
      emit(ResourceState(data: response, isSuccess: true));
    } catch (e) {
      emit(ResourceState(
          error: ErrorState(
            errorMessage: e.toString(),
          ),
          isError: true));
    }
  }

  // update content manual use this
  void updateContent(Response response) {
    emit(ResourceState(data: response, isSuccess: true));
  }

  void execute(Request request);
}
