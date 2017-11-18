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

// intermediate abstract class
class Guitar: Instrument {
    let stringGuage: String
    
    init(brand: String, stringGauge: String = "medium") {
        self.stringGuage = stringGauge
        super.init(brand: brand)
    }
}

class AcousticGuitar: Guitar {
    static let numberOfStrings = 6
    static let fretCount = 20
    
    override func tune() -> String {
        return "Tune \(brand) acoustic with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play folk tune on frets \(preparedNotes)"
    }
}

let acousticGuitar = AcousticGuitar(brand: "Roland", stringGauge: "light")
// Playground
//acousticGuitar.tune()
//acousticGuitar.play(music)


class Amplifier {
    
    // access only inside method, "_" - hidden implementation (Swift agreement)
    private var _volume: Int
    
    // read only access to value isOn for outer "users?"
    private(set) var isOn: Bool
    
    init() {
        isOn = false
        _volume = 0
    }
    
    func plugIn() {
        isOn = true
    }
    
    func unplug() {
        isOn = false
    }
    
    // work for _volume to set required rules
    var volume: Int {
        // set volume sound to 0 if "volume"
        get {
            return isOn ? _volume : 0
        }
        set {
            _volume = min(max(newValue, 0), 10)
        }
    }
}

class ElecticGuitar: Guitar {
    // ElecticGuitar "has-a" amplifier
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "light", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        amplifier.volume = 5
        return "Tune \(brand) electic with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play solo \(preparedNotes) at volume \(amplifier.volume)."
    }
}

class BassGuitar: Guitar {
    
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "heavy", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        return "Tune \(brand) bass with E A D G"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play bass line \(preparedNotes) at volume \(amplifier.volume)."
    }
    
}




