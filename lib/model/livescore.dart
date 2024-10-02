// To parse this JSON data, do
//
//     final liveScore = liveScoreFromJson(jsonString);

import 'dart:convert';

LiveScore liveScoreFromJson(String str) => LiveScore.fromJson(json.decode(str));

String liveScoreToJson(LiveScore data) => json.encode(data.toJson());

class LiveScore {
  List<Response>? response;

  LiveScore({this.response});

  LiveScore.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
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

class Response {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;
  List<Events>? events;

  Response(
      {this.fixture,
      this.league,
      this.teams,
      this.goals,
      this.score,
      this.events});

  Response.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
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
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
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
  Fulltime? fulltime;
  Fulltime? extratime;
  Fulltime? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
        json['halftime'] != null ? Goals.fromJson(json['halftime']) : null;
    fulltime =
        json['fulltime'] != null ? Fulltime.fromJson(json['fulltime']) : null;
    extratime =
        json['extratime'] != null ? Fulltime.fromJson(json['extratime']) : null;
    penalty =
        json['penalty'] != null ? Fulltime.fromJson(json['penalty']) : null;
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

class Fulltime {
  Null home;
  Null away;

  Fulltime({this.home, this.away});

  Fulltime.fromJson(Map<String, dynamic> json) {
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

class Events {
  Time? time;
  Team? team;
  Player? player;
  Player? assist;
  String? type;
  String? detail;
  String? comments;

  Events(
      {this.time,
      this.team,
      this.player,
      this.assist,
      this.type,
      this.detail,
      this.comments});

  Events.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    assist = json['assist'] != null ? Player.fromJson(json['assist']) : null;
    type = json['type'];
    detail = json['detail'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (time != null) {
      data['time'] = time!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (player != null) {
      data['player'] = player!.toJson();
    }
    if (assist != null) {
      data['assist'] = assist!.toJson();
    }
    data['type'] = type;
    data['detail'] = detail;
    data['comments'] = comments;
    return data;
  }
}

class Time {
  int? elapsed;
  int? extra;

  Time({this.elapsed, this.extra});

  Time.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['elapsed'] = elapsed;
    data['extra'] = extra;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? logo;

  Team({this.id, this.name, this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}

class Player {
  int? id;
  String? name;

  Player({this.id, this.name});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
