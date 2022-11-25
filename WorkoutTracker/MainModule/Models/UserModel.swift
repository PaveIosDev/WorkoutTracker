//
//  UserModel.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 25.11.2022.
//

import RealmSwift
import Foundation


class UserModel: Object {
    @Persisted var userFirstName: String = "Unknown"
    @Persisted var userSecondName: String = "Unknown"
    @Persisted var userHeight: Int = 0
    @Persisted var userWeight: Int = 0
    @Persisted var userTarget: Int = 0
    @Persisted var userImage: Data?
}
