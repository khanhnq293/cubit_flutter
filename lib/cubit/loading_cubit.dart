import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);
  void setLoading() => emit(true);
  void setUnLoading() => emit(false);
}
