//
//  ViewController.swift
//  ImageListDemoAppTest
//
//  Created by Jitendra Kumar on 23/12/20.
//  Copyright © 2020 Jitendra Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    let viewModel = PhotosViewModel()
    @IBOutlet weak var photoTableView: UITableView!
    var photosVieModel = PhotosViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoTableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
        viewModel.vc = self
        photoTableView.delegate = self
        photoTableView.dataSource = self
        viewModel.getPhotosDtata()
    }
}
 extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("photo=\(viewModel.photos.count)")
        return viewModel.photos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell
        cell?.photoDetails = viewModel.photos[indexPath.row]
        return cell!
    }
}



