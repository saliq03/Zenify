import 'package:spotify/business/usecases/usecase.dart';
import 'package:spotify/common/helpers/user_prefrences.dart';

import '../../../service_locator.dart';

class ClearUserUseCase implements UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async {
    return await sL<UserPreferences>().removeUser();
  }

}