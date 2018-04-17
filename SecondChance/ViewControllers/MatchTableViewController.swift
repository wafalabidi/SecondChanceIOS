import UIKit
import os.log

class MatchTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    var likeMatchResumes = [LikeMatchResume]()
    var userId = 11
    @IBOutlet var likeMatchResumeTableView: UITableView!
    
    //MARK: Private Methods
    private func loadLikeMatchResumes(){
        let mockPhoto = UIImage(named : "763")
        /*let likeMatchResume1 = LikeMatchResume(id: 2, name: "Mehdi", lastMessage: "Hello", lastMessageSender: true, nbrUnseenMessage: 0, photo: mockPhoto)
         let likeMatchResume2 = LikeMatchResume(id: 3, name: "Wafa", lastMessage: "Wasup", lastMessageSender: false, nbrUnseenMessage: 2, photo: mockPhoto)
         
         likeMatchResumes += [likeMatchResume1,likeMatchResume2]
         */
        LikeMatchAPI.getLikeMatchResume(userId: userId) { (error: Error?, serviceLikeMatchResumes: [LikeMatchResume]?) in
            if let serviceLikeMatchResumes = serviceLikeMatchResumes {
                for likeMatchResume  in serviceLikeMatchResumes {
                    likeMatchResume.photo = mockPhoto
                    self.likeMatchResumes.append(likeMatchResume)
                }
                DispatchQueue.main.async {
                    self.likeMatchResumeTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likeMatchResumeTableView.dataSource = self
        likeMatchResumeTableView.delegate = self
        
        loadLikeMatchResumes()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeMatchResumes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "likeMatchResumeCell", for: indexPath) as? MatchTableViewCell else {
            fatalError("the dequeued cell is not an instance of MatchTableViewCell")
        }
        
        let likeMatchResume = likeMatchResumes[indexPath.row]
        
        cell.nameLabel.text = likeMatchResume.name
        cell.photoImageView.image = likeMatchResume.photo
        
        
        if likeMatchResume.nbrUnseenMessages > 0 {
            cell.nbrUnseenMessagesLabel.text = String(likeMatchResume.nbrUnseenMessages)
            cell.nbrUnseenMessagesLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            
            /*
             let size:CGFloat = 55.0
             let countLabel = UILabel(frame: CGRect(x : 0.0,y : 0.0,width : size, height :  size))
             countLabel.text = String(likeMatchResume.nbrUnseenMessage)
             countLabel.textColor = UIColor.white
             countLabel.textAlignment = .center
             countLabel.font = UIFont.systemFont(ofSize: 24.0)
             countLabel.layer.cornerRadius = size / 2
             countLabel.layer.borderWidth = 3.0
             countLabel.layer.masksToBounds = true
             countLabel.layer.backgroundColor = UIColor.orange.cgColor
             countLabel.layer.borderColor = UIColor.orange.cgColor
             countLabel.translatesAutoresizingMaskIntoConstraints = false
             
             cell.nbrUnseenMessagesLabel = countLabel*/
        }else{
            cell.nbrUnseenMessagesLabel.isHidden = true
        }
        
        if (likeMatchResume.lastMessage != "" ){
            if (likeMatchResume.lastMessageSender){
                cell.lastMessageLabel.text = "You : " + likeMatchResume.lastMessage
            }else{
                cell.lastMessageLabel.text = likeMatchResume.lastMessage
                cell.lastMessageLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            }
        }else{
            cell.lastMessageLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            cell.lastMessageLabel.text = "Start talking together !"
        }
        
        cell.id = likeMatchResume.id
        
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "ShowConversation" :
            guard let chatViewController = segue.destination as? ChatViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedLikeMatchCell = sender as? MatchTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            /*
            guard let indexPath = likeMatchResumeTableView.indexPath(for: selectedLikeMatchCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedLikeMatchResume = likeMatchResumes[indexPath.row]*/
            chatViewController.sourceUserId = userId
            chatViewController.targetUserId = selectedLikeMatchCell.id
            chatViewController.targetUserName = selectedLikeMatchCell.nameLabel.text!
            MessageAPI.markMessageListAsSeen(sourceUserId: chatViewController.targetUserId, targetUserId: userId)
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            
        }
    }
    
    
}
