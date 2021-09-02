//  Created by ikizey on 21.08.2021.



import UIKit

class GroupTableViewController: UITableViewController {

    var groups = [Group]()
    weak var groupVC: GroupsTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<5 {
            groups.append(Group.generate())
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        let group = groups[indexPath.row]
        cell.textLabel?.text = group.name
        cell.imageView?.image = group.image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // adds selected group
        let selectedGroup = groups[indexPath.row]
        groupVC.groups.append(selectedGroup)
        groups.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
