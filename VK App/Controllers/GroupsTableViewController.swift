//  Created by ikizey on 21.08.2021.



import UIKit

class GroupsTableViewController: UITableViewController {

    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<5 {
            groups.append(Group.generate())
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupsCell", for: indexPath)
        let group = groups[indexPath.row]
        cell.textLabel?.text = group.name
        cell.imageView?.image = group.image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // removes selected group
        groups.remove(at: indexPath.row)
        tableView.reloadData()
    }

    @IBAction func addBarButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "groups", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = sender as? GroupsTableViewController else { return }
        guard let destinationController = segue.destination as? GroupTableViewController else { return }

        destinationController.groupVC = vc
    }
}
