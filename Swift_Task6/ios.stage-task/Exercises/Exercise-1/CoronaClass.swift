import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var maximumIndex = 0
    var maximumValue = 0

    init(n: Int) {
        
        if n < 1 || n > 100 {
            return
        }
        self.maximumIndex = n
        self.maximumValue = n - 1
    }
    
    func seat() -> Int {
        var newSeat = 0
        var index = 0
        var digitDistanceMin = 0
        
        if seats.isEmpty {
            seats.append(newSeat)
            return 0
        }
        
        if seats.count == 1 {
            newSeat = seats[0] < maximumIndex - seats[0] ? maximumValue : 0
            let index = newSeat < seats[0] ? 0 : 1
            seats.insert(newSeat, at: index)
        } else {
            for i in seats.indices {
                if  (i + 1) < seats.count {
                    let checkingSeat = (seats[i+1] + seats[i]) / 2
                    if  digitDistanceMin < min(checkingSeat - seats[i], seats[i+1] - checkingSeat) {
                            newSeat = checkingSeat
                            index = i + 1
                            digitDistanceMin = min(newSeat - seats[i],seats[i+1] - newSeat)
                    } else if seats.last != maximumValue {
                        newSeat = maximumValue
                        index = seats.count
                    }
                }
            }
            seats.insert(newSeat, at: index)
        }
        
        return newSeat
    }
    
    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
    }
}
