import UIKit



import UIKit

var greeting = "Hello, playground"

enum Action {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadIntoBody(volume:Int)
    case unloadFromBody(volume:Int)
    case enterSportsMode
    case exitSportsMode
    case unhookTheBody
    case attachTheBody
}

protocol Car {
    var mark:String {get}
    var yearOfRelease:Int {get}
    var trunkVolume:Int{get}
    var filledTrunkVolume:Int{get set}
    var isEngineRunning:Bool{get set}
    var areWindowsOpen:Bool{get set}
    
    func doAction(action:Action)
}

extension Car{
    mutating func openWindows(){
        self.areWindowsOpen=true
    }
    
    mutating func closeWindows(){
        self.areWindowsOpen=false
    }
    
    mutating func startEngine(){
        self.isEngineRunning=true
    }
    
    mutating func stopEngine(){
        self.isEngineRunning=false
    }
    
    mutating func loadIntoBody(volume:Int){
        if self.filledTrunkVolume+volume<=self.trunkVolume {
            self.filledTrunkVolume+=volume
        } else {
            print("Не хватает места!")
        }
    }
    
    mutating func unloadFromBody(volume:Int){
        if self.filledTrunkVolume-volume>=0 {
            self.filledTrunkVolume+=volume
        } else {
            print("Невозможно выполнить операцию!")
        }
    }
}


class SportCar:Car{
    var mark: String
    
    var yearOfRelease: Int
    
    var trunkVolume: Int
    
    var filledTrunkVolume: Int
    
    var isEngineRunning: Bool
    
    var areWindowsOpen: Bool
    
    var inSportsMod:Bool
    
    init(mark:String,yearOfRelease:Int,trunkVolume:Int,filledTrunkVolume:Int,isEngineRunning:Bool,areWindowsOpen:Bool,inSportsMod:Bool){
        self.inSportsMod = inSportsMod
        self.isEngineRunning = isEngineRunning
        self.areWindowsOpen = areWindowsOpen
        self.mark = mark
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume  = filledTrunkVolume
        self.yearOfRelease = yearOfRelease
    }
    
    func doAction(action: Action) {
        switch action {
        case .startEngine:
            isEngineRunning = true
        case .stopEngine:
            isEngineRunning = false
        case .openWindows:
            areWindowsOpen = true
        case .closeWindows:
            areWindowsOpen = false
        case .loadIntoBody(let volume):
            if filledTrunkVolume+volume<=trunkVolume {
                filledTrunkVolume+=volume
            } else {
                print("Не хватает места!")
            }
        case .unloadFromBody(let volume):
            if filledTrunkVolume-volume>=0 {
                filledTrunkVolume+=volume
            } else {
                print("Невозможно выполнить операцию!")
            }
        case .enterSportsMode:
            inSportsMod = true
        case .exitSportsMode:
            inSportsMod = false
        default:
            print("Действие невозможно выполнить с данным типом автомобиля")
        }
    }
}

class TrunkCar:Car{
    var mark: String
    
    var yearOfRelease: Int
    
    var trunkVolume: Int
    
    var filledTrunkVolume: Int
    
    var isEngineRunning: Bool
    
    var areWindowsOpen: Bool
    
    var isBodyAttached:Bool
    
    init(mark:String,yearOfRelease:Int,trunkVolume:Int,filledTrunkVolume:Int,isEngineRunning:Bool,areWindowsOpen:Bool,isBodyAttached:Bool){
        self.isBodyAttached = isBodyAttached
        self.isEngineRunning = isEngineRunning
        self.areWindowsOpen = areWindowsOpen
        self.mark = mark
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume  = filledTrunkVolume
        self.yearOfRelease = yearOfRelease
    }

    func doAction(action: Action) {
        switch action {
        case .startEngine:
            isEngineRunning = true
        case .stopEngine:
            isEngineRunning = false
        case .openWindows:
            areWindowsOpen = true
        case .closeWindows:
            areWindowsOpen = false
        case .loadIntoBody(let volume):
            if filledTrunkVolume+volume<=trunkVolume {
                filledTrunkVolume+=volume
            } else {
                print("Не хватает места!")
            }
        case .unloadFromBody(let volume):
            if filledTrunkVolume-volume>=0 {
                filledTrunkVolume+=volume
            } else {
                print("Невозможно выполнить операцию!")
            }
        case .attachTheBody:
            isBodyAttached = true
        case .unhookTheBody:
            isBodyAttached = false
        default:
            print("Действие невозможно выполнить с данным типом автомобиля")
        }
    }
}

extension SportCar:CustomStringConvertible{
    var description: String {
        return "Спорткар марки \(mark) \(yearOfRelease) года выпуска. Объем багажника - \(trunkVolume) литра, из которых \(filledTrunkVolume) заполнено. На данный момент двигатель \(isEngineRunning ? "заведен" : "не заведен"), окна \(areWindowsOpen ? "открыты" : "закрыты") и спортрежим \(inSportsMod ? "включен" : "выключен")."
    }
}

extension TrunkCar:CustomStringConvertible{
    var description: String {
        return "Грузовик марки \(mark) \(yearOfRelease) года выпуска. Объем кузова - \(trunkVolume) литра, из которых \(filledTrunkVolume) заполнено. На данный момент двигатель \(isEngineRunning ? "заведен" : "не заведен"), окна \(areWindowsOpen ? "открыты" : "закрыты") и кузов \(isBodyAttached ? "прицеплен" : "отцеплен")."
    }
}


var Audi = SportCar(mark: "Audi", yearOfRelease: 2012, trunkVolume: 150, filledTrunkVolume: 50, isEngineRunning: false, areWindowsOpen: true, inSportsMod: false)
var Kamaz = TrunkCar(mark: "Kamaz", yearOfRelease: 2010, trunkVolume: 3000, filledTrunkVolume: 2900, isEngineRunning: false, areWindowsOpen: true, isBodyAttached: true)

print(Audi.isEngineRunning)
Audi.startEngine()
print(Audi.isEngineRunning)
print(Kamaz.areWindowsOpen)
Kamaz.closeWindows()
print(Kamaz.areWindowsOpen)
Kamaz.loadIntoBody(volume: 150)
print(Audi.inSportsMod)
Audi.doAction(action: Action.enterSportsMode)
print(Audi.inSportsMod)
print(Kamaz.isBodyAttached)
Kamaz.doAction(action: Action.unhookTheBody)
print(Kamaz.isBodyAttached)
Audi.doAction(action: .attachTheBody)
print(Audi.description)
print(Kamaz.description)
