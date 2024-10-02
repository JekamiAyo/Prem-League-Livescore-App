import 'dart:convert';

SettledMatches matchFromJson(String str) =>
    SettledMatches.fromJson(json.decode(str));

String matchToJson(SettledMatches data) => json.encode(data.toJson());

class SettledMatches {
  List<Responses>? response;

  SettledMatches({this.response});

  SettledMatches.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Responses>[];
      json['response'].forEach((v) {
        response!.add(Responses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Responses {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  Responses({this.fixture, this.league, this.teams, this.goals, this.score});

  Responses.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fixture != null) {
      data['fixture'] = fixture!.toJson();
    }
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    if (score != null) {
      data['score'] = score!.toJson();
    }
    return data;
  }
}

class Fixture {
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Fixture(
      {this.id,
      this.referee,
      this.timezone,
      this.date,
      this.timestamp,
      this.periods,
      this.venue,
      this.status});

  Fixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    periods =
        json['periods'] != null ? Periods.fromJson(json['periods']) : null;
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['referee'] = referee;
    data['timezone'] = timezone;
    data['date'] = date;
    data['timestamp'] = timestamp;
    if (periods != null) {
      data['periods'] = periods!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Periods {
  int? first;
  int? second;

  Periods({this.first, this.second});

  Periods.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['second'] = second;
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? city;

  Venue({this.id, this.name, this.city});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city'] = city;
    return data;
  }
}

class Status {
  String? long;
  String? short;
  int? elapsed;

  Status({this.long, this.short, this.elapsed});

  Status.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = long;
    data['short'] = short;
    data['elapsed'] = elapsed;
    return data;
  }
}

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  League(
      {this.id,
      this.name,
      this.country,
      this.logo,
      this.flag,
      this.season,
      this.round});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['logo'] = logo;
    data['flag'] = flag;
    data['season'] = season;
    data['round'] = round;
    return data;
  }
}

class Teams {
  Home? home;
  Home? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    away = json['away'] != null ? Home.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (away != null) {
      data['away'] = away!.toJson();
    }
    return data;
  }
}

class Home {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Home({this.id, this.name, this.logo, this.winner});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['winner'] = winner;
    return data;
  }
}

class Goals {
  int? home;
  int? away;

  Goals({this.home, this.away});

  Goals.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}

class Score {
  Goals? halftime;
  Goals? fulltime;
  Extratime? extratime;
  Extratime? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
        json['halftime'] != null ? Goals.fromJson(json['halftime']) : null;
    fulltime =
        json['fulltime'] != null ? Goals.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null
        ? Extratime.fromJson(json['extratime'])
        : null;
    penalty =
        json['penalty'] != null ? Extratime.fromJson(json['penalty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (halftime != null) {
      data['halftime'] = halftime!.toJson();
    }
    if (fulltime != null) {
      data['fulltime'] = fulltime!.toJson();
    }
    if (extratime != null) {
      data['extratime'] = extratime!.toJson();
    }
    if (penalty != null) {
      data['penalty'] = penalty!.toJson();
    }
    return data;
  }
}

class Extratime {
  Null home;
  Null away;

  Extratime({this.home, this.away});

  Extratime.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}
