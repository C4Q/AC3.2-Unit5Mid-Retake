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
    static let mainLabelFont = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightSemibold)
    static let subLabelFont = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightLight)
    
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
        
        edgesForExtendedLayout = []
        
        // set constraints
        _ = [pichuImageView,pikachuImageView,raichuImageView,headerLabel,raichulabel,pichulabel,blackContainer,evolutionScrollView,evolutionScrollView].map{$0.translatesAutoresizingMaskIntoConstraints = false}
        //label constraints
        _ = [headerLabel.topAnchor.constraint(equalTo: view.topAnchor),
             headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)].map{$0.isActive = true}
        
        _ = [raichulabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -standardMargin),
             raichulabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -standardMargin)].map{$0.isActive = true }
        
        _ = [pichulabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -standardMargin),
             pichulabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: standardMargin)].map{$0.isActive = true }
        
        
        //Imageview contraints
        _ = [raichuImageView.bottomAnchor.constraint(equalTo: raichulabel.topAnchor),
             raichuImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -standardMargin)].map{$0.isActive = true}
    
        _ = [pichuImageView.bottomAnchor.constraint(equalTo: pichulabel.topAnchor),
             pichuImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: standardMargin)].map{$0.isActive = true}
        
        _ = [pikachuImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             pikachuImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -standardMargin)].map{$0.isActive = true}
        
        //Black container contraints
        _ = [blackContainer.topAnchor.constraint(equalTo: view.centerYAnchor),
             blackContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             blackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             blackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ].map{$0.isActive = true}
        
        _ = [evolutionScrollView.topAnchor.constraint(equalTo: blackContainer.topAnchor, constant: standardMargin),
             evolutionScrollView.bottomAnchor.constraint(equalTo: blackContainer.bottomAnchor, constant: -standardMargin),
             evolutionScrollView.leadingAnchor.constraint(equalTo: blackContainer.leadingAnchor, constant: standardMargin),
             evolutionScrollView.trailingAnchor.constraint(equalTo: blackContainer.trailingAnchor, constant: -standardMargin)].map{$0.isActive = true}

        _ = [evolutionImageView.topAnchor.constraint(equalTo: evolutionScrollView.topAnchor),
             evolutionImageView.leadingAnchor.constraint(equalTo: evolutionScrollView.leadingAnchor),
             evolutionImageView.trailingAnchor.constraint(equalTo: evolutionScrollView.trailingAnchor),
             //evolutionImageView.bottomAnchor.constraint(equalTo: evolutionScrollView.bottomAnchor)
            ].map{$0.isActive = true}
        
        //Dimensions
        pichuImageView.frame.size = pichuDimensions
        raichuImageView.frame.size = raichuDimension
        pikachuImageView.frame.size = pikachuDimensions
        evolutionImageView.frame.size = bannerScrollingImageSize
    }
    
    func setupViewHierarchy() {
        // Add views
        
        _ = [pichuImageView,pikachuImageView,raichuImageView,headerLabel,raichulabel,pichulabel,blackContainer].map{self.view.addSubview($0)}
        
        blackContainer.addSubview(evolutionScrollView)
        evolutionScrollView.addSubview(evolutionImageView)
    }
    
    
    // MARK: - Define Your Views Here
    
    let pikachuImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image: UIImage = UIImage(named: "pikachu")!
        imageView.image = image
        return imageView
    }()
    
    let pichuImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image: UIImage = UIImage(named: "pichu")!
        imageView.image = image
        return imageView
    }()
    
    let raichuImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image: UIImage = UIImage(named: "raichu")!
        imageView.image = image
        return imageView
    }()
    
    let evolutionScrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let evolutionImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image: UIImage = UIImage(named: "pikachu_evolution")!
        imageView.image = image
        return imageView
    }()
    
    let blackContainer: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let headerLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Pikachu (No. 25)"
        label.font = DesignOneViewController.mainLabelFont
        return label
    }()
    
    let raichulabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Raichu"
        label.font = DesignOneViewController.subLabelFont
        return label
        
    }()
    
    let pichulabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Pichu"
        label.font = DesignOneViewController.subLabelFont
        return label
        
    }()
    
    // ex:
    // let pikachuImageView: UIView = ... your code here ...
    
}
