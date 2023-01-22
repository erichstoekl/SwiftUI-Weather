//
//  WeatherDayModel.swift
//  SwiftUI-Weather
//
//  Created by Erich Stoekl on 1/20/23.
//
import Foundation

enum WeatherImage: String {
    case CloudySun = "cloud.sun.fill"
    case Sunny = "sun.max.fill"
    case Cloudy = "cloud.fill"
    case Thunderstorm = "cloud.bolt.rain.fill"
    case Snowy = "cloud.snow.fill"
    case MoonHaze = "moon.haze.fill"
}

enum DayOfWeek: String {
    case Monday    = "MON"
    case Tuesday   = "TUE"
    case Wednesday = "WED"
    case Thursday  = "THU"
    case Friday    = "FRI"
    case Saturday  = "SAT"
    case Sunday    = "SUN"
}

struct WeatherDay: Identifiable {
    var id = UUID()
    var dayOfWeek: DayOfWeek
    var weatherImage: WeatherImage
    var temperature: Int
}

struct Condition: Decodable {
    var text: String
//    var icon: String
    var code: Int
}
struct ForecastDay: Decodable {
    var day: Day
    var date_epoch: TimeInterval
    struct Day: Decodable {
        var avgtemp_f: Double
        var condition: Condition
    }
}
struct WeatherAPIData: Decodable {
    var location: Location
    var current: Current
    var forecast: Forecast
    struct Forecast: Decodable {
        var forecastday: [ForecastDay]
    }
    struct Location: Decodable {
        var name: String
        var region: String
        var country: String
//        var lat: Double
//        var lon: Double
//        var tz_id: String
//        var localtime_epoch: UInt
//        var localtime: String
    }
    struct Current: Decodable {
//        var last_updated_epoch: UInt
//        var last_updated: String
//        var temp_c: Double
        var temp_f: Double
//        var is_day: Int
        var condition: Condition
//        var wind_mph: Double
//        var wind_kph: Double
//        var wind_degree: Int
//        var wind_dir: String
//        var pressure_mb: Double
//        var pressure_in: Double
//        var precip_mm: Double
//        var precip_in: Double
//        var humidity: Int
//        var cloud: Int
//        var feelslike_c: Double
//        var feelslike_f: Double
//        var vis_km: Double
//        var vis_miles: Double
//        var uv: Double
//        var gust_mph: Double
//        var gust_kph: Double

    }
}

let codeDictionary: [Int: String] = [
    1000: "sun.max.fill",
    1003: "cloud.sun.fill",
    1006: "cloud.fill",
    1009: "cloud.sun.fill",
    1030: "cloud.fog.fill",
    1063: "cloud.sun.rain.fill",
    1066: "cloud.snow.fill",
    1069: "cloud.sleet.fill",
    1072: "cloud.sleet.fill",
    1087: "cloud.bolt.fill",
    1114: "wind.snow.fill",
    1117: "snowflake",
    1135: "cloud.fog.fill",
    1147: "cloud.fog.fill",
    1150: "cloud.rain.fill",
    1153: "cloud.rain.fill",
    1168: "cloud.rain.fill",
    1171: "cloud.heavyrain.fill",
    1180: "cloud.rain",
    1183: "cloud.rain",
    1186: "cloud.rain",
    1189: "cloud.rain",
    1192: "cloud.heavyrain",
    1195: "cloud.heavyrain",
    1198: "cloud.rain",
    1201: "cloud.heavyrain",
    1204: "cloud.sleet",
    1207: "cloud.sleet.fill",
    1210: "cloud.snow",
    1213: "cloud.snow",
    1216: "cloud.snow",
    1219: "cloud.snow.fill",
    1222: "cloud.snow.fill",
    1225: "cloud.snow.fill",
    1237: "cloud.hail.fill",
    1240: "cloud.rain",
    1243: "cloud.heavyfain.fill",
    1246: "cloud.heavyfain.fill",
    1249: "cloud.sleet",
    1252: "cloud.sleet.fill",
    1255: "cloud.snow.fill",
    1258: "cloud.snow.fill",
    1261: "cloud.hail.fill",
    1264: "cloud.hail.fill",
    1273: "cloud.bolt.rain.fill",
    1276: "cloud.bolt.rain.fill",
    1279: "cloud.snow.fill",
    1282: "cloud.snow.fill",
]

