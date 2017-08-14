package opencomputers;

/**
    This API mainly provides information about the computer a Lua state is running on, such as its address and uptime.
    
    @see http://ocdoc.cil.li/api:computer
**/
@:native("_G.computer")
extern class Computer {
    /**
        Shuts down the computer.
        
        Optionally reboots the computer, if reboot is `true`, i.e. shuts down, then starts it again automatically.
    **/
    public static function shutdown(?reboot: Bool): Void;

    /**
        Plays a tone, useful to alert users via audible feedback.
        
        Supports frequencies from 20 to 2000Hz, with a duration of up to 5 seconds.
    **/
    public static function beep(?frequency: Int, ?duration: Int): Void;

    /**
        Tries to pull a signal from the queue, waiting up to the specified amount of time before failing and returning `nil`. If no timeout is specified waits forever.

        The first returned result is the signal name, following results correspond to what was pushed in `pushSignal`, for example. These vary based on the even type. 
    **/
    public static function pullSignal(?timeout: Int): Dynamic;
}