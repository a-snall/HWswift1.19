//
//  ContentView.swift
//  HWswift1.19
//
//  Created by Astrid Snäll on 2/6/23.
//




 

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var messageString = "  "
    @State private var imageName = ""
    
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    
    
    @State private var audioPlayer: AVAudioPlayer!
    var body: some View {
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            Spacer()
            
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            
            
            Button("Show message") {
                let messages = [ "you are awesome",
                                 "you are great!",
                                 "you are fantastic",
                                 "fabulous, that is you!",
                                 "you make me smile"]
                lastMessageNumber = nonRepeatingRandom(lastNumber:
                    lastMessageNumber, upperBound: messages.count-1)
                messageString = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                playSound(soundName: "sound\(lastSoundNumber)")
                
//                var messageNumber = Int.random(in: 0...messages.count-1)
//                while messageNumber == lastMessageNumber {
//                    messageNumber = Int.random(in: 0...messages.count-1)
//                }
//                messageString = messages[messageNumber]
//                lastMessageNumber = messageNumber
                
//                var imageNumber = Int.random(in: 0...9)
//                while imageNumber == lastImageNumber {
//                    imageNumber = Int.random(in: 0...9)
//                }
//                imageName = "image\(imageNumber)"
                //   lastImageNumber = imageNumber
              
//                var imageNumber: Int
//                repeat {
//                    imageNumber = Int.random(in: 0...9)
//                } while imageNumber == lastImageNumber
//                lastImageNumber = imageNumber
//                imageName = "image\(imageNumber)"
//
//
//                var soundNumber: Int
//                repeat {
//                    soundNumber = Int.random(in: 0...5)
//                } while soundNumber == lastSoundNumber
//                lastSoundNumber = soundNumber
//                soundName = "sound\(soundNumber)"
//
//                playSound(soundName: "sound\(soundNumber)")
//
            }
            .buttonStyle(.borderedProminent)
            
        }}
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return   newNumber
       
    }
    
    func playSound(soundName: String) {
        
        guard let soundFile = NSDataAsset(name: soundName) else
        {
            print("😪could not read file \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    
    
}
