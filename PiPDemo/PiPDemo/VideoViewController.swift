//
//  VideoViewController.swift
//  PiPDemo
//
//  Created by Muhammad Shayan on 04/04/2022.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    private var player: AVPlayer!
    private var playerViewController = AVPlayerViewController()
    var videoURL: URL = URL(fileURLWithPath: "")
    var pipController: AVPictureInPictureController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPipController()
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        playInPip()
    }
    
    func playInPip() {
        if let pipController = pipController {
            pipController.startPictureInPicture()
            pipController.playerLayer.player?.play()
        }
    }
    
    // Creates new AVController and plays video in it.
    func playVideoInAVController() {
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: videoURL)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }
    
    @IBAction func play(_ sender: UIButton) {
        playVideoInView()
    }
    
    // Setup pip controller for playing video in pip.
    private func setupPipController() {
        let player = AVPlayer(url: videoURL)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.playerView.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerView.layer.addSublayer(playerLayer)
        
        pipController = AVPictureInPictureController(playerLayer: playerLayer)
    }
    
    // Plays AVVideoController video in view.
    func playVideoInView() {
        player = AVPlayer(url: videoURL)
        playerViewController.player = player
        playerViewController.view.frame.size.height = playerView.frame.size.height
        playerViewController.view.frame.size.width = playerView.frame.size.width
        self.playerView.addSubview(playerViewController.view)
        player.play()
    }
}
