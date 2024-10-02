import 'dart:convert';

UpcomingMatches upcomingMatchesFromJson(String str) =>
    UpcomingMatches.fromJson(json.decode(str));

String upcomingMatchesToJson(UpcomingMatches data) =>
    json.encode(data.toJson());

class UpcomingMatches {
  List<Responsess>? response;

  UpcomingMatches({this.response});

  UpcomingMatches.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Responsess>[];
      json['response'].forEach((v) {
        response!.add(Responsess.fromJson(v));
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

class Responsess {
  Fixture? fixture;
  League? league;
  Teams? teams;

  Responsess({
    this.fixture,
    this.league,
    this.teams,
  });

  Responsess.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
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
  Null first;
  Null second;

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
  Null elapsed;

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
  Null winner;

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
