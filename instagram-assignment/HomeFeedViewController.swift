//
//  HomeFeedViewController.swift
//  instagram-assignment
//
//  Created by lesley amezcua on 2/21/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeFeedViewController: UIViewController, UITableViewDataSource {

    var posts: [Post]! = []
    var refreshControl: UIRefreshControl!
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeFeedViewController.didPullToRefresh(_:)), for: UIControlEvents.valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        fetchPosts()
        
    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl ) {
        fetchPosts()
    }
    func fetchPosts() {
        let query = Post.query()!
        query.includeKey("author")
        query.order(byDescending: "_created_at")
        query.limit = 20
        
        query.findObjectsInBackground(block: { (posts : [PFObject]?, error: Error?) -> Void in
            
            if let posts = posts {
                self.posts = posts as! [Post]
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            } else {

            }
            
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.postLabel.text = posts[indexPath.row].caption
        cell.photoImageView.file = posts[indexPath.row].media
        cell.photoImageView.loadInBackground()
        
        return cell
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell {
            if let indexPath = tableView.indexPath(for: cell) {
                let post = posts[indexPath.row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.post = post
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

