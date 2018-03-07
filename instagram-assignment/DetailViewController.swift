//
//  DetailViewController.swift
//  instagram-assignment
//
//  Created by lesley amezcua on 2/27/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    var post: Post?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let post = post {
            
            let string = post.createdAt!.description
            
            let RFC3339DateFormatter = DateFormatter()
            RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
            RFC3339DateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZZZ"
            let date = RFC3339DateFormatter.date(from: string)
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy"
            
            dateText.text = dateFormatterPrint.string(from: date!)
            postText.text = post["caption"] as? String
            
            
        }
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
