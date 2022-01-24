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

class Car {
    var mark:String
    var yearOfRelease:Int
    var trunkVolume:Int
    var filledTrunkVolume:Int
    var isEngineRunning:Bool
    var areWindowsOpen:Bool
    init(mark:String,yearOfRelease:Int,trunkVolume:Int,filledTrunkVolume:Int,isEngineRunning:Bool,areWindowsOpen:Bool){
        self.mark = mark
        self.yearOfRelease = yearOfRelease
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.isEngineRunning = isEngineRunning
        self.areWindowsOpen = areWindowsOpen
    }
    
    func doAction(action:Action){}
}

class SportCar:Car{
    var inSportsMod:Bool
    init(mark:String,yearOfRelease:Int,trunkVolume:Int,filledTrunkVolume:Int,isEngineRunning:Bool,areWindowsOpen:Bool,inSportsMod:Bool){
        self.inSportsMod = inSportsMod
      super.init(mark: mark, yearOfRelease: yearOfRelease, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume, isEngineRunning: isEngineRunning, areWindowsOpen: areWindowsOpen)
    }
    override func doAction(action: Action) {
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
    var isBodyAttached:Bool
    init(mark:String,yearOfRelease:Int,trunkVolume:Int,filledTrunkVolume:Int,isEngineRunning:Bool,areWindowsOpen:Bool,isBodyAttached:Bool){
        self.isBodyAttached = isBodyAttached
      super.init(mark: mark, yearOfRelease: yearOfRelease, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume, isEngineRunning: isEngineRunning, areWindowsOpen: areWindowsOpen)
    }
    
    override func doAction(action: Action) {
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

var Audi = SportCar(mark: "Audi", yearOfRelease: 2012, trunkVolume: 150, filledTrunkVolume: 50, isEngineRunning: false, areWindowsOpen: false, inSportsMod: false)
var Kamaz = TrunkCar(mark: "Kamaz", yearOfRelease: 2010, trunkVolume: 3000, filledTrunkVolume: 2900, isEngineRunning: true, areWindowsOpen: true, isBodyAttached: true)

print(Audi.isEngineRunning)
Audi.doAction(action: Action.startEngine)
print(Audi.isEngineRunning)
print(Kamaz.areWindowsOpen)
Kamaz.doAction(action: Action.closeWindows)
print(Kamaz.areWindowsOpen)
Kamaz.doAction(action: Action.loadIntoBody(volume: 150))
print(Audi.inSportsMod)
Audi.doAction(action: Action.enterSportsMode)
print(Audi.inSportsMod)
print(Kamaz.isBodyAttached)
Kamaz.doAction(action: Action.unhookTheBody)
print(Kamaz.isBodyAttached)
Audi.doAction(action: .attachTheBody)
