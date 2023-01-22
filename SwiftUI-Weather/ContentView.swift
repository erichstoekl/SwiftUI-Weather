//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Erich Stoekl on 1/15/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var isNight = false
    @State private var isPressed = false
    @EnvironmentObject var network: Network
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack() {
                CityTextView(cityName: "Tokyo, JP")
                    .padding()
                MainWeatherStatusView(imageName: network.weatherIcon,
                                      temperature: network.temperature,
                                      weatherDescription: network.weatherDescription)
                    .padding(.bottom, 40)
                
                // Dayofweek HStack
                HStack(spacing: 20) {
                    ForEach(network.forecastData.dropFirst(), id: \.date_epoch) { item in
                        WeatherDayView(dayOfWeek: ConvertEpochToWeekday(epochTime: item.date_epoch),
                                       imageName: codeDictionary[item.day.condition.code] ?? "",
                                       temperature: item.day.avgtemp_f)
                    }
                }
                
                Spacer()
                
                Button {
                    debugPrint("Pressed!")
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Night mode",
                                  textColor: .white,
                                  backgroundColor: .purple)
                }
                
                Spacer()
            }
            .onAppear(perform: network.getCurrentWeatherData)
        }
    }
}


struct WeatherDayView: View {
    let dayOfWeek: String
    let imageName: String
    let temperature: Double
    var body: some View {
        VStack {
            // Day of week
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.purple, .red)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(Int(temperature))°")
                .font(.system(size: 28, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
//        let topColor = isNight ? Color.black : Color.blue
//        let bottomColor = isNight ? Color.gray : Color("lightBlue")
//        LinearGradient(colors: [topColor, bottomColor],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//            .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
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
    let imageName: String
    let temperature: Double
    let weatherDescription: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(String(format: "%.1f", temperature))°")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
            Text("\(weatherDescription)")
                .font(.system(size: 16, weight: .thin, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
