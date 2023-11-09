//
//  HomeController.swift
//  Kids123
//
//  Created by Denis Kozlov on 12.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit
import AVFoundation

class HomeController: UIViewController {
    var homeView: HomeView!
    private lazy var playStartButton: UIButton = {
        let button = UIButton()
        //button text style
        button.setImage(#imageLiteral(resourceName: "IconStartPlay"), for: .normal)
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
    }()
    private lazy var anotherAppImageButton: UIButton = {
        let button = UIButton()
        //button text style
        button.setImage(#imageLiteral(resourceName: "123AppIcon"), for: .normal)
        button.addTarget(self, action: #selector(handleGoToStore), for: .touchUpInside)
        return button
    }()
    // MARK:- Music & Sounds
    var playerBackgrounds: AVAudioPlayer?
    var playerEffects: AVAudioPlayer?
    var playerMusic: AVAudioPlayer?
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(fileName: "introBGSound", channel: .music)
        playerMusic?.numberOfLoops = 1
        setupView()
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    func setupView() {
//        self.view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        let mainView = HomeView(frame: self.view.frame)
        self.homeView = mainView
        self.view.addSubview(homeView)
        homeView.anchorFillToSuperview()
        homeView.addSubview(playStartButton)
        homeView.addSubview(anotherAppImageButton)
        playStartButton.anchorToNativeCenter(constantY: 120, width: 100, height: 100)
        anotherAppImageButton.anchorToTopCenter(top: 50, width: 105, height: 105)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    @objc func handlePlay() {
        playerMusic?.stop()
        playSound(fileName: "buttonSound", channel: .effects)
        addMonstersVC()
    }
    @objc func handleGoToStore() {
        addParentVC()
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    func addParentVC() {
        
        let parentController = ParentViewController()
                
            addChild(parentController)
            view.addSubview(parentController.view)
            parentController.didMove(toParent: self)
                
            parentController.view.anchorFillToSuperview()
                
        //  animations down below
            parentController.view.layer.opacity = 0.0
            parentController.view.animateOpacity(toValue: 1.0, duration: 0.5, delay: 0.5, key: "OnbordingOpacity")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                parentController.view.layer.opacity = 1.0
            }
    }
    func addMonstersVC() {
            
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = MonsterSwipingController(collectionViewLayout: layout)
            
        addChild(swipingController)
        view.addSubview(swipingController.view)
        swipingController.didMove(toParent: self)
            
        swipingController.view.anchorFillToSuperview()
            
    //  animations down below
        swipingController.view.layer.opacity = 0.0
        swipingController.view.animateOpacity(toValue: 1.0, duration: 0.5, delay: 0.5, key: "OnbordingOpacity")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            swipingController.view.layer.opacity = 1.0
        }
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
                playerBackgrounds = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerBackgrounds else { return }
                player.volume = 1.0
                player.prepareToPlay()
                player.play(atTime: player.deviceCurrentTime + delay)
            case .effects :
                playerEffects = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerEffects else { return }
                player.volume = 1.0
                player.prepareToPlay()
                player.play(atTime: player.deviceCurrentTime + delay)
            case .music :
                playerMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = playerMusic else { return }
                player.volume = 0.5
                player.prepareToPlay()
                player.play(atTime: player.deviceCurrentTime + delay)
            case .effectsOne:
                break
            case .effectsTwo:
                break
            case .effectsThree:
                break
            }
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
