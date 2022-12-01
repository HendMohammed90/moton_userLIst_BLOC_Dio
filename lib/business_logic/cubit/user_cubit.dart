import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moton_users_bloc_api/data/models/user_model.dart';
import 'package:moton_users_bloc_api/data/repo/user_repo.dart';

part 'user_state.dart';

class CharacterCubit extends Cubit<UserState> {
  CharacterCubit(this.userRepo) : super(UserInitial());
  final UserRepo userRepo;
  List<dynamic> resultList = [];
  List<dynamic> getAllCharacter() {
    userRepo.getAllUsers().then((list) {
      emit(UserLoaded((list)));
      resultList = list;
    });
    return resultList;
  }
}
