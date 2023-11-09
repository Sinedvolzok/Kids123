//
//  PageCell.swift
//  Kids123
//
//  Created by Denis Kozlov on 12.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit
import AVFoundation

class PageCell: UICollectionViewCell {
    // MARK:- VARS CELL
    var monster: MonsterPage? {
        didSet {
            endDrawingAll = false
            guard let unwrpappedMonster = monster else {return}
            pageView.layer.cornerRadius = unwrpappedMonster.monsterCorner
            pageView.backgroundColor = unwrpappedMonster.monsterColor
            buttonsArray = unwrpappedMonster.buttons
            eyesArray = unwrpappedMonster.eyes
            eyesArray.forEach{
                $0.colorEye = unwrpappedMonster.eyeColor
                $0.sizeEye = unwrpappedMonster.sizeEye
                $0.radiusEye = unwrpappedMonster.radiusEye
                $0.colorPupil = unwrpappedMonster.colorPupil
                $0.sizePupil = unwrpappedMonster.sizePupil
                $0.radiusPupil = unwrpappedMonster.radiusPupil
                $0.colorEyelid = unwrpappedMonster.colorEyelid
                $0.imageEyelid = unwrpappedMonster.imageEyelid
            }
            buttonsArray.forEach{
                $0.frame.size = unwrpappedMonster.sizeEye
                $0.layer.cornerRadius = unwrpappedMonster.radiusEye
            }
            if buttonsArray.count == 1 {
                playSound(fileName: "monsterBGSound", channel: .backgrounds)
                playerBackgrounds?.numberOfLoops = -1
            } else if buttonsArray.count == 2 {
                playerBackgrounds?.stop()
            }
            if buttonsArray.count == 10 {
                buttonsArray.forEach{
                    $0.frame.size = CGSize(width: 45, height: 45)
                }
            }
            addViewsToViewController()
        }
    }
    
    var number: NumbersProp? {
        didSet {
            guard let unwrpappedNumber = number else {return}
            littersArray = unwrpappedNumber.litters
            numbersArray = unwrpappedNumber.numbers
            littersArray.forEach{
                $0.shapeLayerNum = unwrpappedNumber.shapeNumberNum
                $0.strokeColor = unwrpappedNumber.litterColor.cgColor
                $0.strokeEnd = 1.0
                $0.lineWidth = 55
                self.addSubview($0)
            }
            if littersArray.count == 2 {
                littersArray[1].shapeLayerNum = unwrpappedNumber.shapeElseNumberNum
            }
            numbersArray.forEach{
                $0.shapeLayerNum = unwrpappedNumber.shapeNumberNum
                $0.strokeColor = unwrpappedNumber.numberColor.cgColor
                $0.strokeEnd = 0.00
                $0.lineWidth = 45
                $0.candyImage = unwrpappedNumber.candyImage
                self.addSubview($0)
            }
            if numbersArray.count == 2 {
                numbersArray[1].shapeLayerNum = unwrpappedNumber.shapeElseNumberNum
                numbersArray[1].strokeEnd = 0.0
            }
            buttonsArray.forEach{
                self.bringSubviewToFront($0)
            }
        }
    }
    
    var mouth: MouthProp? {
        didSet {
            guard let unwrpappedMouth = mouth else {return}
            
            numbersArray.forEach{
                $0.mouth.mouthSize = unwrpappedMouth.mouthSize
                $0.mouth.mouthCorner = unwrpappedMouth.mouthCornrer
                $0.mouth.lipsWidth = unwrpappedMouth.lipsWidth
                $0.mouth.lipsColor = unwrpappedMouth.lipsColor
                $0.mouth.mouthColor = unwrpappedMouth.mouthColor
                $0.animateMouth()
            }
        }
    }
    
    var pageView = UIView()
    
    var monsterCorner = CGFloat()
    var monsterColor = UIColor()
    
