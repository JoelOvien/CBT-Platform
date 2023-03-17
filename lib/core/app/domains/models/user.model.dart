class User {
  String? createdAt;
  String? phoneNumberVerified;
  String? profileType;
  dynamic isAvailable;
  String? profilePicUrl;
  String? bioParam;
  Address? address;
  String? email;
  List<RelativeCategories>? relativeCategories;
  List<JobRatings>? jobRatings;
  String? adminVerified;
  String? emailVerified;
  String? updatedAt;
  List<dynamic>? displayJobs;
  String? profileName;
  String? userId;
  String? lastName;
  String? firstName;
  String? profileId;
  String? personaInquiryId;
  String? profileStatus;
  String? walletId;
  String? nextAvailableDate;
  String? phone;

  User({
    this.createdAt,
    this.phoneNumberVerified,
    this.profileType,
    this.isAvailable,
    this.profilePicUrl,
    this.bioParam,
    this.address,
    this.email,
    this.relativeCategories,
    this.jobRatings,
    this.adminVerified,
    this.emailVerified,
    this.updatedAt,
    this.displayJobs,
    this.profileName,
    this.userId,
    this.lastName,
    this.firstName,
    this.profileId,
    this.personaInquiryId,
    this.profileStatus,
    this.walletId,
    this.nextAvailableDate,
    this.phone,
  });

  User.fromJson(Map<dynamic, dynamic> json) {
    createdAt = json['created_at'];
    phoneNumberVerified = json['phone_number_verified'];
    profileType = json['profile_type'];
    isAvailable = json["is_available"];
    profilePicUrl = json['profile_pic_url'];
    bioParam = json['bio_param'];

    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    email = json['email'];
    if (json['relative_categories'] != null) {
      relativeCategories = <RelativeCategories>[];
      json['relative_categories'].forEach((v) {
        relativeCategories!.add(RelativeCategories.fromJson(v));
      });
    }

    if (json['job_ratings'] != null) {
      jobRatings = <JobRatings>[];
      json['job_ratings'].forEach((v) {
        jobRatings!.add(JobRatings.fromJson(v));
      });
    }
    adminVerified = json['admin_verified'];
    emailVerified = json['email_verified'];
    updatedAt = json['updated_at'];
    displayJobs = json['display_jobs'];
    profileName = json['profile_name'];
    userId = json['user_id'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    profileId = json['profile_id'];
    personaInquiryId = json['persona_inquiry_id'];
    profileStatus = json['profile_status'];
    walletId = json['wallet_id'];
    phone = json['phone'];
    nextAvailableDate = json['"next_available_date"'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['phone_number_verified'] = phoneNumberVerified;
    data['profile_type'] = profileType;
    data["is_available"] = isAvailable;
    data['profile_pic_url'] = profilePicUrl;
    data['bio_param'] = bioParam;

    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['email'] = email;
    if (relativeCategories != null) {
      data['relative_categories'] = relativeCategories!.map((v) => v.toJson()).toList();
    }
    if (jobRatings != null) {
      data['job_ratings'] = jobRatings!.map((v) => v.toJson()).toList();
    }
    data['admin_verified'] = adminVerified;
    data['email_verified'] = emailVerified;
    data['updated_at'] = updatedAt;
    data['display_jobs'] = displayJobs;
    data['profile_name'] = profileName;
    data['user_id'] = userId;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['profile_id'] = profileId;
    data['persona_inquiry_id'] = personaInquiryId;
    data['profile_status'] = profileStatus;
    data['wallet_id'] = walletId;
    data['phone'] = phone;
    data['"next_available_date"'] = nextAvailableDate;
    return data;
  }
}

class JobRatings {
  String? jobRating;
  String? jobTitle;
  String? jobReview;
  String? jobId;

  JobRatings({this.jobRating, this.jobTitle, this.jobReview, this.jobId});

  JobRatings.fromJson(Map<dynamic, dynamic> json) {
    jobRating = json['job_rating'];
    jobTitle = json['job_title'];
    jobReview = json['job_review'];
    jobId = json['job_id'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['job_rating'] = jobRating;
    data['job_title'] = jobTitle;
    data['job_review'] = jobReview;
    data['job_id'] = jobId;
    return data;
  }
}

class Address {
  String? zip;
  String? state;
  String? city;
  String? street;
  String? latitude;
  String? longitude;

  Address({
    this.zip,
    this.state,
    this.city,
    this.street,
    this.latitude,
    this.longitude,
  });

  Address.fromJson(Map<dynamic, dynamic> json) {
    zip = json['zip'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zip'] = zip;
    data['state'] = state;
    data['city'] = city;
    data['street'] = street;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class RelativeCategories {
  String? catId;
  String? parentCatId;
  dynamic subCategories;
  String? catName;
  String? catDesc;
  String? catType;

  RelativeCategories({
    this.catId,
    this.parentCatId,
    this.subCategories,
    this.catName,
    this.catDesc,
    this.catType,
  });

  RelativeCategories.fromJson(Map<dynamic, dynamic> json) {
    catId = json['cat_id'];
    parentCatId = json['parent_cat_id'];
    subCategories = json['sub_categories'];
    catName = json['cat_name'];
    catDesc = json['cat_desc'];
    catType = json['cat_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat_id'] = catId;
    data['parent_cat_id'] = parentCatId;
    data['sub_categories'] = subCategories;
    data['cat_name'] = catName;
    data['cat_desc'] = catDesc;
    data['cat_type'] = catType;
    return data;
  }
}
