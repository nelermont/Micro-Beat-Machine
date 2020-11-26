//
//  PlayBeat.swift
//  Micro Beat Machine
//
//  Created by Дмитрий Подольский on 26.11.2020.
//

import Foundation
import AVFoundation
import UIKit


class PlayBeat {
    var audioPlayer = AVAudioPlayer()
    
    func setSound(forResource: String) {
        let music = Bundle.main.path(forResource: forResource, ofType: "mp3")
   
         // copy this syntax, it tells the compiler what to do when action is received
         do {
             audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
             try AVAudioSession.sharedInstance().setActive(true)
         }
         catch{
             print(error)
         }

        audioPlayer.play()
    }

}
