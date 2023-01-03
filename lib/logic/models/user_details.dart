import 'dart:math';

class UserModel {
  String? name;
  String? city;
  String? about;
  String? designation;
  String? experience;
  String? gender;
  String? github;
  String? interests;
  String? linkedin;
  String? organisation;
  String? phone;
  String? regID;
  String? regTime;
  String? state;
  String? twitter;
  String? website;
  String? email;
  bool? isApproved;
  bool? isAttending;
  bool? hasSwag;
  bool? hasFood;
  String? tshirt_size;
  String? food;

  // Constructor
  UserModel({
    this.name,
    this.city,
    this.about,
    this.designation,
    this.experience,
    this.gender,
    this.github,
    this.interests,
    this.linkedin,
    this.organisation,
    this.phone,
    this.regID,
    this.regTime,
    this.state,
    this.twitter,
    this.website,
    this.email,
    this.isApproved,
    this.isAttending,
    this.hasSwag,
    this.hasFood,
    this.tshirt_size,
    this.food,
  });

  // Data from Server

  factory UserModel.fromMap(Map<String,dynamic>? map) {
    return UserModel(
      name: map!["name"],
      city: map["city"],
      about: map["about"],
      designation: map["designation"],
      experience: map["experience"],
      gender: map["gender"],
      github: map["github"],
      interests: map["interests"],
      linkedin: map["linkedin"],
      organisation: map["organisation"],
      phone: map["phone"],
      regID: map["regID"],
      regTime: map["regTime"].toString(),
      state: map["state"],
      twitter: map["twitter"],
      website: map["website"],
      email: map["email"],
      isApproved: map["isApproved"],
      isAttending: map["isAttending"],
      hasSwag: map["hasSwag"],
      hasFood: map["hasFood"],
      tshirt_size: map["tshirt_size"],
      food: map["food"],
    );
  }

  // Sending data to server
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "city": city,
      "about": about,
      "designation": designation,
      "experience": experience,
      "gender": gender,
      "github": github,
      "interests": interests,
      "linkedin": linkedin,
      "organisation": organisation,
      "phone": phone,
      "regID": regID,
      "regTime": regTime,
      "state": state,
      "twitter": twitter,
      "website": website,
      "email": email,
      "isApproved": isApproved,
      "isAttending": isAttending,
      "hasSwag": hasSwag,
      "hasFood": hasFood,
      "tshirt_size": tshirt_size,
      "food": food,
    };
  }
}



// class UserDetails {
//   String? name;
//   String? city;
//   String? about;
//   String? designation;
//   String? experience;
//   String? gender;
//   String? github;
//   String? interests;
//   String? linkedin;
//   String? organisation;
//   String? phone;
//   String? regID;
//   String? regTime;
//   String? state;
//   String? twitter;
//   String? website;
//   String? email;
//   bool? isApproved;
//   bool? isAttending;
//   bool? hasSwag;
//   bool? hasFood;
//   String? tshirt_size;
//   String? food;

//   // Constructor
//   UserDetails({
//     this.name,
//     this.city,
//     this.about,
//     this.designation,
//     this.experience,
//     this.gender,
//     this.github,
//     this.interests,
//     this.linkedin,
//     this.organisation,
//     this.phone,
//     this.regID,
//     this.regTime,
//     this.state,
//     this.twitter,
//     this.website,
//     this.email,
//     this.isApproved,
//     this.isAttending,
//     this.hasSwag,
//     this.hasFood,
//     this.tshirt_size,
//     this.food,
//   });

//   // Map for UseDetails
//   UserDetails.fromJson(Map<String, dynamic> json) {
//     name = json["name"];
//     city = json["city"];
//     about = json["about"];
//     designation = json["designation"];
//     experience = json["experience"];
//     gender = json["gender"];
//     github = json["github"];
//     interests = json["interests"];
//     linkedin = json["linkedin"];
//     organisation = json["organisation"];
//     phone = json["phone"];
//     regID = json["regID"];
//     regTime = json["regTime"].toString();
//     state = json["state"];
//     twitter = json["twitter"];
//     website = json["website"];
//     email = json["email"];
//     isApproved = json["isApproved"];
//     isAttending = json["isAttending"];
//     hasSwag = json["hasSwag"];
//     hasFood = json["hasFood"];
//     tshirt_size = json["tshirt_size"];
//     food = json["food"];
//   }

//   Map<String, dynamic> toJson() {
//     // Object -> data
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["name"] = name;
//     data["city"] = city;
//     data["about"] = about;
//     data["designation"] = designation;
//     data["experience"] = experience;
//     data["gender"] = gender;
//     data["github"] = github;
//     data["interests"] = interests;
//     data["linkedin"] = linkedin;
//     data["organisation"] = organisation;
//     data["phone"] = phone;
//     data["regID"] = regID;
//     data["regTime"] = regTime;
//     data["state"] = state;
//     data["twitter"] = twitter;
//     data["website"] = website;
//     data["email"] = email;
//     data["isApproved"] = isApproved;
//     data["isAttending"] = isAttending;
//     data["hasSwag"] = hasSwag;
//     data["hasFood"] = hasFood;
//     data["tshirt_size"] = tshirt_size;
//     data["food"] = food;

//     return data;
//   }


// }
