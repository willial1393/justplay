class User {
  String? uid;
  String? email;
  String? name;

  String? country;
  String? state;
  String? city;
  String? game;

  User({
    this.uid,
    this.email,
    this.name,
    this.country,
    this.state,
    this.city,
    this.game,
  });

  Map<String, String?> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'country': country,
      'state': state,
      'city': city,
      'game': game,
    };
  }

  User fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      game: json['game'],
    );
  }

  User copyWith({
    String? uid,
    String? email,
    String? name,
    String? country,
    String? state,
    String? city,
    String? game,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      game: game ?? this.game,
    );
  }
}
