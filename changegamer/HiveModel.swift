//
//  HiveModel.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/4/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation

class HiveModel: NSObject {

    var objectID: String?
    var hiveName: String?
    var beeKeepers : Array<BeeKeeperModel>? = [BeeKeeperModel]()
    var honeyBees : Array<HoneyBeeModel>? = [HoneyBeeModel]()
}
