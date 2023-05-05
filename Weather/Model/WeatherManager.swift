//
//  WeatherManager.swift
//  Weather
//
//  Created by Daniil Kulikovskiy on 04.05.2023.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=f7c2bd15adee68f01048d6a49262929f&units=metric"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Greate URL
        if let url = URL(string: urlString) {
            
            //2. Greate URL Session
            let session = URLSession(configuration: .default)
            
            //3. Give the session task
            let task = session.dataTask(with: url, completionHandler: handler(data:response:error:))
            
            //4. Start the task
            task.resume()
            
        }
     
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }
    
    
}
