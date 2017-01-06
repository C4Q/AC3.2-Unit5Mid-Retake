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
    
    func setupViewHierarchy() {
        // Add views
        
        self.view.addSubview(mainLabel)
        
        self.view.addSubview(leftImage)
        self.view.addSubview(centerImage)
        self.view.addSubview(rightImage)
        
        self.view.addSubview(subLabelLeft)
        self.view.addSubview(subLabelRight)
        
        self.view.addSubview(containerView)
        
        containerView.addSubview(scrollView)
        scrollView.addSubview(imageInScrollView)
        
    }
    
    
    func configureConstraints() {
        // set constraints
        
        self.edgesForExtendedLayout = []
        
        let topLabel = [
            
            mainLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: standardMargin),
            mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ]
        
        let imageViews = [
            
            centerImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: standardMargin),
            centerImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            leftImage.bottomAnchor.constraint(equalTo: centerImage.bottomAnchor),
            leftImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: standardMargin),
            
            rightImage.bottomAnchor.constraint(equalTo: centerImage.bottomAnchor),
            rightImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -standardMargin),
            
        ]
        
        let subLabels = [
            
            subLabelLeft.leadingAnchor.constraint(equalTo: leftImage.leadingAnchor),
            subLabelLeft.topAnchor.constraint(equalTo: leftImage.bottomAnchor),
            
            subLabelRight.trailingAnchor.constraint(equalTo: rightImage.trailingAnchor),
            subLabelRight.topAnchor.constraint(equalTo: rightImage.bottomAnchor)
        ]
        
        let containerScrollView = [
            
            containerView.topAnchor.constraint(equalTo: subLabelLeft.bottomAnchor, constant: standardMargin),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: standardMargin),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: standardMargin),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -standardMargin),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -standardMargin)
        ]
        
        let scrollImage = [
            imageInScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageInScrollView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageInScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageInScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        
        let _ = [topLabel, imageViews, subLabels, containerScrollView, scrollViewConstraints, scrollImage].map{ $0.map{ $0.isActive = true }}
        
    }
    
    // MARK: - Define Your Views Here
    
    
    // Three Labels
    
    internal lazy var mainLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pikachu(no. 25)"
        label.font = self.mainLabelFont
        return label
    }()
    
    internal lazy var subLabelLeft: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pichu"
        label.font = self.subLabelFont
        return label
    }()
    
    
    internal lazy var subLabelRight: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Raichu"
        label.font = self.subLabelFont
        return label
    }()
    
    // Container View
    
    internal lazy var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    
    lazy var imageInScrollView: UIImageView = {
        let image = UIImage(named: "pikachu_evolution")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceHorizontal = false
        scroll.alwaysBounceVertical = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    //let scrollImage: UIView = UIImageView(image: UIImage(named: "pichu")!)
    
    //Three - Images
    
    //let pikachuImageView: UIView = ... your code here ...
    
    
    internal lazy var leftImage: UIView = {
        let pichuImageView: UIView = UIImageView(image: UIImage(named: "pichu")!)
        pichuImageView.translatesAutoresizingMaskIntoConstraints = false
        return pichuImageView
    }()
    
    internal lazy var centerImage: UIView = {
        let pikachuImageView: UIView = UIImageView(image: UIImage(named: "pikachu")!)
        pikachuImageView.translatesAutoresizingMaskIntoConstraints = false
        return pikachuImageView
    }()


    internal lazy var rightImage: UIView = {
        let raichuImageView: UIView = UIImageView(image: UIImage(named: "raichu")!)
        raichuImageView.translatesAutoresizingMaskIntoConstraints = false
        return raichuImageView
    }()
    
    
    
    
}
