part of 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUsers();
  }

  UsersService usersService = UsersService();

  Future<void> getUsers() async {
    emit(HomeLoadingState());
    await usersService.getUsers().then((dynamic response) {
      if (response is List<UsersModel>) {
        emit(HomeCompleteState(response));
      } else {
        emit(HomeErrorState(response));
      }
    });
  }
}
