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
        self.edgesForExtendedLayout = []
        
        let labelConstraints = [
           pichuLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -8.0),
            pichuLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
            
            pikachuLabel.topAnchor.constraint(equalTo: view.topAnchor),
            pikachuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            raichuLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -8.0),
            raichuLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
            
            
            
        ]
        
        let imageConstraints = [
            //Pichu
            pichuImageView.widthAnchor.constraint(equalToConstant: 40.0),
            pichuImageView.heightAnchor.constraint(equalToConstant: 44.0),
            pichuImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
            pichuImageView.bottomAnchor.constraint(equalTo: pichuLabel.topAnchor),
            
            //Pikachu
            pikachuImageView.widthAnchor.constraint(equalToConstant: 185.0),
            pikachuImageView.heightAnchor.constraint(equalToConstant: 210.0),
            pikachuImageView.centerXAnchor.constraint(equalTo: pikachuLabel.centerXAnchor),
            pikachuImageView.bottomAnchor.constraint(equalTo: pichuImageView.bottomAnchor),
            
            //Raichu
            raichuImageView.widthAnchor.constraint(equalToConstant: 60.0),
            raichuImageView.heightAnchor.constraint(equalToConstant: 60.0),
            raichuImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
            raichuImageView.bottomAnchor.constraint(equalTo: raichuLabel.topAnchor),
            
            //Evolution
            evolutionImageView.widthAnchor.constraint(equalToConstant: 656.0),
            evolutionImageView.heightAnchor.constraint(equalToConstant: 310.0),
            evolutionImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            evolutionImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            evolutionImageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            evolutionImageView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
            

        ]
        
        let containerConstraints = [
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            ]
        
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8.0),
            scrollView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8.0),
            scrollView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8.0)
        ]
        
        
        let _ = [imageConstraints, containerConstraints, labelConstraints, scrollViewConstraints].map { $0.map { $0.isActive = true } }
        
    }
    
    func setupViewHierarchy() {
        // Add views
        
        //Labels
        self.view.addSubview(pichuLabel)
        self.view.addSubview(pikachuLabel)
        self.view.addSubview(raichuLabel)
        
        //Image Views
        self.view.addSubview(pichuImageView)
        self.view.addSubview(pikachuImageView)
        self.view.addSubview(raichuImageView)
        
        self.view.addSubview(containerView)
        
        //Scroll View
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(evolutionImageView)
    }
    
    
    // MARK: - Define Your Views Here
    
    //LABELS
    
    //Pikachu
    lazy var pichuLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightLight)
        label.text = "Pichu"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pikachuLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightSemibold)
        label.text = "Pikachu (no.25)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var raichuLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightLight)
        label.text = "Raichu"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //VIEWS
    
    //Container
    
    internal lazy var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    // IMAGEVIEWS
    
    //Pichu
    lazy var pichuImageView: UIImageView = {
        let image = UIImage(named: "pichu")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //Pikachu
    lazy var pikachuImageView: UIImageView = {
        let image = UIImage(named: "pikachu")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //Raichu
    lazy var raichuImageView: UIImageView = {
        let image = UIImage(named: "raichu")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //Evolution
    lazy var evolutionImageView: UIImageView = {
        let image = UIImage(named: "pikachu_evolution")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    //SCROLL
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceHorizontal = false
        scroll.alwaysBounceVertical = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    // ex:
    // let pikachuImageView: UIView = ... your code here ...
    
}
