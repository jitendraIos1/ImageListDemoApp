//
//  PhotoTableViewCell.swift
//  ImageListDemoAppTest
//
//  Created by Jitendra Kumar on 23/12/20.
//  Copyright © 2020 Jitendra Kumar. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: CustomeImageView!
    @IBOutlet weak var name: UILabel!
    var photoDetails: Photos?{
        didSet{
            photoConfigration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func photoConfigration(){
        self.name.text = photoDetails?.author
        if let imageurl = photoDetails?.authorURL, let id = photoDetails?.id{
            print("url=\(String(describing: imageurl))")
            DispatchQueue.main.async {
                self.photoImageView.downloaded(from: "https://picsum.photos/200/300?image=\(String(id))")
            }
            
        }
    }
    
}
