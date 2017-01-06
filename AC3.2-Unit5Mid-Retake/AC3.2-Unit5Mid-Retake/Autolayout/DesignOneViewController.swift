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
        blackView.translatesAutoresizingMaskIntoConstraints = false

        blackView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        blackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    func setupViewHierarchy() {
        view.addSubview(blackView)
        view.addSubview(labelPichu)
        view.addSubview(labelPikachu)
        view.addSubview(labelRaichu)

        blackView.backgroundColor = UIColor.black

    }
    
    
    // MARK: - Define Your Views Here
    let blackView = UIView()
    let pikachu = #imageLiteral(resourceName: "pikachu")
    let pichu = #imageLiteral(resourceName: "pichu")
    let raichu = #imageLiteral(resourceName: "raichu")
    let labelPichu = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let labelPikachu = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let labelRaichu = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
}
