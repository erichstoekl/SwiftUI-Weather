//
//  WeatherDayData.swift
//  SwiftUI-Weather
//
//  Created by Erich Stoekl on 1/20/23.
//

import Foundation

let apiKey = "f1db58a37fec4bf39bc50022232001"

let weatherDayData: [WeatherDay] = [
    WeatherDay(dayOfWeek: DayOfWeek.Monday, weatherImage: WeatherImage.Sunny, temperature: 76),
    WeatherDay(dayOfWeek: DayOfWeek.Tuesday, weatherImage: WeatherImage.MoonHaze, temperature: 76),
    WeatherDay(dayOfWeek: DayOfWeek.Wednesday, weatherImage: WeatherImage.Snowy, temperature: 76),
    WeatherDay(dayOfWeek: DayOfWeek.Thursday, weatherImage: WeatherImage.Cloudy, temperature: 76),
    WeatherDay(dayOfWeek: DayOfWeek.Friday, weatherImage: WeatherImage.Thunderstorm, temperature: 76)
]

func ConvertEpochToWeekday(epochTime: TimeInterval) -> String {
    let weekdayConvert: [Int: String] = [
        1: "SUN",
        2: "MON",
        3: "TUE",
        4: "WED",
        5: "THU",
        6: "FRI",
        7: "SAT",
    ]
    
    let date = Date(timeIntervalSince1970: epochTime)
    var jstCalendar = Calendar(identifier: .gregorian)
    jstCalendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!

    let jstDayOfWeek = jstCalendar.component(.weekday, from: date)
    return weekdayConvert[jstDayOfWeek] ?? ""
}
