import Foundation
import Cocoa

import AppKit

class CallBackFunctions
{    
    static let Handle_IOHIDInputValueCallback: IOHIDValueCallback = { context, result, sender, device in
        let mySelf = Unmanaged<EscapeTactic>.fromOpaque(context!).takeUnretainedValue()
        let elem: IOHIDElement = IOHIDValueGetElement(device );
        var test: Bool
        if (IOHIDElementGetUsagePage(elem) != 0x07)
        {
            return
        }
        let scancode = IOHIDElementGetUsage(elem);
        if (scancode < 4 || scancode > 231)
        {
            return
        }
        let pressed = IOHIDValueGetIntegerValue(device );
        Outside:if pressed == 1
        {
            if scancode == 41
            {
                NSHapticFeedbackManager.defaultPerformer.perform(.alignment, performanceTime: .now)
                usleep(10000)
                break Outside
            }
        }
        else
        {
         // do nothing
        }
    }
}
