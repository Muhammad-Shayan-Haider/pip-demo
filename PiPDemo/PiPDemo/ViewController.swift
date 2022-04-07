//
//  ViewController.swift
//  PiPDemo
//
//  Created by Muhammad Shayan on 03/04/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let videos = ["video1", "video2", "video3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        self.tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let url = Utils.createLocalUrl(for: videos[indexPath.row], ofType: "mp4") ?? URL(fileURLWithPath: "")
        guard let thumbnailImage = Utils.getThumbnailImage(forUrl: url) else {
            return UITableViewCell()
        }
        cell.configure(text: videos[indexPath.row], image: thumbnailImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoViewController = VideoViewController()
        let url = Utils.createLocalUrl(for: videos[indexPath.row], ofType: "mp4") ?? URL(fileURLWithPath: "")
        videoViewController.videoURL = url
        self.present(videoViewController, animated: true, completion: nil)
    }
}
