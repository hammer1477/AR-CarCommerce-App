import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';



class User extends Equatable {
  final String? id;
  final String email;
  final String name;


  const User({
    this.id,
    this.email = '',
    this.name = ''
  });

  User copyWith({
    String? id,
    String? email,
    String? name
}) {
    return User(id: id ?? this.id, email: email?? this.email, name: name?? this.name);
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    return User(
      id: snapshot.id,
      email: snapshot['email'],
      name: snapshot['name'],
    );

  }

  Map<String, Object> toDocument() {
    return{
      'email': email,
      'name': name
    };
  }


  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name];

}