import '../../../common/helpers/user_prefrences.dart';
import '../../../service_locator.dart';
import '../usecase.dart';

class IsDarkModeUseCase implements UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async {
    return await sL<UserPreferences>().isDarkMode();
  }

}