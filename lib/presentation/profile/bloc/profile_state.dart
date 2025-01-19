part of 'profile_bloc.dart';

class ProfileState extends Equatable{
  final Status status;
  final String name, email, image;
  final List<SongEntity> favourites;
  final Status favouritesStatus;
 const ProfileState({
    this.status=Status.loading,
   this.name='',this.email='',this.image='',
   this.favourites=const[],
   this.favouritesStatus=Status.loading
});

 ProfileState copyWith({Status? status,String? name, String? email, String? image,List<SongEntity>? favourites, Status? favouritesStatus}){

   return ProfileState(
     status: status?? this.status,
     name: name?? this.name,
     email: email?? this.email,
     image: image?? this.image,
     favourites: favourites?? this.favourites,
     favouritesStatus: favouritesStatus?? this.favouritesStatus
   );
 }

  @override
  List<Object?> get props => [status, name, email, image,favourites,favouritesStatus];

}
