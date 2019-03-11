# EscapeTactic

## MacOS touchbar vibration feedback (Haptic feedback for ESC key)

When the programm is runnig it will listen to the keypress on ESC on the touchbar and give an haptic feedback (vibrate) 

## Run it with a session 

`git clone git@github.com:lorenzosinisi/EscapeTactic.git`

`cd EscapeTactic`

`./bin/EscapeTactic`

## Run it in a shell session

`git clone git@github.com:lorenzosinisi/EscapeTactic.git`

`cd EscapeTactic`

`./bin/EscapeTactic` # and stop it with `./stop`

## Run it as a daemon

`git clone git@github.com:lorenzosinisi/EscapeTactic.git`

`cd EscapeTactic`

`./start`


## Test

Now put a finder on your trackpad and press ESC at the same time, the trackpad should vibrate

## TODOs

- create a homebrew formula with commands to start and stop the binary

## Special thanks

Thanks to [https://github.com/SkrewEverything/Swift-Keylogger](https://github.com/SkrewEverything/Swift-Keylogger) for the initial code
