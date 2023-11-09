//
//  MonsterSwipingController.swift
//  Kids123
//
//  Created by Denis Kozlov on 12.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit
import StoreKit

class MonsterSwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // MARK:- VARS CONTROLLER
    let monsters = [
        MonsterPage(eyeColor: #colorLiteral(red: 1, green: 0.9764705882, blue: 0.3764705882, alpha: 1),
                    sizeEye: CGSize(width: 100, height: 100),
                    radiusEye: 50,
                    colorPupil: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                    sizePupil: CGSize(width: 20, height: 20),
                    radiusPupil: 10,
                    colorEyelid: #colorLiteral(red: 0.4666666667, green: 0.5764705882, blue: 0.9647058824, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage"),
                    monsterColor: #colorLiteral(red: 0.4666666667, green: 0.5764705882, blue: 0.9647058824, alpha: 1),
                    monsterCorner: 100,
                    buttons: [UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-50),
                                          y: (UIScreen.main.bounds.size.height/2-50)-160)],
                    eyes: [EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.3294117647, green: 1, blue: 0.8392156863, alpha: 1),
                    sizeEye: CGSize(width: 100, height: 100),
                    radiusEye: 50,
                    colorPupil: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                    sizePupil: CGSize(width: 16, height: 45),
                    radiusPupil: 8,
                    colorEyelid: #colorLiteral(red: 0.662745098, green: 0.2588235294, blue: 0.7607843137, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage2"),
                    monsterColor: #colorLiteral(red: 0.662745098, green: 0.2588235294, blue: 0.7607843137, alpha: 1),
                    monsterCorner: 10,
                    buttons: [UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-50)-70,
                                          y: (UIScreen.main.bounds.size.height/2-50)-160),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-50)+70,
                                          y: (UIScreen.main.bounds.size.height/2-50)-160)],
                    eyes: [EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.3882352941, green: 1, blue: 0.3764705882, alpha: 1),
                    sizeEye: CGSize(width: 80, height: 80),
                    radiusEye: 40,
                    colorPupil: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                    sizePupil: CGSize(width: 10, height: 10),
                    radiusPupil: 5,
                    colorEyelid: #colorLiteral(red: 1, green: 0.3058823529, blue: 0.3058823529, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage3"),
                    monsterColor: #colorLiteral(red: 1, green: 0.3058823529, blue: 0.3058823529, alpha: 1),
                    monsterCorner: 160,
                    buttons: [UIButton(),UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-80,
                                          y: (UIScreen.main.bounds.size.height/2-40)-100),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40),
                                          y: (UIScreen.main.bounds.size.height/2-40)-200),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+80,
                                          y: (UIScreen.main.bounds.size.height/2-40)-140)],
                    eyes: [EyeView(),EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1),
                    sizeEye: CGSize(width: 80, height: 80),
                    radiusEye: 40,
                    colorPupil: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                    sizePupil: CGSize(width: 70, height: 70),
                    radiusPupil: 35,
                    colorEyelid: UIColor.clear,
                    imageEyelid: UIImage(),
                    monsterColor: #colorLiteral(red: 1, green: 0.6784313725, blue: 0.1921568627, alpha: 1),
                    monsterCorner: 80,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-60,
                                          y: (UIScreen.main.bounds.size.height/2-40)-100),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-60,
                                          y: (UIScreen.main.bounds.size.height/2-40)-220),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+60,
                                          y: (UIScreen.main.bounds.size.height/2-40)-100),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+60,
                                          y: (UIScreen.main.bounds.size.height/2-40)-220)],
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                    sizeEye: CGSize(width: 60, height: 60),
                    radiusEye: 30,
                    colorPupil: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1),
                    sizePupil: CGSize(width: 10, height: 10),
                    radiusPupil: 5,
                    colorEyelid: #colorLiteral(red: 0.9843137255, green: 0.1921568627, blue: 1, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage5"),
                    monsterColor: #colorLiteral(red: 0.9843137255, green: 0.1921568627, blue: 1, alpha: 1),
                    monsterCorner: 26,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-90,
                                          y: (UIScreen.main.bounds.size.height/2-40)-80),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-70,
                                          y: (UIScreen.main.bounds.size.height/2-40)-190),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+10,
                                          y: (UIScreen.main.bounds.size.height/2-40)-100),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+30,
                                          y: (UIScreen.main.bounds.size.height/2-40)-210),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+110,
                                          y: (UIScreen.main.bounds.size.height/2-40)-120)],
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 1, green: 0.1294117647, blue: 0.1294117647, alpha: 1),
                    sizeEye: CGSize(width: 60, height: 60),
                    radiusEye: 30,
                    colorPupil: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                    sizePupil: CGSize(width: 10, height: 24),
                    radiusPupil: 5,
                    colorEyelid: #colorLiteral(red: 0.2039215686, green: 0.1921568627, blue: 0.7254901961, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage6"),
                    monsterColor: #colorLiteral(red: 0.2039215686, green: 0.1921568627, blue: 0.7254901961, alpha: 1),
                    monsterCorner: 4,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),
                              UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-80,
                                          y: (UIScreen.main.bounds.size.height/2-40)-100),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)-70,
                                          y: (UIScreen.main.bounds.size.height/2-40)-220),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+10,
                                          y: (UIScreen.main.bounds.size.height/2-40)-80),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+10,
                                          y: (UIScreen.main.bounds.size.height/2-40)-200),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+100,
                                          y: (UIScreen.main.bounds.size.height/2-40)-60),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-40)+110,
                                          y: (UIScreen.main.bounds.size.height/2-40)-180)],
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView(),EyeView(),
                           EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 1, green: 0.3058823529, blue: 0.3058823529, alpha: 1),
                    sizeEye: CGSize(width: 30, height: 90),
                    radiusEye: 15,
                    colorPupil: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1),
                    sizePupil: CGSize(width: 10, height: 10),
                    radiusPupil: 5,
                    colorEyelid: UIColor.clear,
                    imageEyelid: UIImage(),
                    monsterColor: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1),
                    monsterCorner: 50,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),
                              UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-30)-25,
                                          y: (UIScreen.main.bounds.size.height/2-30)-210),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)-70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-160),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)-25,
                                          y: (UIScreen.main.bounds.size.height/2-30)-110),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+20,
                                          y: (UIScreen.main.bounds.size.height/2-30)-160),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+65,
                                          y: (UIScreen.main.bounds.size.height/2-30)-210),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+110,
                                          y: (UIScreen.main.bounds.size.height/2-30)-160),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+65,
                                          y: (UIScreen.main.bounds.size.height/2-30)-110)],
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView(),EyeView(),
                           EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1),
                    sizeEye: CGSize(width: 60, height: 60),
                    radiusEye: 10,
                    colorPupil: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1),
                    sizePupil: CGSize(width: 10, height: 26),
                    radiusPupil: 5,
                    colorEyelid: #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage8"),
                    monsterColor: #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1),
                    monsterCorner: 10,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),
                              UIButton(),UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-30)-70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-220),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+0,
                                          y: (UIScreen.main.bounds.size.height/2-30)-220),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-220),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)-70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-150),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+0,
                                          y: (UIScreen.main.bounds.size.height/2-30)-150),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-150),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)-70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-80),
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-30)+70,
                                          y: (UIScreen.main.bounds.size.height/2-30)-80)],
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView(),EyeView(),
                           EyeView(),EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.5137254902, green: 1, blue: 0.9725490196, alpha: 1),
                    sizeEye: CGSize(width: 40, height: 40),
                    radiusEye: 20,
                    colorPupil: #colorLiteral(red: 0.2039215686, green: 0.6509803922, blue: 0.6235294118, alpha: 1),
                    sizePupil: CGSize(width: 16, height: 16),
                    radiusPupil: 8,
                    colorEyelid: #colorLiteral(red: 0.2274509804, green: 0.831372549, blue: 0.2156862745, alpha: 1),
                    imageEyelid: #imageLiteral(resourceName: "upperEyelidImage9"),
                    monsterColor: #colorLiteral(red: 0.2274509804, green: 0.831372549, blue: 0.2156862745, alpha: 1),
                    monsterCorner: 30,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),
                              UIButton(),UIButton(),UIButton(),UIButton()],
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-25)-60,
                                          y: (UIScreen.main.bounds.size.height/2-25)-60),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)-85,
                                          y: (UIScreen.main.bounds.size.height/2-25)-190),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)-40,
                                          y: (UIScreen.main.bounds.size.height/2-25)-140),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)+0,
                                          y: (UIScreen.main.bounds.size.height/2-25)-80),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)+20,
                                          y: (UIScreen.main.bounds.size.height/2-25)-170),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)+10,
                                          y: (UIScreen.main.bounds.size.height/2-25)-230),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)+120,
                                          y: (UIScreen.main.bounds.size.height/2-25)-230),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)+60,
                                          y: (UIScreen.main.bounds.size.height/2-25)-110),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-25)+80,
                                          y: (UIScreen.main.bounds.size.height/2-25)-190)],
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView(),EyeView(),
                           EyeView(),EyeView(),EyeView(),EyeView()]),
        MonsterPage(eyeColor: #colorLiteral(red: 0.168627451, green: 0.168627451, blue: 0.168627451, alpha: 1),
                    sizeEye: CGSize(width: 30, height: 30),
                    radiusEye: 15,
                    colorPupil: #colorLiteral(red: 0.168627451, green: 0.168627451, blue: 0.168627451, alpha: 1),
                    sizePupil: CGSize(width: 16, height: 16),
                    radiusPupil: 8,
                    colorEyelid: UIColor.clear,
                    imageEyelid: UIImage(),
                    monsterColor: #colorLiteral(red: 0.7411764706, green: 0.537254902, blue: 1, alpha: 1),
                    monsterCorner: 70,
                    buttons: [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),
                              UIButton(),UIButton(),UIButton(),UIButton(),UIButton()],
                    
                    originsEyes: [CGPoint(x: (UIScreen.main.bounds.size.width/2-15)-90,
                                          y: (UIScreen.main.bounds.size.height/2-15)-220),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)-90,
                                          y: (UIScreen.main.bounds.size.height/2-15)-160),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)-90,
                                          y: (UIScreen.main.bounds.size.height/2-15)-100),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)-30,
                                          y: (UIScreen.main.bounds.size.height/2-15)-220),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)-30,
                                          y: (UIScreen.main.bounds.size.height/2-15)-160),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)+30,
                                          y: (UIScreen.main.bounds.size.height/2-15)-220),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)+30,
                                          y: (UIScreen.main.bounds.size.height/2-15)-160),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)+90,
                                          y: (UIScreen.main.bounds.size.height/2-15)-220),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)+90,
                                          y: (UIScreen.main.bounds.size.height/2-15)-160),
                                  
                                  CGPoint(x: (UIScreen.main.bounds.size.width/2-15)+90,
                                          y: (UIScreen.main.bounds.size.height/2-15)-100)],
                    
                    eyes: [EyeView(),EyeView(),EyeView(),EyeView(),EyeView(),
                           EyeView(),EyeView(),EyeView(),EyeView(),EyeView()])
        ]
    let controlButtonProps = [ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 0,
                                              image: #imageLiteral(resourceName: "NextButtonImage2")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage3")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage4")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage5")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage6")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage7")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage8")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage9")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImage10")),
                              ButtonsNextPrev(buttonNextAlpha: 1,
                                              buttonPrevAlpha: 1,
                                              image: #imageLiteral(resourceName: "NextButtonImagePlay")),
                              ButtonsNextPrev(buttonNextAlpha: 0,
                                              buttonPrevAlpha: 1,
                                              image: UIImage()),]
    // MARK:- MOUTHS VARS
    let mouths = [MouthProp(mouths: [MouthView(),],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 1, green: 0.7019607843, blue: 0.2549019608, alpha: 1),
                            mouthColor: #colorLiteral(red: 1, green: 0.3725490196, blue: 0.231372549, alpha: 1)),
                  MouthProp(mouths: [MouthView(),],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.262745098, green: 0.7803921569, blue: 0.2156862745, alpha: 1),
                            mouthColor: #colorLiteral(red: 0.1843137255, green: 0.1843137255, blue: 0.1843137255, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 25,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.231372549, green: 0.3843137255, blue: 0.9333333333, alpha: 1),
                            mouthColor: #colorLiteral(red: 0.1058823529, green: 0.2392156863, blue: 0.5843137255, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1),
                            mouthColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.5098039216, green: 0.05882352941, blue: 0.5215686275, alpha: 1),
                            mouthColor: #colorLiteral(red: 0.3215686275, green: 0.8705882353, blue: 0.3098039216, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                            mouthColor: #colorLiteral(red: 1, green: 0.1294117647, blue: 0.1294117647, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.6901960784, green: 0.6901960784, blue: 0.6, alpha: 1),
                            mouthColor: #colorLiteral(red: 0.231372549, green: 0.231372549, blue: 0.231372549, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1),
                            mouthColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.2823529412, green: 0.8705882353, blue: 1, alpha: 1),
                            mouthColor: #colorLiteral(red: 0.2039215686, green: 0.6509803922, blue: 0.6235294118, alpha: 1)),
                  MouthProp(mouths: [MouthView()],
                            mouthSize: CGSize(width: 120,
                                              height: 40),
                            lipsWidth: 18,
                            mouthCornrer: 20,
                            lipsColor: #colorLiteral(red: 0.168627451, green: 0.168627451, blue: 0.168627451, alpha: 1),
                            mouthColor: #colorLiteral(red: 1, green: 0, blue: 1, alpha: 1)),]
    // MARK:- NUMBER VARS
    let numbers = [NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 1, green: 0.3725490196, blue: 0.231372549, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 0,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandyOne")),
                   NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 0.3647058824, green: 0.9843137255, blue: 0.6862745098, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 1,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandyTwo")),
                   NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 0.3882352941, green: 1, blue: 0.3764705882, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2),
                               shapeNumberNum: 2,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandyThree")),
                   NumbersProp(numbers: [NumberView(),NumberView()],
                               litters: [NumberView(),NumberView()],
                               numberColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 3,
                               shapeElseNumberNum: 4, candyImage: #imageLiteral(resourceName: "CandyFour")),
                   NumbersProp(numbers: [NumberView(),NumberView()],
                               litters: [NumberView(),NumberView()],
                               numberColor: #colorLiteral(red: 0.3215686275, green: 0.8705882353, blue: 0.3098039216, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 5,
                               shapeElseNumberNum: 6, candyImage: #imageLiteral(resourceName: "CandyFive")),
                   NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 1, green: 0.1294117647, blue: 0.1294117647, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 7,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandySix")),
                   NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.2352941176, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 8,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandySeven")),
                   NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 1, green: 0, blue: 1, alpha: 1),
                               litterColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1),
                               shapeNumberNum: 9,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandyEight")),
                   NumbersProp(numbers: [NumberView()],
                               litters: [NumberView()],
                               numberColor: #colorLiteral(red: 0.5137254902, green: 1, blue: 0.9725490196, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 10,
                               shapeElseNumberNum: 0, candyImage: #imageLiteral(resourceName: "CandyNine")),
                   NumbersProp(numbers: [NumberView(),NumberView()],
                               litters: [NumberView(),NumberView()],
                               numberColor: #colorLiteral(red: 1, green: 0, blue: 1, alpha: 1),
                               litterColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1),
                               shapeNumberNum: 12,
                               shapeElseNumberNum: 11, candyImage: #imageLiteral(resourceName: "CandyTen")),]
    
    // MARK:- NEXT/PREV BUTTONS
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        //button text style
        button.setImage(#imageLiteral(resourceName: "NextButtonImage"), for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
//    private lazy var prevButton: UIButton = {
//        let button = UIButton()
//        //button text style
//        button.transform = CGAffineTransform(scaleX: -1, y: 1)
//        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var monsterPageController: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = monsters.count
        pageControl.currentPageIndicatorTintColor = UIColor.clear
        pageControl.pageIndicatorTintColor = UIColor.clear
        return pageControl
    }()
    // MARK:- ADD VIEWS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsControls()
        collectionView?.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupButtonsControls() {
        view.addSubview(nextButton)
//        view.addSubview(prevButton)
        nextButton.anchorToBottomRight(bottom: 150, right: 0, width: 60, height: 50)
//        prevButton.anchorToBottomLeft(bottom: 200, left: 0, width: 60, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monsters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
        
        let monster = monsters[indexPath.item]
        
        cell.monster = monster
        
        let number = numbers[indexPath.item]
        
        cell.number = number
        
        let mouth = mouths[indexPath.item]
        
        cell.mouth = mouth
        
        let button = controlButtonProps[indexPath.item]
        nextButton.setImage(button.image, for: .normal)
        
        // MARK:- ADD ORIGINS TO EYES
        if indexPath.item == 0 {
            print(cell.eyesArray.count)
            print(cell.numbersArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
        } else if indexPath.item == 1 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
        } else if indexPath.item == 2 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
        } else if indexPath.item == 3 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
        } else if indexPath.item == 4 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
            cell.eyesArray[4].frame.origin = monster.originsEyes[4]
            cell.buttonsArray[4].frame.origin = monster.originsEyes[4]
        } else if indexPath.item == 5 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
            cell.eyesArray[4].frame.origin = monster.originsEyes[4]
            cell.buttonsArray[4].frame.origin = monster.originsEyes[4]
            cell.eyesArray[5].frame.origin = monster.originsEyes[5]
            cell.buttonsArray[5].frame.origin = monster.originsEyes[5]
        } else if indexPath.item == 6 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
            cell.eyesArray[4].frame.origin = monster.originsEyes[4]
            cell.buttonsArray[4].frame.origin = monster.originsEyes[4]
            cell.eyesArray[5].frame.origin = monster.originsEyes[5]
            cell.buttonsArray[5].frame.origin = monster.originsEyes[5]
            cell.eyesArray[6].frame.origin = monster.originsEyes[6]
            cell.buttonsArray[6].frame.origin = monster.originsEyes[6]
            
            let colorArray = [#colorLiteral(red: 1, green: 0.3058823529, blue: 0.3058823529, alpha: 1),#colorLiteral(red: 1, green: 0.768627451, blue: 0.1764705882, alpha: 1),#colorLiteral(red: 1, green: 0.9176470588, blue: 0.1764705882, alpha: 1),#colorLiteral(red: 0.5294117647, green: 0.8823529412, blue: 0.2549019608, alpha: 1),#colorLiteral(red: 0.1803921569, green: 0.9098039216, blue: 0.8196078431, alpha: 1),#colorLiteral(red: 0.3294117647, green: 0.4274509804, blue: 0.9490196078, alpha: 1),#colorLiteral(red: 0.8784313725, green: 0.2392156863, blue: 0.9843137255, alpha: 1)]
            cell.eyesArray.enumerated().forEach{
                $0.element.colorEye = colorArray[$0.offset]
            }
        } else if indexPath.item == 7 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
            cell.eyesArray[4].frame.origin = monster.originsEyes[4]
            cell.buttonsArray[4].frame.origin = monster.originsEyes[4]
            cell.eyesArray[5].frame.origin = monster.originsEyes[5]
            cell.buttonsArray[5].frame.origin = monster.originsEyes[5]
            cell.eyesArray[6].frame.origin = monster.originsEyes[6]
            cell.buttonsArray[6].frame.origin = monster.originsEyes[6]
            cell.eyesArray[7].frame.origin = monster.originsEyes[7]
            cell.buttonsArray[7].frame.origin = monster.originsEyes[7]
        } else if indexPath.item == 8 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
            cell.eyesArray[4].frame.origin = monster.originsEyes[4]
            cell.buttonsArray[4].frame.origin = monster.originsEyes[4]
            cell.eyesArray[5].frame.origin = monster.originsEyes[5]
            cell.buttonsArray[5].frame.origin = monster.originsEyes[5]
            cell.eyesArray[6].frame.origin = monster.originsEyes[6]
            cell.buttonsArray[6].frame.origin = monster.originsEyes[6]
            cell.eyesArray[7].frame.origin = monster.originsEyes[7]
            cell.buttonsArray[7].frame.origin = monster.originsEyes[7]
            cell.eyesArray[8].frame.origin = monster.originsEyes[8]
            cell.buttonsArray[8].frame.origin = monster.originsEyes[8]
        } else if indexPath.item == 9 {
            print(cell.eyesArray.count)
            cell.eyesArray[0].frame.origin = monster.originsEyes[0]
            cell.buttonsArray[0].frame.origin = monster.originsEyes[0]
            cell.eyesArray[1].frame.origin = monster.originsEyes[1]
            cell.buttonsArray[1].frame.origin = monster.originsEyes[1]
            cell.eyesArray[2].frame.origin = monster.originsEyes[2]
            cell.buttonsArray[2].frame.origin = monster.originsEyes[2]
            cell.eyesArray[3].frame.origin = monster.originsEyes[3]
            cell.buttonsArray[3].frame.origin = monster.originsEyes[3]
            cell.eyesArray[4].frame.origin = monster.originsEyes[4]
            cell.buttonsArray[4].frame.origin = monster.originsEyes[4]
            cell.eyesArray[5].frame.origin = monster.originsEyes[5]
            cell.buttonsArray[5].frame.origin = monster.originsEyes[5]
            cell.eyesArray[6].frame.origin = monster.originsEyes[6]
            cell.buttonsArray[6].frame.origin = monster.originsEyes[6]
            cell.eyesArray[7].frame.origin = monster.originsEyes[7]
            cell.buttonsArray[7].frame.origin = monster.originsEyes[7]
            cell.eyesArray[8].frame.origin = monster.originsEyes[8]
            cell.buttonsArray[8].frame.origin = monster.originsEyes[8]
            cell.eyesArray[9].frame.origin = monster.originsEyes[9]
            cell.buttonsArray[9].frame.origin = monster.originsEyes[9]
        }