    var eyesArray = [EyeView]()
    var buttonsArray = [UIButton]()
    var numbersArray = [NumberView]()
    var littersArray = [NumberView]()
    var switchTwoNumber = false
    var endDrawingAll = false
    
    // MARK:- Music & Sounds
    var playerBackgrounds: AVAudioPlayer?
    var playerEffects: AVAudioPlayer?
    var playerEffectsOne: AVAudioPlayer?
    var playerEffectsTwo: AVAudioPlayer?
    var playerEffectsThree: AVAudioPlayer?
    var playerMusic: AVAudioPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK:- ADD VIEWS
    func addViewsToViewController() {
        playSound(fileName: "jumpSound", channel: .effects, delay: 0.2)
        pageView.transform.ty = 800
        addSubview(pageView)
        
        eyesArray.forEach{
            $0.transform.ty = 800
            self.addSubview($0)
        }
        buttonsArray.forEach{
            $0.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            $0.alpha = 0.02
            $0.transform.ty = 800
            self.addSubview($0)
        }
        if buttonsArray.count == 1 {
            UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.pageView.transform.ty = 30
                self.eyesArray.forEach{
                    $0.transform.ty = 30
                }
                self.buttonsArray.forEach{
                    $0.transform.ty = 30
                }
            })
        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.pageView.transform.ty = 30
                self.eyesArray.forEach{
                    $0.transform.ty = 30
                }
                self.buttonsArray.forEach{
                    $0.transform.ty = 30
                }
            })
        }
        
        if buttonsArray.count == 1 {
            print("Add Target x1")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
        } else if buttonsArray.count == 2 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
        } else if buttonsArray.count == 3 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
        } else if buttonsArray.count == 4 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
        } else if buttonsArray.count == 5 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
            buttonsArray[4].addTarget(self,
                                      action: #selector(touchEyeFifth),
                                      for: .touchDown)
        } else if buttonsArray.count == 6 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
            buttonsArray[4].addTarget(self,
                                      action: #selector(touchEyeFifth),
                                      for: .touchDown)
            buttonsArray[5].addTarget(self,
                                      action: #selector(touchEyeSixth),
                                      for: .touchDown)
        } else if buttonsArray.count == 7 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
            buttonsArray[4].addTarget(self,
                                      action: #selector(touchEyeFifth),
                                      for: .touchDown)
            buttonsArray[5].addTarget(self,
                                      action: #selector(touchEyeSixth),
                                      for: .touchDown)
            buttonsArray[6].addTarget(self,
                                      action: #selector(touchEyeSeventh),
                                      for: .touchDown)
        } else if buttonsArray.count == 8 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
            buttonsArray[4].addTarget(self,
                                      action: #selector(touchEyeFifth),
                                      for: .touchDown)
            buttonsArray[5].addTarget(self,
                                      action: #selector(touchEyeSixth),
                                      for: .touchDown)
            buttonsArray[6].addTarget(self,
                                      action: #selector(touchEyeSeventh),
                                      for: .touchDown)
            buttonsArray[7].addTarget(self,
                                      action: #selector(touchEyeEighth),
                                      for: .touchDown)
        } else if buttonsArray.count == 9 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
            buttonsArray[4].addTarget(self,
                                      action: #selector(touchEyeFifth),
                                      for: .touchDown)
            buttonsArray[5].addTarget(self,
                                      action: #selector(touchEyeSixth),
                                      for: .touchDown)
            buttonsArray[6].addTarget(self,
                                      action: #selector(touchEyeSeventh),
                                      for: .touchDown)
            buttonsArray[7].addTarget(self,
                                      action: #selector(touchEyeEighth),
                                      for: .touchDown)
            buttonsArray[8].addTarget(self,
                                      action: #selector(touchEyeNinth),
                                      for: .touchDown)
        } else if buttonsArray.count == 10 {
            print("Add Target x2")
            buttonsArray[0].addTarget(self,
                                      action: #selector(touchEyeFirst),
                                      for: .touchDown)
            buttonsArray[1].addTarget(self,
                                      action: #selector(touchEyeSecond),
                                      for: .touchDown)
            buttonsArray[2].addTarget(self,
                                      action: #selector(touchEyeThird),
                                      for: .touchDown)
            buttonsArray[3].addTarget(self,
                                      action: #selector(touchEyeFourth),
                                      for: .touchDown)
            buttonsArray[4].addTarget(self,
                                      action: #selector(touchEyeFifth),
                                      for: .touchDown)
            buttonsArray[5].addTarget(self,
                                      action: #selector(touchEyeSixth),
                                      for: .touchDown)
            buttonsArray[6].addTarget(self,
                                      action: #selector(touchEyeSeventh),
                                      for: .touchDown)
            buttonsArray[7].addTarget(self,
                                      action: #selector(touchEyeEighth),
                                      for: .touchDown)
            buttonsArray[8].addTarget(self,
                                      action: #selector(touchEyeNinth),
                                      for: .touchDown)
            buttonsArray[9].addTarget(self,
                                      action: #selector(touchEyeTenth),
                                      for: .touchDown)
        }
        
        pageView.anchorToBottomCenter(bottom: -120, width: 320, height: UIScreen.main.bounds.height/2 + 440)
    }
    // MARK:- TOUCH EYES FUNC
    @objc func touchEyeFirst() {
        print("Toch first eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[0].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[0].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[0].animateBigPupil()
            return
        }
        guard buttonsArray.count != 4 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[0].animateLittleEyes()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[0].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeSecond() {
        print("Toch second eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[1].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[1].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[1].animateBigPupil()
            return
        }
        guard buttonsArray.count != 4 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[1].animateLittleEyes()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[1].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeThird() {
        print("Toch third eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[2].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[2].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[2].animateBigPupil()
            return
        }
        guard buttonsArray.count != 4 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[2].animateLittleEyes()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[2].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeFourth() {
        print("Toch fourth eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[3].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[3].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[3].animateBigPupil()
            return
        }
        guard buttonsArray.count != 4 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[3].animateLittleEyes()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[3].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeFifth() {
        print("Toch fifth eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[4].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[4].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[4].animateBigPupil()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[4].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeSixth() {
        print("Toch sixth eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[5].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[5].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[5].animateBigPupil()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[5].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeSeventh() {
        print("Toch seventh eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[6].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[6].animateScreenEye()
            return
        }
        guard buttonsArray.count != 7 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[6].animateBigPupil()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[6].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeEighth() {
        print("Toch eighth eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[7].animateEyePupilPlus()
            return
        }
        guard buttonsArray.count != 8 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[7].animateScreenEye()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[7].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeNinth() {
        print("Toch ninth eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[8].animateEyePupilPlus()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[8].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    @objc func touchEyeTenth() {
        print("Toch tenth eye")
        guard buttonsArray.count != 10 else {
            playSound(fileName: "failRobotSound", channel: .effects)
            eyesArray[9].animateEyePupilPlus()
            return
        }
        playSound(fileName: "failMonsterSound", channel: .effects)
        eyesArray[9].animateClouseEyes(duration: 1.5 + Double(buttonsArray.count)/2)
    }
    // MARK:- TOUCH TOUGTH FUNC EYES ACTION
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        guard !endDrawingAll else {return}
        if switchTwoNumber {
            numbersArray[1].switchStartDwawing = true
            numbersArray[1].begunPointSwitch(sapeNum: numbersArray[1].shapeLayerNum, point: point)
            if numbersArray[1].switchStartDwawing {
                playSound(fileName: "moveToStratchSound", channel: .effects)
            }
        } else {
            guard let firstNumLiner = numbersArray.first else {return}
            firstNumLiner.begunPointSwitch(sapeNum: firstNumLiner.shapeLayerNum, point: point)
            if firstNumLiner.switchStartDwawing {
                playSound(fileName: "moveToStratchSound", channel: .effects)
            }
        }
        guard eyesArray.count != 4 else {return}
        var radiusAllEyes = CGFloat()
        if eyesArray.count == 10 {
            radiusAllEyes = 8
        } else {
            radiusAllEyes = 0
        }
        eyesArray.forEach{
            $0.animateAllEyesOnMe(point: point,
                                  eyeCenter: $0.center,
                                  radius: radiusAllEyes,
                                  duration: 0.5)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        guard !endDrawingAll else {return}
        // eyes animations
        if eyesArray.count != 4 {
            var radiusAllEyes = CGFloat()
            if eyesArray.count == 10 {
                radiusAllEyes = 10
            } else {
                radiusAllEyes = 0
            }
            eyesArray.forEach{
                $0.animateAllEyesOnMe(point: point,
                                      eyeCenter: $0.center,
                                      radius: radiusAllEyes,
                                      duration: 0.3)
            }
        }
        
        if numbersArray.count == 2 {
            if numbersArray[0].switchStartDwawing && !switchTwoNumber {
                numbersArray[0].moveToches(for: numbersArray[0].shapeLayerNum, to: point)
                numbersArray[0].endPointSwitch(sapeNum: numbersArray[0].shapeLayerNum, point: point)
                guard numbersArray[0].switchEndDwawing else {return}
                switchTwoNumber = true
                
            } else if numbersArray[1].switchStartDwawing && switchTwoNumber {
                numbersArray[1].moveToches(for: numbersArray[1].shapeLayerNum, to: point)
                numbersArray[1].endPointSwitch(sapeNum: numbersArray[1].shapeLayerNum, point: point)
                guard numbersArray[1].switchEndDwawing else {return}
                switchTwoNumber = false
                numbersArray[0].animateSecsessNumberDraw(sapeNum: numbersArray[0].shapeLayerNum, delay: 1.2)
                littersArray[0].animateOpacity(duration: 0.5, delay: 1.2, key: "OPA[0]")
                numbersArray[0].endToches(for: littersArray[0].shapeLayerNum, to: point, delay: 1.2)
                numbersArray[1].animateSecsessNumberDraw(sapeNum: numbersArray[1].shapeLayerNum, delay: 0.6)
                littersArray[1].animateOpacity(duration: 0.5, delay: 0.6, key: "OPA[1]")
                numbersArray[1].endToches(for: littersArray[1].shapeLayerNum, to: point, delay: 0.6)
                endDrawingAll.toggle()
                playSound(fileName: "endStratchSound", channel: .effects, delay: 0.0)
                playSound(fileName: "endStratchSound", channel: .music, delay: 0.6)
                playSound(fileName: "mnomSound", channel: .effectsOne, delay: 1.3)
                playSound(fileName: "burpSound", channel: .effectsTwo, delay: 3.6)
                playSound(fileName: "burpSound", channel: .effectsThree, delay: 4.2)
                eyesArray.forEach{
                    $0.animateClouseEyes(duration: 3.0, delay: 1.6)
                }
            }
            // end if numbersArray.count == 2
        } else {
            guard let firstNumLiner = numbersArray.first else {return}
            guard firstNumLiner.switchStartDwawing else {return}
            firstNumLiner.moveToches(for: firstNumLiner.shapeLayerNum, to: point)
            // seccess
            firstNumLiner.endPointSwitch(sapeNum: firstNumLiner.shapeLayerNum, point: point)
            guard firstNumLiner.switchEndDwawing else {return}
            sucsessActions(by: 0, in: point, wait: 0.6)
            endDrawingAll.toggle()
            playSound(fileName: "endStratchSound", channel: .effects, delay: 0.0)
            playSound(fileName: "mnomSound", channel: .effectsOne, delay: 1.3)
            playSound(fileName: "burpSound", channel: .effectsTwo, delay: 3.6)
            eyesArray.forEach{
                $0.animateClouseEyes(duration: 3.0, delay: 1.6)
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in: nil) else {return}
        playerEffects?.stop()
        // eyes animations
        if eyesArray.count != 4 {
            eyesArray.forEach{
                $0.animateAnxiousLook()
            }
        }
        guard !endDrawingAll else {return}
        playSound(fileName: "endStratchSound", channel: .effects, delay: 0.6)
        if numbersArray.count == 2 {
            
            if numbersArray[0].switchStartDwawing && !switchTwoNumber {
                numbersArray[0].endPointSwitch(sapeNum: numbersArray[0].shapeLayerNum, point: point)
                guard numbersArray[0].switchEndDwawing else {return}
                switchTwoNumber = true
                
            } else if numbersArray[1].switchStartDwawing && switchTwoNumber {
                
                numbersArray[1].endPointSwitch(sapeNum: numbersArray[1].shapeLayerNum, point: point)
                guard numbersArray[1].switchEndDwawing else {return}
                switchTwoNumber = false
            }
        }
    }
    
    func sucsessActions(by number: Int, in point: CGPoint, wait delay: Double) {
        guard numbersArray[number].switchStartDwawing else {return}
        numbersArray[number].endPointSwitch(sapeNum: numbersArray[number].shapeLayerNum, point: point)
        guard numbersArray[number].switchEndDwawing else {return}
        numbersArray[number].animateSecsessNumberDraw(sapeNum: numbersArray[number].shapeLayerNum, delay: delay)
        littersArray[number].animateOpacity(duration: 0.5, delay: delay, key: "OPA")
        numbersArray[number].endToches(for: littersArray[number].shapeLayerNum, to: point, delay: delay)
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    func playSound(fileName: String, channel: ChannelSound, delay: TimeInterval = 0.0) {
        
//        guard playerBackgrounds != nil else {return}
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {return}
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            switch channel {
            case .backgrounds :
//                guard playerBackgrounds != nil else {return}
                playerBackgrounds = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerBackgrounds else { return }
                player.volume = 0.5
                player.prepareToPlay()
                let seconds = delay//Time To Delay
                let when = DispatchTime.now() + seconds

                DispatchQueue.main.asyncAfter(deadline: when) {
                    player.play()
                }
            case .effects :
//                guard playerEffects != nil else {return}
                playerEffects = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerEffects else { return }
                player.volume = 1.0
                player.prepareToPlay()
                let seconds = delay//Time To Delay
                let when = DispatchTime.now() + seconds

                DispatchQueue.main.asyncAfter(deadline: when) {
                    player.play()
                }
            case .music :
//                guard playerMusic != nil else {return}
                playerMusic = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerMusic else { return }
                player.volume = 1.0
                player.prepareToPlay()
                let seconds = delay//Time To Delay
                let when = DispatchTime.now() + seconds

                DispatchQueue.main.asyncAfter(deadline: when) {
                    player.play()
                }
            case .effectsOne :
//                guard playerEffectsOne != nil else {return}
                playerEffectsOne = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerEffectsOne else { return }
                player.volume = 1.0
                player.prepareToPlay()
                let seconds = delay//Time To Delay
                let when = DispatchTime.now() + seconds

                DispatchQueue.main.asyncAfter(deadline: when) {
                    player.play()
                }
            case .effectsTwo :
//                guard playerEffectsTwo != nil else {return}
                playerEffectsTwo = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerEffectsTwo else { return }
                player.volume = 1.0
                player.prepareToPlay()
                let seconds = delay//Time To Delay
                let when = DispatchTime.now() + seconds

                DispatchQueue.main.asyncAfter(deadline: when) {
                    player.play()
                }
            case .effectsThree :
//                guard var player = playerEffectsThree else { return }
                playerEffectsThree = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerEffectsThree else { return }
                player.volume = 1.0
                player.prepareToPlay()
                let seconds = delay//Time To Delay
                let when = DispatchTime.now() + seconds

                DispatchQueue.main.asyncAfter(deadline: when) {
                    player.play()
                }
        }
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
