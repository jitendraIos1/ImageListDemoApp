//
//  PhotosViewModel.swift
//  ImageListDemo App
//
//  Created by Jitendra Kumar on 21/12/20.
//

import Foundation
import Alamofire
class PhotosViewModel {
    weak var vc: ViewController?
    var photos = [Photos]()
    func getPhotosDtata() {
        AF.request("https://picsum.photos/list").response { response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([Photos].self, from: data)
                    self.photos.append(contentsOf: userResponse)
                    DispatchQueue.main.async{
                        print("photos=\(self.photos)")
                        self.vc?.photoTableView.reloadData()
                    }
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
//    func getRestaurentDtata() {
//        URLSession.shared.dataTask(with: URL(string: "https://picsum.photos/list")!) { (data, response, error ) in
//            if error == nil {
//                if let data = data {
//                    do{
//                        let resturentResponse =  try JSONDecoder().decode([Photos].self, from: data)
//                        //self.photos.append(contentsOf: resturentResponse)
//                        print("restaurent Response=\(self.photos.count)")
//                        DispatchQueue.main.async {
//                            self.lunchVc?.collectionView.reloadData()
//                            }
//                    }catch let err{
//                        print(err.localizedDescription)
//                    }
//                }
//
//            }
//
//        }.resume()
//    }
}
