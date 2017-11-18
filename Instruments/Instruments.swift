class Instrument {
    
    let brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func tune() -> String {
        fatalError("Implement this method for \(brand)")
    }
    
    func play(_ music: Music) -> String {
        return music.prepared()
    }
    
    func perform(_ music: Music) {
        print(tune())
        print(play(music))
    }
}

class Piano: Instrument {
    
    let hasPedals: Bool
    static let whiteKeys = 52
    static let blackKeys = 36
    
    init(brand: String, hasPedals: Bool = false) {
        self.hasPedals = hasPedals
        super.init(brand: brand)
    }
    
    override func tune() -> String {
        return "Piano standard tuning for \(brand)."
    }
    
    // new extended version of play method
    func play(_ music: Music, usingPedals: Bool) -> String {
        let preparedNotes = super.play(music)
        
        if hasPedals && usingPedals {
            return "Play piano notes \(preparedNotes) with pedals"
        } else {
            return "Play piano notes \(preparedNotes) with pedals"
        }
    }
    
    // overriding using new extended version of play using pedals
    override func play(_ music: Music) -> String {
        return play(music, usingPedals: hasPedals)
    }
}

class Music {
    
    let notes: [String]
    
    init(notes: [String]) {
        self.notes = notes
    }
    
    func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

// instances of classes

let piano = Piano(brand: "Yamaha", hasPedals: true)
// for Playground
//piano.tune()
let music = Music(notes: ["C", "G", "F"])
// for Playground
//piano.play(music, usingPedals: false)
// for Playground - property of the Type
//Piano.blackKeys







