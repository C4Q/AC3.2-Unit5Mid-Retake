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
            pikachuLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pikachuLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardMargin),
            
            pikachuImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pikachuImageView.topAnchor.constraint(equalTo: pikachuLabel.bottomAnchor, constant: standardMargin),
            pikachuImageView.heightAnchor.constraint(equalToConstant: pikachuDimensions.height),
            pikachuImageView.widthAnchor.constraint(equalToConstant: pikachuDimensions.width),
            
            pichuImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: standardMargin),
            pichuImageView.bottomAnchor.constraint(equalTo: pikachuImageView.bottomAnchor),
            pichuImageView.heightAnchor.constraint(equalToConstant: pichuDimensions.height),
            pichuImageView.widthAnchor.constraint(equalToConstant: pichuDimensions.width),
            
            raichuImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -standardMargin),
            raichuImageView.bottomAnchor.constraint(equalTo: pikachuImageView.bottomAnchor),
            raichuImageView.heightAnchor.constraint(equalToConstant: raichuDimension.height),
            raichuImageView.widthAnchor.constraint(equalToConstant: raichuDimension.width),
            
            pichuLabel.centerXAnchor.constraint(equalTo: pichuImageView.centerXAnchor),
            pichuLabel.topAnchor.constraint(equalTo: pichuImageView.bottomAnchor, constant: standardMargin),
            
            raichuLabel.centerXAnchor.constraint(equalTo: raichuImageView.centerXAnchor),
            raichuLabel.topAnchor.constraint(equalTo: raichuImageView.bottomAnchor, constant: standardMargin),
            
            containerView.topAnchor.constraint(equalTo: pichuLabel.bottomAnchor, constant: standardMargin),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: standardMargin),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: standardMargin),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -standardMargin),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -standardMargin),
            
            bannerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: standardMargin),
            bannerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -standardMargin),
            
            bannerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: bannerScrollingImageSize.height),
            bannerView.widthAnchor.constraint(equalToConstant: bannerScrollingImageSize.width),
            ].map { $0.isActive = true }
    }
    
    func setupViewHierarchy() {
        // Add views
        let views = [pikachuImageView, raichuImageView, pichuImageView, containerView]
        let labels = [pikachuLabel, pichuLabel, raichuLabel]
        for v in views {
            self.view.addSubview(v)
        }
        for l in labels {
            self.view.addSubview(l)
        }
        self.containerView.addSubview(scrollView)
        scrollView.addSubview(bannerView)
    }
    
    
    // MARK: - Define Your Views Here
    
    // Pokemon
    
    internal lazy var pikachuImageView: UIImageView = {
        let image = UIImage(named: "pikachu")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var raichuImageView: UIImageView = {
        let image = UIImage(named: "raichu")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var pichuImageView: UIImageView = {
        let image = UIImage(named: "pichu")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    

    internal lazy var bannerView: UIImageView = {
        let image = UIImage(named: "pikachu_evolution")
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Labels
    internal lazy var pikachuLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Pikachu (no. 25)"
        label.font = self.mainLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var pichuLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Pichu"
        label.font = self.subLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    internal lazy var raichuLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Raichu"
        label.font = self.subLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // ScrollView
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceHorizontal = false
        scroll.alwaysBounceVertical = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
}
