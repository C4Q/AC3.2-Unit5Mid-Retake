//
//  DesignOneViewController.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Louis Tur on 1/5/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class DesignOneViewController: UIViewController, CellTitled {
    
    //   ----------------------------------
    //    DO NOT MODIFY THIS SECTION
    //    👇👇👇👇👇👇👇👇👇👇👇👇👇👇
    
    // MARK: - Provided Constants
    let mainLabelFont = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightSemibold)
    let subLabelFont = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightLight)
    
    let standardMargin: CGFloat = 8.0
    
    let pikachuDimensions: CGSize = CGSize(width: 185.0, height: 210.0)
    let pichuDimensions: CGSize = CGSize(width: 40.0, height: 44.0)
    let raichuDimension: CGSize = CGSize(width: 60.0, height: 60.0)
    
    let bannerScrollingImageSize: CGSize = CGSize(width: 656.0, height: 310.0)
    
    // MARK: - CellTitled Protocol
    var titleForCell: String = "Design 1: Pokédex(-ish)"
    
    //    ☝️☝️☝️☝️☝️☝️☝️☝️☝️☝️☝️☝️☝️☝️
    //    DO NOT MODIFY THIS SECTION
    //   ----------------------------------
    
    var pikachuImageViewConstraints: [NSLayoutConstraint] = []
    var raichuImageConstraints: [NSLayoutConstraint] = []
    var pichuImageConstraints: [NSLayoutConstraint] = []
    var topLabelConstraints: [NSLayoutConstraint] = []
    var pichuSubLabelConstraints: [NSLayoutConstraint] = []
    var raichuSubLabelConstraints: [NSLayoutConstraint] = []
    var scrollViewConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleForCell
        self.view.backgroundColor = .white
        
        setupViewHierarchy()
        configureConstraints()
    }
    
    func configureConstraints() {
        // set constraints
        let _ = [
            pikachuImageView,
            raichuImageView,
            pichuImageView,
            topLabel,
            pichuSubLabel,
            raichuSubLabel,
            scrollView
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        topLabelConstraints = [
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75.0),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        pikachuImageViewConstraints = [
            pichuImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            pikachuImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]

        raichuImageConstraints = [
        
        ]
        
        raichuSubLabelConstraints = [
        
        ]
        
        pichuImageConstraints = [
        
        ]
        
        pichuSubLabelConstraints = [
        
        ]
        
        scrollViewConstraints = [
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: ),
        ]
        
        let _ = [
            pikachuImageViewConstraints,
            raichuImageConstraints,
            pichuImageConstraints,
            topLabelConstraints,
            pichuSubLabelConstraints,
            raichuSubLabelConstraints,
            scrollViewConstraints
            ].map{ $0.map { $0.isActive = true } }
    }
    
    func setupViewHierarchy() {
        // Add views
        self.view.addSubview(pikachuImageView)
        self.view.addSubview(raichuImageView)
        self.view.addSubview(pichuImageView)
        
        self.view.addSubview(topLabel)
        self.view.addSubview(pichuSubLabel)
        self.view.addSubview(raichuSubLabel)
        
        self.scrollView.addSubview(pichuImageView)
    }
    
    
    // MARK: - Define Your Views Here
    
    // ex:
    // let pikachuImageView: UIView = ... your code here ...
    
    internal lazy var topLabel: UILabel = {
       let label = UILabel()
        label.text = "Pikachu (no.25)"
        label.font = self.mainLabelFont
        return label
    }()
    
    internal lazy var pichuSubLabel: UILabel = {
       let label = UILabel()
        label.text = "pichu"
        label.font = self.subLabelFont
        return label
        
    }()
    
    internal lazy var raichuSubLabel: UILabel = {
        let label = UILabel()
        label.text = "raichu"
        label.font = self.subLabelFont
        return label
    }()
    
    internal lazy var pikachuImageView: UIImageView = {
        let image = UIImage(named: "pikachu")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.sizeThatFits(self.pikachuDimensions)
        return imageView
    }()
    
    internal lazy var raichuImageView: UIImageView = {
        let image = UIImage(named: "raichu")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.sizeThatFits(self.raichuDimension)
        return imageView
    }()
    
    internal lazy var pichuImageView: UIImageView = {
        let image = UIImage(named: "pichu")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.sizeThatFits(self.pichuDimensions)
        return imageView
    }()
    
    lazy var pikachuEvolutionImageView: UIImageView = {
        let image = UIImage(named: "pikachu_evolution")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceHorizontal = false
        scroll.alwaysBounceVertical = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.sizeThatFits(self.bannerScrollingImageSize)
        return scroll
    }()
    
    
}
