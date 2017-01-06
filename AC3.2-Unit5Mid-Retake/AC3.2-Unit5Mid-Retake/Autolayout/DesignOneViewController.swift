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
   
    // Didn't have time to do the other two questions. Will work on it at home. 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleForCell
        self.view.backgroundColor = .white
        
        setupViewHierarchy()
        configureConstraints()
    }
    let pikachuImageView: UIImageView = UIImageView()
    let pokemonLabel: UILabel = UILabel()
    let pichuImageView: UIImageView = UIImageView()
    let scrollView: UIScrollView = UIScrollView()
    let pikachuEvolutionImageView: UIImageView = UIImageView()
    let raichuImageView: UIImageView = UIImageView()
    let pichuNameLabel:UILabel = UILabel()
    let raichuNameLabel: UILabel = UILabel()
    
    func configureConstraints() {
        self.edgesForExtendedLayout = []
        
        let _ = [pokemonLabel,
                 pikachuImageView,
                 pichuImageView,
                 scrollView,
                 pikachuEvolutionImageView,
                 raichuImageView,
                 pichuNameLabel,
                 raichuNameLabel,
                 
                 
                 ].map{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        
        let _ = [
            pokemonLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
            pokemonLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            pikachuImageView.topAnchor.constraint(equalTo: pokemonLabel.bottomAnchor, constant: standardMargin),
            pikachuImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            pichuImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: standardMargin),
            pichuImageView.bottomAnchor.constraint(equalTo: pichuNameLabel.topAnchor),
            
            raichuImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -standardMargin),
            raichuImageView.bottomAnchor.constraint(equalTo: raichuNameLabel.topAnchor),
            
            // Labels
            pichuNameLabel.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -standardMargin),
            pichuNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: standardMargin),
            
            raichuNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -standardMargin),
            raichuNameLabel.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -standardMargin),
            
            // ScrollView
            scrollView.heightAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            //Image inside ScrollView
            pikachuEvolutionImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: standardMargin),
            pikachuEvolutionImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: standardMargin),
            pikachuEvolutionImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: standardMargin),
            pikachuEvolutionImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: standardMargin),
            
            
            ].map { $0.isActive = true }
        
        
        
    }
    // Okay so currently I am not resizing the images. Whatever size they are is the size they appear. So how do I change the size of an image? I have tried sizeToFit, sizeThatFits, contentSize, and systemLayoutSizeFitting,
    func setupViewHierarchy() {
        // Add views
        pokemonLabel.textColor = .black
        pokemonLabel.text = "Pikachu (no.25)"
        pokemonLabel.font = mainLabelFont
        self.view.addSubview(pokemonLabel)
        
        pikachuImageView.image = #imageLiteral(resourceName: "pikachu")
        pikachuImageView.sizeThatFits(pichuDimensions)
        self.view.addSubview(pikachuImageView)
        
        
        pichuNameLabel.text = "Pichu"
        pichuNameLabel.font = subLabelFont
        self.view.addSubview(pichuNameLabel)
        
        pichuImageView.image = #imageLiteral(resourceName: "pichu")
        pichuImageView.sizeThatFits(pichuDimensions)
        self.view.addSubview(pichuImageView)
        
        raichuNameLabel.text = "Raichu"
        raichuNameLabel.font = subLabelFont
        self.view.addSubview(raichuNameLabel)
        
        raichuImageView.image = #imageLiteral(resourceName: "raichu")
        self.view.addSubview(raichuImageView)
        
        pikachuEvolutionImageView.image = #imageLiteral(resourceName: "pikachu_evolution")
        self.scrollView.addSubview(pikachuEvolutionImageView)
        
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.backgroundColor = .black
        self.view.addSubview(scrollView)
        
        //pichuImageView.invalidateIntrinsicContentSize()
        //scrollView.sizeToFit()
        //scrollView.contentSize = view.sizeThatFits(bannerScrollingImageSize)
        //scrollView.systemLayoutSizeFitting(bannerScrollingImageSize)
        //scrollView.contentSize = scrollView.sizeThatFits(pikachuDimensions)
        
        //pikachuEvolutionImageView.sizeThatFits(bannerScrollingImageSize)
        //pikachuEvolutionImageView.systemLayoutSizeFitting(bannerScrollingImageSize)
        
    }
    
    
    // looks like I can't use a computer propery/ closure to make my labels... I am not exactly sure why. An issue with scope...Look into this later
    /*
     internal var pikachuLabel: UILabel = {
     let label: UILabel = UILabel()
     label.font = mainLabelFont
     
     }()
     
     */
    
    
    // MARK: - Define Your Views Here
    
    // ex:
    // let pikachuImageView: UIView = ... your code here ...
    
}
