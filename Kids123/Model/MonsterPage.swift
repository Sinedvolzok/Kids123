//
//  MonsterPage.swift
//  Kids123
//
//  Created by Denis Kozlov on 12.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit

struct MonsterPage {
    
    let eyeColor: UIColor
    let sizeEye: CGSize
    let radiusEye: CGFloat
    
    let colorPupil: UIColor
    let sizePupil: CGSize
    let radiusPupil: CGFloat
    
    let colorEyelid:UIColor
    let imageEyelid:UIImage
    
    let monsterColor: UIColor
    let monsterCorner: CGFloat
    
    let buttons: [UIButton]
    let originsEyes: [CGPoint]
    
    let eyes: [EyeView]
    
}

struct ButtonsNextPrev {
    
    let buttonNextAlpha: CGFloat
    let buttonPrevAlpha: CGFloat
    let image: UIImage
    
}

struct NumbersProp {
    
    let numbers: [NumberView]
    let litters: [NumberView]
    let numberColor: UIColor
    let litterColor: UIColor
    let shapeNumberNum: Int
    let shapeElseNumberNum: Int
    let candyImage: UIImage
    
}

struct MouthProp {
    
    let mouths: [MouthView]
    let mouthSize: CGSize
    let lipsWidth: CGFloat
    let mouthCornrer: CGFloat
    let lipsColor: UIColor
    let mouthColor: UIColor
}

enum ChannelSound {
    case backgrounds
    case effects
    case music
    case effectsOne
    case effectsTwo
    case effectsThree
}
