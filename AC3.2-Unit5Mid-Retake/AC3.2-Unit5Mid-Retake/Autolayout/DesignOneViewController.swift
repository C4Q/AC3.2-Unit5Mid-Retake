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
       
        containerView.heightAnchor.constraint(equalToConstant: standardMargin).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: standardMargin).isActive = true
        
      
        pichuView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24.0).isActive = true
        pichuView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        pichuView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 30).isActive = true
        pichuView.trailingAnchor.constraint(equalTo: pikachuView.leadingAnchor, constant: -30).isActive = true
        
       
        
        
        
        raichuView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24.0).isActive = true
        raichuView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 24.0).isActive = true
        raichuView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 24.0).isActive = true
        
        
//        textLabel.leadingAnchor.constraint(equalTo: leftBarView.trailingAnchor, constant: 8.0).isActive = true
//        textLabel.trailingAnchor.constraint(equalTo: rightBarView.leadingAnchor, constant: -8.0).isActive = true
//        textLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//        textLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
      
    
    }
    
    func setupViewHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(pikachuView)
        containerView.addSubview(pichuView)
        containerView.addSubview(raichuView)
        containerView.addSubview(pichuTextLabel)
        containerView.addSubview(pikachuTextLabel)
        containerView.addSubview(raichuTextLabel)
        
        
    
    // MARK: - Define Your Views Here
    
        // ex:
        // let pikachuImageView: UIView = ... your code here ...
        
    }
    
  
        
    lazy var pichuView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = #imageLiteral(resourceName: "pichu")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pichuTextLabel:  UILabel = {
        let label: UILabel = UILabel()
        label.text = "Pichu"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var raichuTextLabel:  UILabel = {
        let label: UILabel = UILabel()
        label.text = "Raichu"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pikachuTextLabel:  UILabel = {
        let label: UILabel = UILabel()
        label.text = "Pikachu (no. 25)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var raichuView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = #imageLiteral(resourceName: "raichu")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pikachuView:  UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = #imageLiteral(resourceName: "pikachu")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
   
}
