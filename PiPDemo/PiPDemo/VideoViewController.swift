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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        playVideoInView()
    }
    
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
    
    func playVideoInView() {
        player = AVPlayer(url: videoURL)
        playerViewController.player = player
        playerViewController.view.frame.size.height = playerView.frame.size.height
        playerViewController.view.frame.size.width = playerView.frame.size.width
        self.playerView.addSubview(playerViewController.view)
        player.play()
    }
}
