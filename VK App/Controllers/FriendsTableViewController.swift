//  Created by ikizey on 21.08.2021.



import UIKit

class FriendsTableViewController: UITableViewController {


    var friends = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<10 {
            friends.append(User.generate())
        }
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
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.imageView?.image = friend.image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "friendsPhotos", sender: friends[indexPath.row])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let user = sender as? User else { return }
        guard let destinationController = segue.destination as? FriendsPhotosCollectionViewController else { return }

        destinationController.user = user
    }
}
