//
//  DetailViewController.swift
//  challenge3project
//
//  Created by Karen Vardanian on 12.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped()  {
         guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
             print("there is no image")
             return
         }
         
         var imageName: [Any] = [image]
         if let imageText = selectedImage {
             imageName.append(imageText)
         }
        
         
         let vc = UIActivityViewController(activityItems: [image,"Name image: \(imageName)"], applicationActivities: [])
         vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
         present(vc,  animated: true)
     }

}
