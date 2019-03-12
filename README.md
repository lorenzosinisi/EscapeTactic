# EscapeTactic

## MacOS touchbar vibration feedback (Haptic feedback for ESC key)

When the programm is running, it will listen to the keypress ESC on the touchbar and give you an haptic feedback (trackpad vibrates) 

## Run it in a shell session

`git clone https://github.com/lorenzosinisi/EscapeTactic.git`

`cd EscapeTactic`

`./bin/EscapeTactic` # and stop it with `./stop`

## Run it as a daemon

`git clone https://github.com/lorenzosinisi/EscapeTactic.git`

`cd EscapeTactic`

`./escape_tactic start` # or `./escape_tactic stop`


## Test

Now put a finger on your trackpad and press ESC at the same time, the trackpad should vibrate

## TODOs

- create a homebrew formula with commands to start and stop the binary

## Special thanks

Thanks to [https://github.com/SkrewEverything/Swift-Keylogger](https://github.com/SkrewEverything/Swift-Keylogger) for the initial code
