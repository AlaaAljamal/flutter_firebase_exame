class MyUser{
 late String id;
 late String name;
 late String email;
 late String password;

 MyUser();

 toMap(){
  return{
    'name':this.name,
    'id':this.id,
    'email':this.email,
    'password':this.password
  };}

  MyUser.fromMap(var map){
  this.password = map['password'];
  this.id = map['id'];
  this.name = map['name'];
  this.email = map['email'];
  }


}