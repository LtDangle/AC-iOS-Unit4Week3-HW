//
//  MainWeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit



class MainWeatherView: UIView {
    
    let cellSpacing: CGFloat = 20
    
    
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
    
    lazy var basicLabel: UILabel = {
        let label = UILabel()
        return label
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
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MainWeatherView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath)
        return cell
    }
}

extension MainWeatherView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 2.2
        let numSpaces: CGFloat = 2
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: collectionView.bounds.height) // pick a multiplier?
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing) // same?
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}


