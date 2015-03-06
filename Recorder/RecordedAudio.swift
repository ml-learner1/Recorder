//
//  RecordedAudio.swift
//  Recorder
//
//  Created by Garg, Smith on 3/4/15.
//  Copyright (c) 2015 Garg, Smith. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl:NSURL!, title:String!) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}