//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Vedat Dokuzkardeş on 5.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var data = Data()
    
    var tracker = 0
    
    let urlString = ["https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlString[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)
            }
        }
        
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
    }
    
    @objc func changeImage(){
        
        if tracker == 0 {
            tracker += 1
        }else{
            tracker -= 1
        }
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlString[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 25
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }
    


}

