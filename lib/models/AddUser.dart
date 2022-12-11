class User {
  int? id;
  String? fname;
  String? lname;
  String? contact;

  //converting user data in to a map

  userMap() {
    //variable decleration
    var mapping = Map<String, dynamic>();
    // auto assigned when user is not netering data manually
    mapping['id'] = id ?? null;
    //cannto be null == fname!
    mapping['fname'] = fname!;
    mapping['lname'] = lname!;
    mapping['contact'] = contact!;
    return mapping;
  }

  // Map<String, Object?> toMap() {}
}
