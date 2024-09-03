class AdsData {
  AdsData({
    this.admobfull,
    this.admobbanner,
    this.admobreward,
    this.admobopen,
    this.admobnative,
    this.androindIntraval,
    this.androindBanner,
    this.andriondgoogleNative,
    this.fbfull,
    this.fbbanner,
    this.fbnative,
    this.click,
    this.clickflag,
    this.adflag,
    this.adstyle,
    this.adtime,
    this.splash,
    this.adstatus,
    this.androindStatus,
    this.iosStatus,
    this.androindKey,
    this.iosKey,
    this.front,
    this.pp,});

  AdsData.fromJson(dynamic json) {
    admobfull = json['splashFull'];
    admobreward=json['googleReward'];
    admobbanner = json['googleBanner'];
    admobopen = json['googleOpen'];
    admobnative = json['googleNative'];
    androindIntraval = json['androindIntrstitial'];
    androindBanner = json['androindBanner'];
    andriondgoogleNative = json['andriondgoogleNative'];
    andriondOpen = json['androindOpen'];
    fbfull = json['fb-full'];
    fbbanner = json['fb-banner'];
    fbnative = json['fb-native'];
    click = json['click'];
    clickflag = json['clickFlag'];
    adflag = json['adFlag'];
    adstyle = json['adStyle'];
    adtime = json['adTime'];
    splash = json['splash'];
    adstatus = json['adStatus'];
    androindStatus = json['androindStatus'];
    iosStatus = json['iosStatus'];
    androindKey = json['androindKey'];
    iosKey= json['iosKey'];
    front = json['front'];
    pp = json['pp'];
  }
  String? admobfull;
  String? admobreward;
  String? admobbanner;
  String? admobopen;
  String? admobnative;
  String? androindIntraval;
  String? androindBanner;
  String? andriondgoogleNative;
  String? andriondOpen;
  String? fbfull;
  String? fbbanner;
  String? fbnative;
  String? click;
  String?clickflag;
  String? adflag;
  String? adstyle;
  String? adtime;
  String? splash;
  String? adstatus;
  String? androindStatus;
  String? iosStatus;
  String? androindKey;
  String? iosKey;
  String? front;
  String? pp;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['splashFull'] = admobfull;
    map['googleReward'] = admobreward;
    map['googleBanner'] = admobbanner;
    map['googleOpen'] = admobopen;
    map['googleNative'] = admobnative;
    map['androindIntrstitial'] = androindIntraval;
    map['androindBanner'] = androindBanner;
    map['androindOpen'] = andriondOpen;
    map['andriondgoogleNative'] = andriondgoogleNative;
    map['fb-full'] = fbfull;
    map['fb-banner'] = fbbanner;
    map['fb-native'] = fbnative;
    map['click'] = click;
    map['clickFlag'] = clickflag;
    map['adFlag'] = adflag;
    map['Adstyle'] = adstyle;
    map['Adtime'] = adtime;
    map['splash'] = splash;
    map['adStatus'] = adstatus;
    map['androindStatus'] = androindStatus;
    map['iosStatus'] = iosStatus;
    map['androindKey'] = androindKey;
    map['iosKey'] = iosKey;
    map['front'] = front;
    map['pp'] = pp;
    return map;
  }

}