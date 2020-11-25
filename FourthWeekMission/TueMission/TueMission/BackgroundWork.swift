import Foundation

class BackgroundWork {
    var thread : Thread? = nil
    
    func doTimeConsumingOperation(operation : Any?) {
        thread = Thread(target: self,
                   selector: #selector(BackgroundWork.runHelper), object: operation)
        thread?.start()
    }
    
    @objc func runHelper(operation : Any?) {
        autoreleasepool { () in
            //operation.doOperation()
            print("Other thread is running...")
        }
    }
}


