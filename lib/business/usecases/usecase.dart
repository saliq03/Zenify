abstract class UseCase<Type,Params> {  //Generics
  Future<Type> call({Params params});
}