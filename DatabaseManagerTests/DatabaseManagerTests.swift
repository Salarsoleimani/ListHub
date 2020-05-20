//
//  DatabaseManagerTests.swift
//  DatabaseManagerTests
//
//  Created by Salar Soleimani on 2020-04-28.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import XCTest
@testable import DatabaseManager
import Domain


class DatabaseManagerTests: XCTestCase {
	
	var manager: DBManager?
	
	override func setUp() {
		manager = DBManager()
	}
	
	override func tearDown() {
		manager = nil
	}
	func testAddAListWithComponents() {
		let list = ListModel(title: "Test", iconId: -1, iconColor: "Gray")
		let components: [InputComponentType] = [
			ComponentElements.SimpleString.Input(title: "title1", listUID: list.uid),
			ComponentElements.PhoneNumber.Input(title: "title2", listUID: list.uid),
			ComponentElements.SimpleString.Input(title: "title3", listUID: list.uid),
			ComponentElements.SimpleString.Input(title: "title4", listUID: list.uid)
		]
		manager?.add(List: list, components: components, response: { [manager](finished) in
			if finished {
				manager?.get(InputComponentsForListUID: list.uid, response: { (items) in
					XCTAssertEqual(components.count, items.count)
				})
				return
			}
			XCTAssertTrue(false)
		})
	}
}
