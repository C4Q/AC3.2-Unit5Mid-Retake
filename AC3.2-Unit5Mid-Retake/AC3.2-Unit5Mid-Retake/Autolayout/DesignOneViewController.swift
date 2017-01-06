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
        
        labelPichu.text = "Pichu"
        labelPikachu.text = "Pikachu"
        labelRaichu.text = "Raichu"
    }
    
    func configureConstraints() {
        blackView.translatesAutoresizingMaskIntoConstraints = false

        blackView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        blackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        //not sure how to pin the pokemon and labels
        //Pikachu center x anchor would be view.centerXAnchor
        //Pikachu center Y anchor would be view.centerYAnchor wth a multiplier of 0.25 or 0.75.
        //Pikachu dimensions would be set to the constant provided
        
        //Pichu and Raichu's bottom anchors would be pinned to Pikachu's bottom anchor
        //Pichu's center X anchor would be the view's center X anchor with a multiplier of 0.25
        //Raichu's center X anchor would be the view's center X anchor with a multiplier of 0.75
        //Pichu and Raichu's dimensions would be derived from the constants provided
        
        //Pichu and Raichu's labels would have their top anchors pinned to P/R's bottom anchors with a constant of standardMargin
        
        //Pikachu's label would have it's center x anchor pinned to Pikachu's center x anchor (i.e., the view's center x anchor)
        //Pikachu's label's top anchor would be set to the view's top anchor
        
        //The labels would be set to their respective fonts with Pikachu's as the mainlabel font and Pichu and Raichu's as the sublabel Font.
        
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
