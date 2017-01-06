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
    
    lazy var bigPickachuImage: UIImageView = {
        let pI = UIImageView()
        pI.image = UIImage(named: "pikachu")
        
        return pI
    }()
    
    lazy var pichuImage: UIImageView = {
        let pI = UIImageView()
        pI.image = UIImage(named: "pichu")
        return pI
    }()
    
    lazy var raichuImage: UIImageView = {
        let pI = UIImageView()
        pI.image = UIImage(named: "raichu")
        return pI
    }()
    
    lazy var bottomImage: UIImageView = {
        let pI = UIImageView()
        pI.image = UIImage(named: "pikachu_evolution")
        return pI
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleForCell
        self.view.backgroundColor = .white
        
        setupViewHierarchy()
        configureConstraints()
    }
    
    func setupViewHierarchy() {
        self.view.addSubview(bigPickachuImage)
        self.view.addSubview(pichuImage)
        self.view.addSubview(raichuImage)
        self.view.addSubview(bottomImage)

        
    }

    func configureConstraints() {
        let _ = [
            bigPickachuImage,
            pichuImage,
            raichuImage,
            bottomImage
            ].map{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let _ = [
            bigPickachuImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
        
        ]
        
    }
    
    
    
    // MARK: - Define Your Views Here
    
    // ex:
    // let pikachuImageView: UIView = ... your code here ...
    
}
