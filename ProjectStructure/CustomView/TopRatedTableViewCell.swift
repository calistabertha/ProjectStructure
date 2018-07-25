//
//  TopRatedTableViewCell.swift
//  ProjectStructure
//
//  Created by Digital Khrisna on 6/19/17.
//  Copyright © 2017 codigo. All rights reserved.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell {
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    /*
     *  Use callback for any action
     */
    
    var trailerSelected: ((UITableViewCell) -> Void)?
    
    @IBAction func showTrailer(_ sender: Any) {
        trailerSelected?(self)
    }
    
}

extension TopRatedTableViewCell: TableViewCellProtocol {
    static func configure<T>(context: UIViewController, tableView: UITableView, indexPath: IndexPath, object: T) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedTableViewCell.identifier, for: indexPath) as! TopRatedTableViewCell
        
        /*
         * Define model here
         */
        guard let data = object as? Movie else { return cell }
        
        /*
         *  Set object to UI
         */
        cell.titleLabel.text = data.originalTitle
        cell.descriptionLabel.text = data.overview
        cell.ratingLabel.text = "\(data.voteAverage)"
        
        cell.trailerSelected = {
            (cells) in
            print("Button in cell action was called")
        }
        
        /*
         *  Set any image in the end of UI definition
         */
        
        guard let url = URL(string: (data.backdropPath.basePictureURL)) else { return cell }
        cell.backdropImageView.setImageAPI(url: url)
        
        return cell
    }
}