//        cell.numberArray.forEach{
//            $0.mouth
//        }
        guard indexPath.item != 3 else {return cell}
        cell.eyesArray.forEach{
           $0.animateAnxiousLook()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        monsterPageController.currentPage = Int(x/view.frame.width)
    }
    // MARK:- NEXT/PREV FUNC
    @objc private func handleNext() {
        print("NEXT")
        let nextIndex = min(monsterPageController.currentPage + 1, monsters.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        guard monsterPageController.currentPage != monsters.count - 1 else {
            SKStoreReviewController.requestReview()
            addHomeVC()
            return
        }
        monsterPageController.currentPage = nextIndex
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
//        UIView.animate(withDuration: 1.0, animations: {
//            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
//        })
    }
    
    @objc private func handlePrev() {
        print("PREV")
        let nextIndex = min(monsterPageController.currentPage - 1, monsters.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        monsterPageController.currentPage = nextIndex
        UIView.animate(withDuration: 1.0, animations: {
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        })
    }
    
    func addHomeVC() {
    //  animations down below
        self.view.layer.opacity = 1.0
        self.view.animateOpacity(toValue: 0.0, duration: 0.5, delay: 0.5, key: "OnbordingOpacity")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.view.layer.opacity = 0.0
            self.removeFromParent()
        }
    }
}
