




class WeatherModal {
  late LocationModal locationModal;
  late CurrentModal currentModal;
  late ForecastModal forecastModal;

  WeatherModal(this.locationModal, this.currentModal, this.forecastModal);

  factory WeatherModal.fromJson(Map m1) {
    return WeatherModal(
        LocationModal.fromJson(m1['location']),
        CurrentModal.fromJson(m1['current']),
        ForecastModal.fromJson(m1['forecast']));
  }
}

class LocationModal {
  late String name, region, country, localtime;

  LocationModal(this.name, this.region, this.country, this.localtime);

  factory LocationModal.fromJson(Map m1) {
    return LocationModal(
        m1['name'], m1['region'], m1['country'], m1['localtime']);
  }
}

class CurrentModal {
  late double temp_c, temp_f, wind_mph, wind_kph, pressure_in, pressure_mb, uv,vis_km,feelslike_c;
  late int is_day, humidity, cloud;
  late Condition condition;

  CurrentModal(
      this.temp_c,
      this.temp_f,
      this.wind_mph,
      this.vis_km,
      this.feelslike_c,
      this.wind_kph,
      this.pressure_in,
      this.uv,
      this.is_day,
      this.humidity,
      this.cloud,
      this.pressure_mb,
      this.condition);

  factory CurrentModal.fromJson(Map m1) {
    return CurrentModal(
        m1['temp_c'].toDouble(),
        m1['temp_f'].toDouble(),
        m1['wind_mph'].toDouble(),
        m1['wind_kph'].toDouble(),
        m1['pressure_in'].toDouble(),
        m1['vis_km'].toDouble(),
        m1['feelslike_c'].toDouble(),
        m1['uv'].toDouble(),
        m1['is_day'],
        m1['humidity'],
        m1['cloud'],
        m1['pressure_mb'].toDouble(),
        Condition.fromJson(m1['condition']));
  }
}

class Condition {
  late String text, icon;

  Condition(this.text, this.icon);

  factory Condition.fromJson(Map m1) {
    return Condition(m1['text'], m1['icon']);
  }
}

class ForecastModal {
  late List<ForecastDay> forecastDay = [];

  ForecastModal(this.forecastDay);

  factory ForecastModal.fromJson(Map m1) {
    return ForecastModal((m1['forecastday'] as List)
        .map(
          (e) => ForecastDay.fromJson(e),
    )
        .toList());
  }
}

class ForecastDay {
  late String date;
  late DayModal day;
  late List<HourModal> hour = [];

  ForecastDay(this.date, this.day, this.hour);

  factory ForecastDay.fromJson(Map m1) {
    return ForecastDay(
        m1['date'],
        DayModal.fromJson(m1['day']),
        (m1['hour'] as List)
            .map(
              (e) => HourModal.fromJson(e),
        )
            .toList());
  }
}

class DayModal {
  late double maxtemp_c, mintemp_c;
  late DayConditionModal dayConditionModal;

  DayModal(this.maxtemp_c, this.mintemp_c, this.dayConditionModal);

  factory DayModal.fromJson(Map m1) {
    return DayModal(m1['maxtemp_c'].toDouble(), m1['mintemp_c'].toDouble(),
        DayConditionModal.fromJson(m1['condition']));
  }
}

class DayConditionModal {
  late String text, icon;

  DayConditionModal(this.text, this.icon);

  factory DayConditionModal.fromJson(Map m1) {
    return DayConditionModal(m1['text'], m1['icon']);
  }
}

class HourModal {
  late String time;
  late double temp_c;
  late int is_day;
  late HourConditionModal hourConditionModal;

  HourModal(this.time, this.temp_c, this.is_day, this.hourConditionModal);

  factory HourModal.fromJson(Map m1) {
    return HourModal(m1['time'], m1['temp_c'].toDouble(), m1['is_day'],
        HourConditionModal.fromJson(m1['condition']));
  }
}

