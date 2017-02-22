//
//  AllFeedbackView.swift
//  Feedback
//
//  Created by Venkateswari Srinivasan on 22/02/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import Foundation
import MGSwipeTableCell

class AllFeedbackView:  UIViewController, UITableViewDataSource, UITableViewDelegate, MGSwipeTableCellDelegate, UIActionSheetDelegate  {
    
    var viewModel: FeedbackViewModel =  FeedbackViewModel()
    
    @IBOutlet weak var feedbackTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackTable.delegate = self
        feedbackTable.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "programmaticCell"
        let  cell = MGSwipeTableCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        cell.textLabel!.text = "Title"
        cell.detailTextLabel!.text = "Detail text"
        cell.delegate = self //optional
        
        //configure left buttons
        cell.leftButtons = [MGSwipeButton(title: "too salty", icon: UIImage(named:"check.png"), backgroundColor: UIColor.green, callback:  { (cell) -> Bool in print("too salty"); return true;
            } ),
                            MGSwipeButton(title: "too", icon: UIImage(named:"check.png"), backgroundColor: UIColor.red),
                            MGSwipeButton(title: "👍", icon: UIImage(named:"check.png"), backgroundColor: UIColor.red)
            ,MGSwipeButton(title: "too spicy", icon: UIImage(named:"fav.png"), backgroundColor: UIColor.blue)]
        cell.leftSwipeSettings.transition = MGSwipeTransition.rotate3D
        
        //configure right buttons
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: UIColor.red)
            ,MGSwipeButton(title: "More",backgroundColor: UIColor.lightGray)]
        cell.rightSwipeSettings.transition = MGSwipeTransition.rotate3D
        
        return cell
        
        
    }
}

