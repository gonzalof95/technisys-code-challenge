//
//  MainViewController+Extension.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as! NewsTableViewCell
        cell.configure(with: newsArray[indexPath.row])
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
