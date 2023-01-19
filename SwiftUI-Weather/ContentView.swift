//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Erich Stoekl on 1/15/23.
//

import SwiftUI

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

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack() {
                CityTextView(cityName: "Cupertino, CA")
                    .padding()
                MainWeatherStatusView(imageName: isNight ? WeatherImage.MoonHaze : WeatherImage.CloudySun,
                                      temperature: 76)
                    .padding(.bottom, 40)
                
                // Dayofweek HStack
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: DayOfWeek.Tuesday,
                                   imageName: WeatherImage.CloudySun,
                                   temperature: 76)
                    WeatherDayView(dayOfWeek: DayOfWeek.Wednesday,
                                   imageName: WeatherImage.Cloudy,
                                   temperature: 68)
                    WeatherDayView(dayOfWeek: DayOfWeek.Thursday,
                                   imageName: WeatherImage.Snowy,
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: DayOfWeek.Friday,
                                   imageName: WeatherImage.Sunny,
                                   temperature: 80)
                    WeatherDayView(dayOfWeek: DayOfWeek.Saturday,
                                   imageName: WeatherImage.Thunderstorm,
                                   temperature: 70)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    let dayOfWeek: DayOfWeek
    let imageName: WeatherImage
    let temperature: Int
    
    var body: some View {
        VStack {
            // Day of week
            Text(dayOfWeek.rawValue)
                .font(.system(size: 16, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
            Image(systemName: imageName.rawValue)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        let topColor = isNight ? Color.black : Color.blue
        let bottomColor = isNight ? Color.gray : Color("lightBlue")
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}


struct MainWeatherStatusView: View {
    let imageName: WeatherImage
    let temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName.rawValue)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}
