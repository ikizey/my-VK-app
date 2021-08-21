//  Created by ikizey on 21.08.2021.



import UIKit

class FriendsTableViewController: UITableViewController {


    var friends = [String]() // TODO: - Friend Class

    override func viewDidLoad() {
        super.viewDidLoad()

        // dummy
        friends.append("Alex")
        friends.append("Jack")
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "friendsPhotos" else { return false }
        return true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        cell.textLabel?.text = friends[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "friendsPhotos", sender: nil)
    }
}
