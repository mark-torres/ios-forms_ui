//
//  ReservationDate.swift
//  Forms UI
//
//  Created by Marcos Torres on 5/21/18.
//  Copyright © 2018 HSoft Mobile. All rights reserved.
//

import Foundation

class ReservationDay {
	
	var dateString: String = ""
	var title: String = ""
	
	init(_ title: String, _ dateString: String) {
		self.title = title
		self.dateString = dateString
	}
	
}

class ReservationMonth {
	
	var dates: [ReservationDay] = []
	var title: String = ""
	
	init(_ title: String) {
		self.title = title
	}
	
}

