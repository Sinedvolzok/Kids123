//
//  MouthView.swift
//  Kids123
//
//  Created by Denis Kozlov on 21.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit

class MouthView: UIView {
    
    var mouthSize: CGSize
    var lipsWidth: CGFloat
    var mouthCorner: CGFloat
    var lipsColor: UIColor
    var mouthColor: UIColor
    
    init(mouthSize:  CGSize = .zero, lipsWidth: CGFloat = 0, mouthCorner: CGFloat = 0,
         lipsColor: UIColor = UIColor.clear, mouthColor: UIColor = UIColor.clear) {
        
        self.mouthSize = mouthSize
        self.lipsWidth = lipsWidth
        self.mouthCorner = mouthCorner
        self.lipsColor = lipsColor
        self.mouthColor = mouthColor
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        frame.size = mouthSize
        layer.borderWidth = lipsWidth
        layer.cornerRadius = mouthCorner
        layer.borderColor = lipsColor.cgColor
        layer.backgroundColor = mouthColor.cgColor
    }
    
    func animateMouth(to position: CGPoint) {
        UIView.animate(withDuration: 2.0, animations: {
            self.layer.position = position
            self.frame.size = CGSize(width: 60, height: 60)
            self.layer.cornerRadius = 30
        }) { (true) in
            
        }
    }
}
