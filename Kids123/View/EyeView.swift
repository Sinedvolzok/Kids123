//
//  EyeView.swift
//  Kids123
//
//  Created by Denis Kozlov on 12.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit

class EyeView: UIView {
    
    let circleEye: UIView = {
        let view = UIView()
        return view
    }()
    
    let circlePupil: UIView = {
        let view = UIView()
        return view
    }()
    
    let upperEyelid: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "upperEyelidImage")
        return imageView
    }()
    
    let lowerEyelid: UIView = {
        let view = UIView()
        return view
    }()
    
    var colorEye: UIColor
    var sizeEye: CGSize
    var radiusEye: CGFloat
    
    var colorPupil: UIColor
    var sizePupil: CGSize
    var radiusPupil: CGFloat
    
    var colorEyelid: UIColor
    var imageEyelid: UIImage
    
    init(colorEye: UIColor = UIColor.clear, sizeEye: CGSize = .zero, radiusEye: CGFloat = 0,
         colorPupil: UIColor = UIColor.clear, sizePupil: CGSize = .zero, radiusPupil: CGFloat  = 0,
         colorEyelid:UIColor = UIColor.clear, imageEyelid:UIImage = UIImage()) {
        
        self.colorEye = colorEye
        self.sizeEye = sizeEye
        self.radiusEye = radiusEye
        
        self.colorPupil = colorPupil
        self.sizePupil = sizePupil
        self.radiusPupil = radiusPupil
        
        self.colorEyelid = colorEyelid
        self.imageEyelid = imageEyelid
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        circleEye.layer.cornerRadius = radiusEye
        circlePupil.layer.cornerRadius = radiusPupil
        circleEye.frame.size = sizeEye
        circlePupil.frame.size = sizePupil
        circleEye.backgroundColor = colorEye
        circlePupil.backgroundColor = colorPupil
        circleEye.frame.origin = CGPoint(x: 0, y: 0)
        circlePupil.frame.origin = CGPoint(
            x: circleEye.frame.size.width/2-circlePupil.frame.size.width/2,
            y: circleEye.frame.size.height/2-circlePupil.frame.size.height/2)
        
        upperEyelid.image = imageEyelid
        lowerEyelid.backgroundColor = colorEyelid
        upperEyelid.frame.size = CGSize(width: sizeEye.height, height: 0)
        lowerEyelid.frame.size = CGSize(width: sizeEye.height, height: 0)
        
        upperEyelid.frame.origin = CGPoint(x: 0, y: circleEye.frame.size.height/2)
        lowerEyelid.frame.origin = CGPoint(x: 0, y: circleEye.frame.size.height)
        
        addSubview(circleEye)
        addSubview(circlePupil)
        addSubview(upperEyelid)
        addSubview(lowerEyelid)
    }
    
    func animateAnxiousLook() {
        circlePupil.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.6, animations: {
            self.circlePupil.transform.tx = 0
            self.circlePupil.transform.ty = 0
        }) { (true) in
            self.circlePupil.animateMove(fromX: 0,
                                         toX: -self.sizeEye.width/2+20,
                                         fromY: 0,
                                         toY: 10,
                                         duration: 1.5,
                                         dumping: 20,
                                         key: "center-left")
            self.circlePupil.animateMoveJunp(
                fromValueX: 20,
                fromValueY: self.sizeEye.height/2+10,
                toValueX: self.sizeEye.width-20,
                toValueY: self.sizeEye.height/2+10,
                delay: 1.5, duration: 2.4,
                forKey: "left-right")
        }
    }
    
    func animateAllEyesOnMe(point: CGPoint, eyeCenter: CGPoint, radius: CGFloat = 0.0, duration: TimeInterval) {
        circlePupil.layer.removeAllAnimations()
        let catetA2 = pow((eyeCenter.y - point.y), 2.0)
        let catetB2 = pow((eyeCenter.x - point.x), 2.0)
        let hypotenuseC = pow((catetA2+catetB2), 0.5)
        let cosinus = (eyeCenter.x - point.x)/hypotenuseC
        let sinus = (eyeCenter.y - point.y)/hypotenuseC
        let moveX = -cosinus*(circleEye.frame.size.width/2+radius-circlePupil.frame.size.width)
        let moveY = -sinus*(circleEye.frame.size.width/2+radius-circlePupil.frame.size.height/1.5)
        
        UIView.animate(withDuration: duration, animations: {
            self.circlePupil.transform.tx = moveX
            self.circlePupil.transform.ty = moveY
        })
    }
    
    var eyesNotClouse = true
    
    func animateClouseEyes(duration: Double, delay: Double = 0.0) {
        guard eyesNotClouse else {return}
        eyesNotClouse.toggle()
        UIView.animate(withDuration: 0.2, delay: delay, animations: {
            self.lowerEyelid.frame.size = CGSize(width: self.sizeEye.height, height: self.sizeEye.height/2)
            self.lowerEyelid.transform.ty = -self.sizeEye.height/2
        }) { (true) in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
                self.upperEyelid.frame.size = CGSize(width: self.sizeEye.height, height: self.sizeEye.height/2)
                self.upperEyelid.transform.ty = -self.sizeEye.height/2
            }) { (true) in
                UIView.animate(withDuration: 0.2, delay: duration, options: .curveEaseOut, animations: {
                    self.upperEyelid.frame.size = CGSize(width: self.sizeEye.height, height: 1)
                    self.upperEyelid.transform.ty = 0
                }) { (true) in
                    self.upperEyelid.frame.size = CGSize(width: self.sizeEye.height, height: 0)
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
                        self.lowerEyelid.frame.size = CGSize(width: self.sizeEye.height, height: 0)
                        self.lowerEyelid.transform.ty = 0
                    }) { (true) in
                        self.eyesNotClouse.toggle()
                    }
                }
            }
        }
    }
    
    func animateLittleEyes() {
        UIView.animate(withDuration: 0.5, animations: {
            self.circlePupil.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.circleEye.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        }) { (true) in
            UIView.animate(withDuration: 0.8, delay: 2.0, options: .curveEaseOut, animations: {
                self.circlePupil.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.circleEye.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
    
    func animateBigPupil() {
        UIView.animate(withDuration: 0.5, animations: {
            self.circlePupil.frame.size = CGSize(width: 30, height: 90)
            self.circlePupil.layer.cornerRadius = 15
            self.circlePupil.transform.ty = -38
            self.circlePupil.transform.tx = -8
        }) { (true) in
            UIView.animate(withDuration: 0.8, delay: 5.0, options: .curveEaseOut, animations: {
                self.circlePupil.frame.size = CGSize(width: 10, height: 10)
                self.circlePupil.layer.cornerRadius = 5
                self.circlePupil.transform.ty = 0
                self.circlePupil.transform.tx = 0
            })
        }
    }
    
    func animateScreenEye() {
        UIView.animate(withDuration: 0.2, animations: {
            self.upperEyelid.transform.ty = 60
            self.lowerEyelid.transform.ty = -60
            self.circleEye.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }) { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                self.upperEyelid.transform.ty = 0
                self.lowerEyelid.transform.ty = 0
                self.circleEye.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }) { (true) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.upperEyelid.transform.ty = 60
                    self.lowerEyelid.transform.ty = -60
                    self.circleEye.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                }) { (true) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.upperEyelid.transform.ty = 0
                        self.lowerEyelid.transform.ty = 0
                        self.circleEye.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                    }) { (true) in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.upperEyelid.transform.ty = 60
                            self.lowerEyelid.transform.ty = -60
                            self.circleEye.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                        }) { (true) in
                            UIView.animate(withDuration: 0.2, animations: {
                                self.upperEyelid.transform.ty = 0
                                self.lowerEyelid.transform.ty = 0
                                self.circleEye.backgroundColor = self.colorEye
                            })
                        }
                    }
                }
            }
        }
    }
    
    func animateEyePupilPlus() {
        UIView.animate(withDuration: 0.5, animations: {
            self.circlePupil.frame.size = CGSize(width: 30, height: 10)
            self.circlePupil.layer.cornerRadius = 5
            self.circleEye.frame.size = CGSize(width: 10, height: 30)
            self.circleEye.layer.cornerRadius = 5
            self.circlePupil.transform.tx = -10
            self.circlePupil.transform.ty = 7
            self.circleEye.transform.tx = 7
            self.circleEye.transform.ty = 4
            
        }) { (true) in
            UIView.animate(withDuration: 0.8, delay: 7.0, options: .curveEaseOut, animations: {
                self.circlePupil.frame.size = self.sizePupil
                self.circlePupil.layer.cornerRadius = self.radiusPupil
                self.circleEye.frame.size = self.sizeEye
                self.circleEye.layer.cornerRadius = self.radiusEye
                self.circlePupil.transform.tx = 0
                self.circlePupil.transform.ty = 0
                self.circleEye.transform.tx = 0
                self.circleEye.transform.ty = 0
            })
        }
    }
}
