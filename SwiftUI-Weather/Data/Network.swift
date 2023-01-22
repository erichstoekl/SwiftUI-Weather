//
//  Network.swift
//  SwiftUI-Weather
//
//  Created by Erich Stoekl on 1/20/23.
//

import Foundation

class Network: ObservableObject {
    @Published var temperature: Double = 0.0
    @Published var weatherDescription: String = ""
    @Published var weatherIcon: String = ""
    @Published var forecastData: [ForecastDay] = []
    
    func getCurrentWeatherData() {
        let apiKey = ""
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=Tokyo&days=6")
                        else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedWeatherData = try JSONDecoder().decode(WeatherAPIData.self, from: data)
                        self.forecastData = decodedWeatherData.forecast.forecastday
                        self.temperature = decodedWeatherData.current.temp_f
                        self.weatherDescription = decodedWeatherData.current.condition.text
                        self.weatherIcon = codeDictionary[decodedWeatherData.current.condition.code] ?? ""
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
