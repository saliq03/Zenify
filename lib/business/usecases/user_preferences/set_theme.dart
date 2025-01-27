import '../../../common/helpers/user_prefrences.dart';
import '../../../service_locator.dart';
import '../usecase.dart';

class SetThemeUseCase implements UseCase<void,bool>{
  @override
  Future<void> call({bool? params}) async{
    await sL<UserPreferences>().setTheme(params!);
  }

}