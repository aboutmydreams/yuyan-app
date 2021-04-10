class TopicJson {
  List<TopicData> data;

  TopicJson({this.data});

  TopicJson.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TopicData>[];
      json['data'].forEach((v) {
        data.add(new TopicData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopicData {
  int id;
  int spaceId;
  int iid;
  String title;
  String format;
  int userId;
  int groupId;
  dynamic milestoneId;
  int assigneeId;
  int public;
  int commentsCount;
  int labelsCount;
  dynamic deletedAt;
  dynamic pinnedAt;
  dynamic closedAt;
  String createdAt;
  String updatedAt;
  User user;
  Group group;
  User assignee;
  dynamic milestone;
  List<Labels> labels;
  String sSerializer;

  TopicData(
      {this.id,
      this.spaceId,
      this.iid,
      this.title,
      this.format,
      this.userId,
      this.groupId,
      this.milestoneId,
      this.assigneeId,
      this.public,
      this.commentsCount,
      this.labelsCount,
      this.deletedAt,
      this.pinnedAt,
      this.closedAt,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.group,
      this.assignee,
      this.milestone,
      this.labels,
      this.sSerializer});

  TopicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    spaceId = json['space_id'];
    iid = json['iid'];
    title = json['title'];
    format = json['format'];
    userId = json['user_id'];
    groupId = json['group_id'];
    milestoneId = json['milestone_id'];
    assigneeId = json['assignee_id'];
    public = json['public'];
    commentsCount = json['comments_count'];
    labelsCount = json['labels_count'];
    deletedAt = json['deleted_at'];
    pinnedAt = json['pinned_at'];
    closedAt = json['closed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    assignee =
        json['assignee'] != null ? new User.fromJson(json['assignee']) : null;
    milestone = json['milestone'];
    if (json['labels'] != null) {
      labels = new List<Labels>();
      json['labels'].forEach((v) {
        labels.add(new Labels.fromJson(v));
      });
    }
    sSerializer = json['_serializer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['space_id'] = this.spaceId;
    data['iid'] = this.iid;
    data['title'] = this.title;
    data['format'] = this.format;
    data['user_id'] = this.userId;
    data['group_id'] = this.groupId;
    data['milestone_id'] = this.milestoneId;
    data['assignee_id'] = this.assigneeId;
    data['public'] = this.public;
    data['comments_count'] = this.commentsCount;
    data['labels_count'] = this.labelsCount;
    data['deleted_at'] = this.deletedAt;
    data['pinned_at'] = this.pinnedAt;
    data['closed_at'] = this.closedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    if (this.assignee != null) {
      data['assignee'] = this.assignee.toJson();
    }
    data['milestone'] = this.milestone;
    if (this.labels != null) {
      data['labels'] = this.labels.map((v) => v.toJson()).toList();
    }
    data['_serializer'] = this.sSerializer;
    return data;
  }
}

class User {
  int id;
  String type;
  String login;
  String name;
  String description;
  String avatar;
  String avatarUrl;
  String largeAvatarUrl;
  String mediumAvatarUrl;
  String smallAvatarUrl;
  int followersCount;
  int followingCount;
  int status;
  int public;
  dynamic scene;
  String createdAt;
  String updatedAt;
  bool isPaid;
  dynamic profile;
  String sSerializer;

  User(
      {this.id,
      this.type,
      this.login,
      this.name,
      this.description,
      this.avatar,
      this.avatarUrl,
      this.largeAvatarUrl,
      this.mediumAvatarUrl,
      this.smallAvatarUrl,
      this.followersCount,
      this.followingCount,
      this.status,
      this.public,
      this.scene,
      this.createdAt,
      this.updatedAt,
      this.isPaid,
      this.profile,
      this.sSerializer});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    login = json['login'];
    name = json['name'];
    description = json['description'];
    avatar = json['avatar'];
    avatarUrl = json['avatar_url'];
    largeAvatarUrl = json['large_avatar_url'];
    mediumAvatarUrl = json['medium_avatar_url'];
    smallAvatarUrl = json['small_avatar_url'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    status = json['status'];
    public = json['public'];
    scene = json['scene'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isPaid = json['isPaid'];
    profile = json['profile'];
    sSerializer = json['_serializer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['login'] = this.login;
    data['name'] = this.name;
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['avatar_url'] = this.avatarUrl;
    data['large_avatar_url'] = this.largeAvatarUrl;
    data['medium_avatar_url'] = this.mediumAvatarUrl;
    data['small_avatar_url'] = this.smallAvatarUrl;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    data['status'] = this.status;
    data['public'] = this.public;
    data['scene'] = this.scene;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isPaid'] = this.isPaid;
    data['profile'] = this.profile;
    data['_serializer'] = this.sSerializer;
    return data;
  }
}

class Group {
  int id;
  String type;
  String login;
  String name;
  String description;
  String avatarUrl;
  int public;
  String scene;
  String createdAt;
  String updatedAt;
  int organizationId;
  bool isPaid;
  dynamic organization;
  dynamic owners;
  String sSerializer;

  Group(
      {this.id,
      this.type,
      this.login,
      this.name,
      this.description,
      this.avatarUrl,
      this.public,
      this.scene,
      this.createdAt,
      this.updatedAt,
      this.organizationId,
      this.isPaid,
      this.organization,
      this.owners,
      this.sSerializer});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    login = json['login'];
    name = json['name'];
    description = json['description'];
    avatarUrl = json['avatar_url'];
    public = json['public'];
    scene = json['scene'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    organizationId = json['organization_id'];
    isPaid = json['isPaid'];
    organization = json['organization'];
    owners = json['owners'];
    sSerializer = json['_serializer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['login'] = this.login;
    data['name'] = this.name;
    data['description'] = this.description;
    data['avatar_url'] = this.avatarUrl;
    data['public'] = this.public;
    data['scene'] = this.scene;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['organization_id'] = this.organizationId;
    data['isPaid'] = this.isPaid;
    data['organization'] = this.organization;
    data['owners'] = this.owners;
    data['_serializer'] = this.sSerializer;
    return data;
  }
}

class Labels {
  int id;
  String name;
  String color;
  String createdAt;
  String updatedAt;
  String sSerializer;

  Labels(
      {this.id,
      this.name,
      this.color,
      this.createdAt,
      this.updatedAt,
      this.sSerializer});

  Labels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sSerializer = json['_serializer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['_serializer'] = this.sSerializer;
    return data;
  }
}
