//
//  ViewController.swift
//  Weather
//
//  Created by Daniil Kulikovskiy on 03.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    private let pictureView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let buttonLocation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let searchText: UITextField = {
        let searchText = UITextField()
        searchText.translatesAutoresizingMaskIntoConstraints = false
        searchText.placeholder = "Search"
        searchText.textAlignment = .right
        searchText.backgroundColor = .systemFill
        searchText.layer.cornerRadius = 5
        searchText.font = .systemFont(ofSize: 25)
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: searchText.frame.height))
           searchText.rightView = rightPaddingView
           searchText.rightViewMode = .always
        return searchText
        
    }()
    
    private let buttonSearch: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
 
}

extension MainViewController {
    func layout() {
        view.addSubview(pictureView)
        pictureView.addSubview(stackView)
        stackView.addArrangedSubview(buttonLocation)
        stackView.addArrangedSubview(searchText)
        stackView.addArrangedSubview(buttonSearch)
        
        NSLayoutConstraint.activate([
            pictureView.topAnchor.constraint(equalTo: view.topAnchor),
            pictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pictureView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 70),
          
            
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

