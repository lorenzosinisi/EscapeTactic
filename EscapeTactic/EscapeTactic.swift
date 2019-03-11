//

import Foundation
import IOKit.hid
import Cocoa

class EscapeTactic
{
    var manager: IOHIDManager
    var deviceList = NSArray()
    var bundlePathURL = Bundle.main.bundleURL
    var appName = ""
    
    init()
    { 
        manager = IOHIDManagerCreate(kCFAllocatorDefault, IOOptionBits(kIOHIDOptionsTypeNone))

       
       
        deviceList = deviceList.adding(CreateDeviceMatchingDictionary(inUsagePage: kHIDPage_GenericDesktop, inUsage: kHIDUsage_GD_Keyboard)) as NSArray
        deviceList = deviceList.adding(CreateDeviceMatchingDictionary(inUsagePage: kHIDPage_GenericDesktop, inUsage: kHIDUsage_GD_Keypad)) as NSArray

        IOHIDManagerSetDeviceMatchingMultiple(manager, deviceList as CFArray)
        
        
       
        let observer = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        
        /* Input value Call Backs */
        IOHIDManagerRegisterInputValueCallback(manager, CallBackFunctions.Handle_IOHIDInputValueCallback, observer);
        
        /* Open HID Manager */
        let ioreturn: IOReturn = openHIDManager()
        if ioreturn != kIOReturnSuccess
        {
            print("Can't open HID!")
        }

    }
    
    func CreateDeviceMatchingDictionary(inUsagePage: Int ,inUsage: Int ) -> CFMutableDictionary
    {
        
        let resultAsSwiftDic = [kIOHIDDeviceUsagePageKey: inUsagePage, kIOHIDDeviceUsageKey : inUsage]
        let resultAsCFDic: CFMutableDictionary = resultAsSwiftDic as! CFMutableDictionary
        return resultAsCFDic
    }
    
    func openHIDManager() -> IOReturn
    {
        return IOHIDManagerOpen(manager, IOOptionBits(kIOHIDOptionsTypeNone));
    }
    
    /* Scheduling the HID Loop */
    func start()
    {
        IOHIDManagerScheduleWithRunLoop(manager, CFRunLoopGetMain(), CFRunLoopMode.defaultMode.rawValue)
    }
    
    /* Un-scheduling the HID Loop */
    func stop()
    {
        IOHIDManagerUnscheduleFromRunLoop(manager, CFRunLoopGetMain(), CFRunLoopMode.defaultMode.rawValue);
    }
    
}
