/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmFlZTQwNmYyOGVhZTI4NjFiYTM2YiIsImlhdCI6MTc0MDMwMzkzNiwiZXhwIjoxNzQwOTA4NzM2fQ.Cue6HRsMzHW_Qh70hXcBj_Bs-WmOeq0rHWHJnHYCnv4"
/// user : {"username":"user1","email":"abc@gmail.com","password":"$2b$10$inwG4IzmWB/Qb1QLYZz71u98.AiUGUBbTh.W885YT67x0H140MsyK","_id":"67baee406f28eae2861ba36b","createdAt":"2025-02-23T09:45:36.831Z","updatedAt":"2025-02-23T09:45:36.831Z","__v":0}

class AuthUser {
  AuthUser({
    String? token,
    User? user,
  }) {
    _token = token;
    _user = user;
  }

  AuthUser.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? _token;
  User? _user;

  AuthUser copyWith({String? token, User? user}) =>
      AuthUser(token: token ?? _token, user: user ?? _user);

  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}
/// username : "user1"
/// email : "abc@gmail.com"
/// password : "$2b$10$inwG4IzmWB/Qb1QLYZz71u98.AiUGUBbTh.W885YT67x0H140MsyK"
/// _id : "67baee406f28eae2861ba36b"
/// createdAt : "2025-02-23T09:45:36.831Z"
/// updatedAt : "2025-02-23T09:45:36.831Z"
/// __v : 0

class User {
  User({
      String? username, 
      String? email, 
      String? password, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _username = username;
    _email = email;
    _password = password;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  User.fromJson(dynamic json) {
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _username;
  String? _email;
  String? _password;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
User copyWith({  String? username,
  String? email,
  String? password,
  String? id,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => User(  username: username ?? _username,
  email: email ?? _email,
  password: password ?? _password,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get username => _username;
  String? get email => _email;
  String? get password => _password;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}