class HourConditionModal {
  late String text, icon;

  HourConditionModal(this.text, this.icon);

  factory HourConditionModal.fromJson(Map m1) {
    return HourConditionModal(m1['text'], m1['icon']);
  }
}













// class WeatherModal {
//   late LocationModal locationModal;
//   late CurrentModal currentModal;
//   late ForecastModal forecastModal;
//
//   WeatherModal(this.locationModal, this.currentModal, this.forecastModal);
//
//   factory WeatherModal.fromJson(Map m1) {
//     return WeatherModal(
//         LocationModal.fromJson(m1['location']),
//         CurrentModal.fromJson(m1['current']),
//         ForecastModal.fromJson(m1['forecast']));
//   }
// }
//
// class LocationModal {
//   late String name, region, country, localtime;
//
//   LocationModal(this.name, this.region, this.country, this.localtime);
//
//   factory LocationModal.fromJson(Map m1) {
//     return LocationModal(
//         m1['name'], m1['region'], m1['country'], m1['localtime']);
//   }
// }
//
// class CurrentModal {
//   late double temp_c, temp_f, wind_mph, wind_kph, pressure_in, pressure_mb, uv;
//   late int is_day, humidity, cloud;
//   late Condition condition;
//
//   CurrentModal(
//       this.temp_c,
//       this.temp_f,
//       this.wind_mph,
//       this.wind_kph,
//       this.pressure_in,
//       this.uv,
//       this.is_day,
//       this.humidity,
//       this.cloud,
//       this.pressure_mb,
//       this.condition);
//
//   factory CurrentModal.fromJson(Map m1) {
//     return CurrentModal(
//         m1['temp_c'].toDouble(),
//         m1['temp_f'].toDouble(),
//         m1['wind_mph'].toDouble(),
//         m1['wind_kph'].toDouble(),
//         m1['pressure_in'].toDouble(),
//         m1['uv'].toDouble(),
//         m1['is_day'],
//         m1['humidity'],
//         m1['cloud'],
//         m1['pressure_mb'].toDouble(),
//         Condition.fromJson(m1['condition']));
//   }
// }
//
// class Condition {
//   late String text, icon;
//
//   Condition(this.text, this.icon);
//
//   factory Condition.fromJson(Map m1) {
//     return Condition(m1['text'], m1['icon']);
//   }
// }
//
// class ForecastModal {
//   late List<ForecastDay> forecastDay = [];
//
//   ForecastModal(this.forecastDay);
//
//   factory ForecastModal.fromJson(Map m1) {
//     return ForecastModal((m1['forecastday'] as List)
//         .map(
//           (e) => ForecastDay.fromJson(e),
//     )
//         .toList());
//   }
// }
//
// class ForecastDay {
//   late String date;
//   late DayModal day;
//   late List<HourModal> hour = [];
//
//   ForecastDay(this.date, this.day, this.hour);
//
//   factory ForecastDay.fromJson(Map m1) {
//     return ForecastDay(
//         m1['date'],
//         DayModal.fromJson(m1['day']),
//         (m1['hour'] as List)
//             .map(
//               (e) => HourModal.fromJson(e),
//         )
//             .toList());
//   }
// }
//
// class DayModal {
//   late double maxtemp_c, mintemp_c;
//   late DayConditionModal dayConditionModal;
//
//   DayModal(this.maxtemp_c, this.mintemp_c, this.dayConditionModal);
//
//   factory DayModal.fromJson(Map m1) {
//     return DayModal(m1['maxtemp_c'].toDouble(), m1['mintemp_c'].toDouble(),
//         DayConditionModal.fromJson(m1['condition']));
//   }
// }
//
// class DayConditionModal {
//   late String text, icon;
//
//   DayConditionModal(this.text, this.icon);
//
//   factory DayConditionModal.fromJson(Map m1) {
//     return DayConditionModal(m1['text'], m1['icon']);
//   }
// }
//
// class HourModal {
//   late String time;
//   late double temp_c;
//   late int is_day;
//   late HourConditionModal hourConditionModal;
//
//   HourModal(this.time, this.temp_c, this.is_day, this.hourConditionModal);
//
//   factory HourModal.fromJson(Map m1) {
//     return HourModal(m1['time'], m1['temp_c'].toDouble(), m1['is_day'],
//         HourConditionModal.fromJson(m1['condition']));
//   }
// }
//
// class HourConditionModal {
//   late String text, icon;
//
//   HourConditionModal(this.text, this.icon);
//
//   factory HourConditionModal.fromJson(Map m1) {
//     return HourConditionModal(m1['text'], m1['icon']);
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //
// //
// // import 'dart:convert';
// //
// // WeatherModal weatherModalFromJson(String str) => WeatherModal.fromJson(json.decode(str));
// //
// // String weatherModalToJson(WeatherModal data) => json.encode(data.toJson());
// //
// // class WeatherModal {
// //   Location location;
// //   Current current;
// //
// //   WeatherModal({
// //     required this.location,
// //     required this.current,
// //   });
// //
// //   factory WeatherModal.fromJson(Map json) => WeatherModal(
// //     location: Location.fromJson(json["location"]),
// //     current: Current.fromJson(json["current"]),
// //   );
// //
// //   Map toJson() => {
// //     "location": location.toJson(),
// //     "current": current.toJson(),
// //   };
// // }
// //
// // class Current {
// //   int lastUpdatedEpoch;
// //   String lastUpdated;
// //   double tempC;
// //   double tempF;
// //   int isDay;
// //   Condition condition;
// //   double windMph;
// //   double windKph;
// //   int windDegree;
// //   String windDir;
// //   int pressureMb;
// //   double pressureIn;
// //   double precipMm;
// //   double precipIn;
// //   int humidity;
// //   int cloud;
// //   int feelslikeC;
// //   double feelslikeF;
// //   double windchillC;
// //   double windchillF;
// //   int heatindexC;
// //   double heatindexF;
// //   int dewpointC;
// //   int dewpointF;
// //   int visKm;
// //   int visMiles;
// //   int uv;
// //   double gustMph;
// //   double gustKph;
// //
// //   Current({
// //     required this.lastUpdatedEpoch,
// //     required this.lastUpdated,
// //     required this.tempC,
// //     required this.tempF,
// //     required this.isDay,
// //     required this.condition,
// //     required this.windMph,
// //     required this.windKph,
// //     required this.windDegree,
// //     required this.windDir,
// //     required this.pressureMb,
// //     required this.pressureIn,
// //     required this.precipMm,
// //     required this.precipIn,
// //     required this.humidity,
// //     required this.cloud,
// //     required this.feelslikeC,
// //     required this.feelslikeF,
// //     required this.windchillC,
// //     required this.windchillF,
// //     required this.heatindexC,
// //     required this.heatindexF,
// //     required this.dewpointC,
// //     required this.dewpointF,
// //     required this.visKm,
// //     required this.visMiles,
// //     required this.uv,
// //     required this.gustMph,
// //     required this.gustKph,
// //   });
// //
// //   factory Current.fromJson(Map json) => Current(
// //     lastUpdatedEpoch: json["last_updated_epoch"],
// //     lastUpdated: json["last_updated"],
// //     tempC: json["temp_c"]?.toDouble(),
// //     tempF: json["temp_f"]?.toDouble(),
// //     isDay: json["is_day"],
// //     condition: Condition.fromJson(json["condition"]),
// //     windMph: json["wind_mph"]?.toDouble(),
// //     windKph: json["wind_kph"]?.toDouble(),
// //     windDegree: json["wind_degree"],
// //     windDir: json["wind_dir"],
// //     pressureMb: json["pressure_mb"],
// //     pressureIn: json["pressure_in"]?.toDouble(),
// //     precipMm: json["precip_mm"]?.toDouble(),
// //     precipIn: json["precip_in"]?.toDouble(),
// //     humidity: json["humidity"],
// //     cloud: json["cloud"],
// //     feelslikeC: json["feelslike_c"],
// //     feelslikeF: json["feelslike_f"]?.toDouble(),
// //     windchillC: json["windchill_c"]?.toDouble(),
// //     windchillF: json["windchill_f"]?.toDouble(),
// //     heatindexC: json["heatindex_c"],
// //     heatindexF: json["heatindex_f"]?.toDouble(),
// //     dewpointC: json["dewpoint_c"],
// //     dewpointF: json["dewpoint_f"],
// //     visKm: json["vis_km"],
// //     visMiles: json["vis_miles"],
// //     uv: json["uv"],
// //     gustMph: json["gust_mph"]?.toDouble(),
// //     gustKph: json["gust_kph"]?.toDouble(),
// //   );
// //
// //   Map toJson() => {
// //     "last_updated_epoch": lastUpdatedEpoch,
// //     "last_updated": lastUpdated,
// //     "temp_c": tempC,
// //     "temp_f": tempF,
// //     "is_day": isDay,
// //     "condition": condition.toJson(),
// //     "wind_mph": windMph,
// //     "wind_kph": windKph,
// //     "wind_degree": windDegree,
// //     "wind_dir": windDir,
// //     "pressure_mb": pressureMb,
// //     "pressure_in": pressureIn,
// //     "precip_mm": precipMm,
// //     "precip_in": precipIn,
// //     "humidity": humidity,
// //     "cloud": cloud,
// //     "feelslike_c": feelslikeC,
// //     "feelslike_f": feelslikeF,
// //     "windchill_c": windchillC,
// //     "windchill_f": windchillF,
// //     "heatindex_c": heatindexC,
// //     "heatindex_f": heatindexF,
// //     "dewpoint_c": dewpointC,
// //     "dewpoint_f": dewpointF,
// //     "vis_km": visKm,
// //     "vis_miles": visMiles,
// //     "uv": uv,
// //     "gust_mph": gustMph,
// //     "gust_kph": gustKph,
// //   };
// // }
// //
// // class Condition {
// //   String text;
// //   String icon;
// //   int code;
// //
// //   Condition({
// //     required this.text,
// //     required this.icon,
// //     required this.code,
// //   });
// //
// //   factory Condition.fromJson(Map json) => Condition(
// //     text: json["text"],
// //     icon: json["icon"],
// //     code: json["code"],
// //   );
// //
// //   Map toJson() => {
// //     "text": text,
// //     "icon": icon,
// //     "code": code,
// //   };
// // }
// //
// // class Location {
// //   String name;
// //   String region;
// //   String country;
// //   double lat;
// //   double lon;
// //   String tzId;
// //   int localtimeEpoch;
// //   String localtime;
// //
// //   Location({
// //     required this.name,
// //     required this.region,
// //     required this.country,
// //     required this.lat,
// //     required this.lon,
// //     required this.tzId,
// //     required this.localtimeEpoch,
// //     required this.localtime,
// //   });
// //
// //   factory Location.fromJson(Map json) => Location(
// //     name: json["name"],
// //     region: json["region"],
// //     country: json["country"],
// //     lat: json["lat"]?.toDouble(),
// //     lon: json["lon"]?.toDouble(),
// //     tzId: json["tz_id"],
// //     localtimeEpoch: json["localtime_epoch"],
// //     localtime: json["localtime"],
// //   );
// //
// //   Map toJson() => {
// //     "name": name,
// //     "region": region,
// //     "country": country,
// //     "lat": lat,
// //     "lon": lon,
// //     "tz_id": tzId,
// //     "localtime_epoch": localtimeEpoch,
// //     "localtime": localtime,
// //   };
// // }
