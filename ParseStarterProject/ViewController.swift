/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    @IBAction func create(_ sender: Any) {
        let alertController = UIAlertController(title: "hello there", message: "are you sure", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            print("clicker")
            
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func pauseApp(_ sender: Any) {
    }
    @IBAction func restoreApp(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        // Not saving User in database multiple times
        
//        let user = PFObject(className: "Users")
//        user["name"] = "jakson"
//        user["phone"] = "5035430203"
//        user["girlfriend"] = "Megan"
//
//        user.saveInBackground { (success, error) in
//            if success {
//                print("object save")
//            } else {
//                if let error = error {
//                    print(error)
//                } else {
//                    print("error")
//                }
//            }
//
//        }
//
//        let query = PFQuery(className: "Users")
//
//        query.getObjectInBackground(withId: "uhXax3apzO") { (object, error) in
//
//            if error != nil {
//                print(error ?? "there was an error")
//            } else {
//                if let user = object {
//                    let stringGirlfriend = user["girlfriend"] as! String
//                    if stringGirlfriend == "Sarah" {
//                        user["girlfriend"] = "Kirsten"
//                        user.saveInBackground(block: { (success, error) in
//                            if success {
//                                print("saved")
//                                print("girlfriend updated")
//                            } else {
//                                print("there was an error updating")
//                            }
//                        })
//
//                    } else {
//                        print("girlfriend name not right")
//                    }
//                }
//            }
//
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
