//
//  TableViewController.swift
//  challenge3project
//
//  Created by Karen Vardanian on 10.12.2022.
//

import UIKit


class ViewController: UITableViewController {
var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix("png") {
                pictures.append(item)
            }
            print(item)
            print(pictures)
        }
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(pictures.count)
            return pictures.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
            cell.textLabel?.text = "Picture \(pictures.firstIndex(of: pictures[indexPath.row])! + 1) of \(pictures.count)"
            return cell
        }
        
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
//                vc.selectedImage = pictures[indexPath.row]
//
//                navigationController?.pushViewController(vc, animated: true)
//            }
//        }
    
    


}
