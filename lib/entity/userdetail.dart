import 'package:biyubi/Mapper/user.dart';
import 'package:biyubi/entity/child.dart';

class UserDetail {
  int? id;
  String? username;
  String? password;
  String? fullname;
  String? address;
  String? email;
  String? phoneNo;
  String? status;
  String? createdDtm;
  String? createdBy;

  UserDetail(
      {this.id,
      this.username,
      this.password,
      this.fullname,
      this.address,
      this.email,
      this.phoneNo,
      this.status,
      this.createdDtm,
      this.createdBy});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    fullname = json['fullname'];
    address = json['address'];
    email = json['email'];
    phoneNo = json['phone_no'];
    status = json['status'];
    createdDtm = json['createdDtm'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['status'] = this.status;
    data['createdDtm'] = this.createdDtm;
    data['createdBy'] = this.createdBy;

    return data;
  }
}
