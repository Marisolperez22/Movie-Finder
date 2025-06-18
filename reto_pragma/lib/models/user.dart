class User {
    final int id;
    final Name name;
    final String phone;
    final String email;
    final String username;
    final Address address;
    final String password;

    User({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.address,
        required this.username,
        required this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "id": id,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "name": name.toJson(),
    };
}

class Address {
    final int number;
    final String city;
    final String street;
    final String zipcode;
    final Geolocation geolocation;

    Address({
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
        required this.geolocation,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: Geolocation.fromJson(json["geolocation"]),
    );

    Map<String, dynamic> toJson() => {
        "geolocation": geolocation.toJson(),
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
    };
}

class Geolocation {
    final String lat;
    final String long;

    Geolocation({
        required this.lat,
        required this.long,
    });

    factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"],
        long: json["long"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}

class Name {
    final String firstname;
    final String lastname;

    Name({
        required this.firstname,
        required this.lastname,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
    };
}
