//
//  MainWeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class MainWeatherView: UIView {
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder"
        label.backgroundColor = .brown
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCell")
        cv.backgroundColor = .cyan
        return cv
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = UIColor.magenta
//        self.translatesAutoresizingMaskIntoConstraints = false
//        topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        setupViews()
    }
    
    private func setupViews() {
        setupCityLabel()
        setupCV()
    }
    
    private func setupCityLabel() {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        [
        cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ].forEach{$0.isActive = true}
        
    }
    
    private func setupCV() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [
        collectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 30),
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
        collectionView.widthAnchor.constraint(equalTo: widthAnchor),
        collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
            ].forEach{$0.isActive = true}
    }
    
}
