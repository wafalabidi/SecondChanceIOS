//
//  ChatViewController.swift
//  SecondChance
//
//  Created by Admin on 4/9/18.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    var messages = [Message]()
    @IBOutlet var chatTableView: UITableView!
    
    //MARK: Private Methods
    private func loadMessages(){
        let mockPhoto = UIImage(named : "763")
        /*
        let user1 = User(name: "Bacem", email: "bacem@hotmail", id: "1", profilePic: mockPhoto!)
        let message1 = Message(id: 1, sendingDate: Date(), text: "SALAM", seeingDate: Date(), isSeen: false, sourceUser: user1, targetUser: user1, isSender: true)
        let message2 = Message(id: 1, sendingDate: Date(), text: "HALLO", seeingDate: Date(), isSeen: false, sourceUser: user1, targetUser: user1, isSender: false)

        messages += [message1,message2]
*/
        MessageAPI.getMessages(targetUserId: 1, sourceUserId: 3){ (error: Error?, serviceMessages: [Message]?) in
            if let serviceMessages = serviceMessages {
                for message  in serviceMessages {
                    self.messages.append(message)
                }
                DispatchQueue.main.async {
                    self.chatTableView.reloadData()
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.estimatedRowHeight = 300
        chatTableView.rowHeight = UITableViewAutomaticDimension
        
        loadMessages()
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageTableViewCell else {
            fatalError("the dequeued cell is not an instance of MessageTableViewCell")
        }

        let message = messages[indexPath.row]

        cell.messageLabel.numberOfLines = 0
        cell.messageLabel.lineBreakMode = .byWordWrapping
        cell.messageLabel.frame.size.width = 300
        cell.messageLabel.sizeToFit()
        cell.messageLabel.text = message.text
        if (message.isSender){
            cell.messageLabel.textAlignment = NSTextAlignment.right
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
