//
//  ChatViewController.swift
//  SecondChance
//
//  Created by Admin on 4/9/18.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    //MARK: Properties
    var messages = [Message]()
    var sourceUserId = 0
    var targetUserId = 0
    var targetUserPhoto = UIImage(named : "763")
    var targetUserName = "Foulen"
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet weak var targetUserNameLabel: UILabel!
    @IBOutlet weak var newMessageTextField: UITextView!
    
    var messageText = ""
    
    
    //MARK: Private Methods
    private func loadMessages(){
        
        
        MessageAPI.getMessages(sourceUserId: sourceUserId,targetUserId: targetUserId){ (error: Error?, serviceMessages: [Message]?) in
            if let serviceMessages = serviceMessages {
                self.messages = []
                for message  in serviceMessages {
                    self.messages.append(message)
                }
                DispatchQueue.main.async {
                    self.chatTableView.reloadData()
                    self.scrollToBottom()
                }
            }
        }
        
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.dataSource = self
        chatTableView.delegate = self
        newMessageTextField.delegate = self
        chatTableView.estimatedRowHeight = 300
        chatTableView.rowHeight = UITableViewAutomaticDimension
        
        targetUserNameLabel.text = targetUserName
        
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
        }else{
            cell.messageLabel.textAlignment = NSTextAlignment.left
        }
        
        
        return cell
    }
    //MARK: UITextFieldDelegate
    func textViewShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        newMessageTextField.resignFirstResponder()
        return true
    }
    
    private func textViewDidEndEditing(_ textField: UITextField) {
        messageText = newMessageTextField.text
    }

    // MARK: Actions
    
    @IBAction func sendNewMessage(_ sender: UIButton) {
        MessageAPI.saveNewMessage(text: "messageText", sourceUserId: sourceUserId, targetUserId: targetUserId){
            (error: Error?) in
            self.loadMessages()
        }
        
    }
    
}
