class Sermon {
  List<Map<String, dynamic>>? contentJson;
  bool? haveOffline;
  String? publishStatus;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? youtubeId;
  String? youtubeURL;
  String? thumbnailURL;
  String? slug;
  String? sermonDate;
  List<TimeList>? timeList;
  String? id;

  Sermon({
    this.contentJson,
    this.haveOffline,
    this.publishStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.youtubeId,
    this.youtubeURL,
    this.thumbnailURL,
    this.slug,
    this.sermonDate,
    this.timeList,
    this.id,
  });

  factory Sermon.fromJson(Map<String, dynamic> json) {
    // if (json['contentJson'] != null) {
    //   contentJson = <Map<String, dynamic>>[];
    //   json['contentJson'].forEach((v) {
    //     contentJson!.add(Map<String, dynamic>.fromJson(v));
    //   });
    // }
    // if (json['timeList'] != null) {
    //   timeList = <TimeList>[];
    //   json['timeList'].forEach((v) {
    //     timeList!.add(TimeList.fromJson(v));
    //   });
    // }
    return Sermon(
      haveOffline: json['haveOffline'],
      publishStatus: json['publishStatus'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      title: json['title'],
      description: json['description'],
      youtubeId: json['youtubeId'],
      youtubeURL: json['youtubeURL'],
      thumbnailURL: json['thumbnailURL'],
      slug: json['slug'],
      sermonDate: json['sermonDate'],
      id: json['id'],
      timeList: json['timeList'] != null
          ? (json['timeList'] as List)
              .map((timeList) => TimeList.fromJson(timeList))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (contentJson != null) {
    //   data['contentJson'] = contentJson!.map((v) => v.toJson()).toList();
    // }
    data['haveOffline'] = haveOffline;
    data['publishStatus'] = publishStatus;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['title'] = title;
    data['description'] = description;
    data['youtubeId'] = youtubeId;
    data['youtubeURL'] = youtubeURL;
    data['thumbnailURL'] = thumbnailURL;
    data['slug'] = slug;
    data['sermonDate'] = sermonDate;
    if (timeList != null) {
      data['timeList'] = timeList!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}

class TimeList {
  String? sId;
  String? availableTime;
  int? maxQuota = 0;
  int? availableQuota = 0;

  TimeList({
    this.sId,
    this.availableTime,
    this.maxQuota,
    this.availableQuota,
  });

  TimeList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    availableTime = json['availableTime'];
    maxQuota = json['maxQuota'];
    availableQuota = json['availableQuota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['availableTime'] = availableTime;
    data['maxQuota'] = maxQuota;
    data['availableQuota'] = availableQuota;
    return data;
  }
}
