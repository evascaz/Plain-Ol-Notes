//
//  DetailViewController.swift
//  Plain Ol' Notes
//
//  Created by Evangeline Scazzero on 10/18/16.
//  Copyright © 2016 Eva Scazzero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UITextView!


    func configureView() {
        // Update the user interface for the detail item.
        if objects.count == 0 {
            return
        }
            if let label = self.detailDescriptionLabel {
                label.text = objects[currentIndex]
                if label.text == BLANK_NOTE {
                    label.text = ""
                }
           }
        
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailViewController = self
        detailDescriptionLabel.becomeFirstResponder()
        detailDescriptionLabel.delegate = self
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     var detailItem: String? {
    
        didSet {
        func ViewWillDisappear(_ animated: Bool){
                super.viewWillDisappear(animated)
                if objects.count == 0 {
                    return
                }
                
                objects[currentIndex] = detailDescriptionLabel.text
                if detailDescriptionLabel.text == "" {
                    objects[currentIndex] = BLANK_NOTE
                }
                saveAndUpdate()
            }
            
            func saveAndUpdate(){
                masterView?.save()
                masterView?.tableView.reloadData()
            }
            
            func textViewDidChange(textView: UITextView){
                objects[currentIndex] = detailDescriptionLabel.text
                saveAndUpdate()
            }
        }
            
    }
}
        






//var detailItem: String? {
//didSet {
//    // Update the view.
//    //            self.configureView()
//    
//    func ViewWillDisappear(_ animated: Bool){
//        super.viewWillDisappear(animated)
//        if objects.count == 0 {
//            return
//        }
//        objects[currentIndex] = detailDescriptionLabel.text
//        if detailDescriptionLabel.text == "" {
//            objects[currentIndex] = BLANK_NOTE
//        }
//        saveAndUpdate()
//    }
//    
//    func saveAndUpdate(){
//        masterView?.save()
//        masterView?.tableView.reloadData()
//    }
//}
