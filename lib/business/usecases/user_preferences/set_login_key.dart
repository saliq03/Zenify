import 'package:spotify/business/usecases/usecase.dart';
import 'package:spotify/common/helpers/user_prefrences.dart';

import '../../../service_locator.dart';

class SetLoginKeyUseCase implements UseCase<void,bool>{
  @override
  Future<void> call({bool? params}) async{
  await sL<UserPreferences>().setLoginKey(params!);
  }

}