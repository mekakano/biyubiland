class Child {
  int? id;
  int? userId;
  String? fullname;
  String? birthDate;
  String? gender;
  String? notes;
  String? createdDtm;
  String? createdBy;
  int? weightBorn;
  int? lengthBorn;
  int? headDiameterBorn;

  Child(
      {this.id,
      this.userId,
      this.fullname,
      this.birthDate,
      this.gender,
      this.notes,
      this.createdDtm,
      this.createdBy,
      this.weightBorn,
      this.lengthBorn,
      this.headDiameterBorn});

  Child.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    fullname = json['fullname'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    notes = json['notes'];
    createdDtm = json['createdDtm'];
    createdBy = json['createdBy'];
    weightBorn = json['weightBorn'];
    lengthBorn = json['lengthBorn'];
    headDiameterBorn = json['headDiameterBorn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['fullname'] = this.fullname;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['notes'] = this.notes;
    data['createdDtm'] = this.createdDtm;
    data['createdBy'] = this.createdBy;
    data['weightBorn'] = this.weightBorn;
    data['lengthBorn'] = this.lengthBorn;
    data['headDiameterBorn'] = this.headDiameterBorn;
    return data;
  }
}
