//
//  AuthorCommitTableViewController.swift
//  Project38
//
//  Created by Grant Watson on 12/1/22.
//

import CoreData
import UIKit

class AuthorCommitTableViewController: UITableViewController {
    
    var author: Author!
    var commits: [Commit]!

    override func viewDidLoad() {
        super.viewDidLoad()
        commits = author.commits.array as? [Commit]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCommitCell", for: indexPath)
        
        let commit = commits[indexPath.row]
        var config = UIListContentConfiguration.cell()
        config.text = commit.message
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: commit.date)
        
        config.secondaryText = formattedDate
        cell.contentConfiguration = config
        
        return cell
    }
}
