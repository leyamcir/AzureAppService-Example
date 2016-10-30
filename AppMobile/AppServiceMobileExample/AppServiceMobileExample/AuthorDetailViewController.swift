//
//  AuthorDetailViewController.swift
//  AppServiceMobileExample
//
//  Created by Home on 24/10/16.
//  Copyright © 2016 Alicia. All rights reserved.
//

import UIKit

class AuthorDetailViewController: UIViewController {
    
    var model: AuthorRecord?
    var client: MSClient?

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = model?["name"] as? String
        }
    }
    
    @IBOutlet weak var lastnameLabel: UILabel! {
        didSet {
            lastnameLabel.text = model?["lastname"] as? String
        }
    }
    
    @IBOutlet weak var styleText: UITextField! {
        didSet {
            guard let style = model?["style"] as? String else {
                return
            }
            styleText.text = style
        }
    }
    
    @IBOutlet weak var languageText: UITextField! {
        didSet {
            guard let language = model?["language"] as? String else {
                return
            }
            languageText.text = language
        }
    }
    
    @IBAction func updateAuthorAction(_ sender: AnyObject) {
        
        updateAuthor()
    }
    
    func updateAuthor() {
    
        let tableAz = client?.table(withName: "Authors")
        
        // Check data
        model?["style"] = styleText.text as AnyObject?
        model?["language"] = languageText.text as AnyObject?
        
        tableAz?.update(model!, completion: { (result, error) in
            
            if let _ = error {
                print(error)
                return
            }
            print(result)
        })
    }
    
    func callCustomAPI() {
        client?.invokeAPI("customapione",
                          body: nil,
                          httpMethod: "GET",
                          parameters: nil,
                          headers: nil,
                          completion: { (result, response, error) in
                            
                            if let _ = error {
                                print(error)
                                return
                            }
                            print(result)
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
