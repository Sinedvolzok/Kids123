//
//  HomeView.swift
//  Kids123
//
//  Created by Denis Kozlov on 12.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit

class HomeView: UIView {
    // MARK:- VARS HOME ECSEPT BUTTONS (buttons on VC)
    private lazy var headerImage: UIImageView = {
        let imageView = UIImageView()
        //button text style
        imageView.image = #imageLiteral(resourceName: "HeaderImage")
        return imageView
    }()
    private lazy var labelAppImage: UIImageView = {
        let imageView = UIImageView()
        //button text style
        imageView.image = #imageLiteral(resourceName: "labelApp")
        return imageView
    }()
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    override init(frame: CGRect) {
        super.init(frame: frame)
        Setup()
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    func Setup(){
        [headerImage,
         labelAppImage,
            ].forEach{
            self.addSubview($0)
        }
        headerImage.anchorToNativeCenter(width: 240, height: 50)
        labelAppImage.anchorToTopCenter(top: 155, width: 100, height: 45)
        self.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BackgroundImage"))
        self.layer.opacity = 0.0
        self.animateOpacity(toValue: 1.0, duration: 1.5, delay: 0.5, key: "OnbordingOpacity")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.layer.opacity = 1.0
        }
    }
}
