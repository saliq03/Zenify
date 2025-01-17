
import 'package:spotify/common/helpers/user_prefrences.dart';

import '../../../service_locator.dart';
import '../usecase.dart';

class IsLoginUseCase implements UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async {
    return await sL<UserPreferences>().isLogin();
  }

  }

