class UserModel {
  User? user;
  List<Report>? reports;

  UserModel({this.user, this.reports});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['reports'] != null) {
      reports = [];
      json['reports'].forEach((v) {
        reports!.add(Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (reports != null) {
      data['reports'] = reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? image;
  int? isPhoneVerified;
  String? emailVerifiedAt;
  String? emailVerificationToken;
  String? cmFirebaseToken;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? orderCount;
  String? empId;
  int? departmentId;
  int? isVeg;
  int? isSatOpted;
  String? deviceId;
  int? isInvalidDevice;
  int? isBreakfast;
  int? isLunch;
  int? isDinner;

  User({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    this.cmFirebaseToken,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.orderCount,
    this.empId,
    this.departmentId,
    this.isVeg,
    this.isSatOpted,
    this.deviceId,
    this.isInvalidDevice,
    this.isBreakfast,
    this.isLunch,
    this.isDinner,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    isPhoneVerified = json['is_phone_verified'];
    emailVerifiedAt = json['email_verified_at'];
    emailVerificationToken = json['email_verification_token'];
    cmFirebaseToken = json['cm_firebase_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    orderCount = json['order_count'];
    empId = json['emp_id'];
    departmentId = json['department_id'];
    isVeg = json['is_veg'];
    isSatOpted = json['is_sat_opted'];
    deviceId = json['device_id'];
    isInvalidDevice = json['is_invalid_device'];
    isBreakfast = json['is_breakfast'];
    isLunch = json['is_lunch'];
    isDinner = json['is_dinner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['phone'] = phone;
    data['email'] = email;
    data['image'] = image;
    data['is_phone_verified'] = isPhoneVerified;
    data['email_verified_at'] = emailVerifiedAt;
    data['email_verification_token'] = emailVerificationToken;
    data['cm_firebase_token'] = cmFirebaseToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['order_count'] = orderCount;
    data['emp_id'] = empId;
    data['department_id'] = departmentId;
    data['is_veg'] = isVeg;
    data['is_sat_opted'] = isSatOpted;
    data['device_id'] = deviceId;
    data['is_invalid_device'] = isInvalidDevice;
    data['is_breakfast'] = isBreakfast;
    data['is_lunch'] = isLunch;
    data['is_dinner'] = isDinner;
    return data;
  }
}

class Report {
  String? date;
  OptIns? optIns;

  Report({this.date, this.optIns});

  Report.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['opt_ins'] == null || json['opt_ins'] is List) {
      optIns = OptIns(); // Empty object for null or empty list
    } else if (json['opt_ins'] is Map<String, dynamic>) {
      optIns = OptIns.fromJson(json['opt_ins']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (optIns != null) {
      data['opt_ins'] = optIns!.toJson();
    }
    return data;
  }
}

class OptIns {
  String? breakfast;
  String? lunch;
  String? dinner;

  OptIns({this.breakfast, this.lunch, this.dinner});

  OptIns.fromJson(Map<String, dynamic> json) {
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    return data;
  }
}
