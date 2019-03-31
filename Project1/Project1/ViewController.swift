//
//  ViewController.swift
//  Project1
//
//  Created by Matt Urenovich on 3/31/19.
//  Copyright © 2019 Matt Urenovich. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	var pictures = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let fm = FileManager.default // Data Type that allows interaction with the filesystem.
		let path = Bundle.main.resourcePath! // Declares a constant to the resource path of the app bundle.
		let items = try! fm.contentsOfDirectory(atPath: path) // Declares a constant that sets the contents of the directory at a path.
		
		for item in items {	// Executes a Loop once for every item found in the app bundle.
			if item.hasPrefix("nssl") {	//
				pictures.append(item)
			}
		}
		
		print(pictures)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) // Creates a new constant called cell by dequeuing a recycled cell from the table.
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}
	// First, override func tableView(_ tableView: UITableView is identical to the previous method: the method name is just tableView(), and it will pass in a table view as its first parameter. The _ means it doesn’t need to have a name sent externally, because it’s the same as the method name.
	//
	// Second, cellForRowAt indexPath: IndexPath is the important part of the method name. The method is called cellForRowAt, and will be called when you need to provide a row. The row to show is specified in the parameter: indexPath, which is of type IndexPath. This is a data type that contains both a section number and a row number. We only have one section, so we can ignore that and just use the row number.
	//
	// Third, -> UITableViewCell means this method must return a table view cell. If you remember, we created one inside Interface Builder and gave it the identifier “Picture”, so we want to use that.
	//
	// Here’s where a little bit of iOS magic comes in: if you look at the Settings app, you’ll see it can fit only about 12 rows on the screen at any given time, depending on the size of your phone.
	//
	// To save CPU time and RAM, iOS only creates as many rows as it needs to work. When one rows moves off the top of the screen, iOS will take it away and put it into a reuse queue ready to be recycled into a new row that comes in from the bottom. This means you can scroll through hundreds of rows a second, and iOS can behave lazily and avoid creating any new table view cells – it just recycles the existing ones.
}

