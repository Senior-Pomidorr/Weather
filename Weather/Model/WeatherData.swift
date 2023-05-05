//
//  WeatherData.swift
//  Weather
//
//  Created by Daniil Kulikovskiy on 05.05.2023.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
