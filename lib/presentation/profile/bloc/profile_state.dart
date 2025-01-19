part of 'profile_bloc.dart';

class ProfileState extends Equatable{
  final Status status;
  final String name, email, image;
 const ProfileState({
    this.status=Status.loading,
   this.name='',this.email='',this.image=''
});

 ProfileState copyWith({Status? status,String? name, String? email, String? image}){
   return ProfileState(
     status: status?? this.status,
     name: name?? this.name,
     email: email?? this.email,
     image: image?? this.image
   );
 }

  @override
  List<Object?> get props => [status, name, email, image];

}
