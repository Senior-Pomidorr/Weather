//
//  ViewController.swift
//  Weather
//
//  Created by Daniil Kulikovskiy on 03.05.2023.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
   
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        searchText.delegate = self
        weatherManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        layout()
    }
    
    private let pictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var buttonLocation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(tapPrint), for: .touchUpInside)
        return button
    }()
    
    @objc func tapPrint() {
        searchText.endEditing(true)
        locationManager.requestLocation()
        
    }
    
    private let searchText: UITextField = {
        let searchText = UITextField()
        searchText.translatesAutoresizingMaskIntoConstraints = false
        searchText.placeholder = "Search"
        searchText.textAlignment = .right
        searchText.backgroundColor = .systemFill
        searchText.layer.cornerRadius = 5
        searchText.font = .systemFont(ofSize: 25)
        searchText.borderStyle = .roundedRect
        searchText.autocapitalizationType = .words
        searchText.returnKeyType = .go
        return searchText
        
    }()
    
    private lazy var buttonSearch: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(tapSearch), for: .touchUpInside)
        return button
    }()
    
    @objc func tapSearch() {
        print(searchText.text!)
    }
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    private let weatherState: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "cloud.rain")
        image.tintColor = .label
        return image
    }()
    
    private let degrees: UILabel = {
        let degrees = UILabel()
        degrees.text = "21"
        degrees.font = .systemFont(ofSize: 80, weight: .black)
        return degrees
    }()
    
    private let degreesSign: UILabel = {
        let degrees = UILabel()
        degrees.text = "°"
        degrees.font = .systemFont(ofSize: 100)
        return degrees
    }()
    
    private let degreesCelsius: UILabel = {
        let degrees = UILabel()
        degrees.text = "C"
        degrees.font = .systemFont(ofSize: 100)
        return degrees
    }()
    
    private let stackViewCelcius: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 0
        return stack
    }()
    
    private let cityLabel: UILabel = {
        let degrees = UILabel()
        degrees.text = "London"
        degrees.font = .systemFont(ofSize: 30)
        degrees.translatesAutoresizingMaskIntoConstraints = false
        return degrees
    }()
    
}

extension MainViewController {
    func layout() {
        view.addSubview(pictureView)
        view.addSubview(stackView)
        pictureView.addSubview(stackViewCelcius)
        pictureView.addSubview(weatherState)
        pictureView.addSubview(cityLabel)
        stackView.addArrangedSubview(buttonLocation)
        stackView.addArrangedSubview(searchText)
        stackView.addArrangedSubview(buttonSearch)
        stackViewCelcius.addArrangedSubview(degrees)
        stackViewCelcius.addArrangedSubview(degreesSign)
        stackViewCelcius.addArrangedSubview(degreesCelsius)
        
        
        NSLayoutConstraint.activate([
            
            pictureView.topAnchor.constraint(equalTo: view.topAnchor),
            pictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pictureView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            
            weatherState.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            weatherState.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            weatherState.heightAnchor.constraint(equalToConstant: 120),
            weatherState.widthAnchor.constraint(equalToConstant: 120),
            
            stackViewCelcius.topAnchor.constraint(equalTo: weatherState.bottomAnchor, constant: 5),
            stackViewCelcius.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackViewCelcius.heightAnchor.constraint(equalToConstant: 100),
            
            cityLabel.topAnchor.constraint(equalTo: stackViewCelcius.bottomAnchor, constant: 5),
            cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            buttonLocation.heightAnchor.constraint(equalToConstant: 40),
            buttonLocation.widthAnchor.constraint(equalToConstant: 40),
            
            buttonSearch.heightAnchor.constraint(equalToConstant: 40),
            buttonSearch.widthAnchor.constraint(equalToConstant: 40),
            
            searchText.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
}

//MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchText.endEditing(true)
        print(searchText.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchText.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchText.text = ""
    }
}


//MARK: - WeatherManagerDelegate

extension MainViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.degrees.text = weather.temeratureString
            self.weatherState.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


//MARK: - CLLocationManagerDelegate
extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
}
