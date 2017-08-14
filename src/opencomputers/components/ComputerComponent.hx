package opencomputers.components;

/**
    The Computer component

    @see http://ocdoc.cil.li/component:computer
**/

extern class ComputerComponent extends Component {

    /**
        Tries to start the computer.
        Returns true on success, false otherwise.

        Note that this will also return false
        if the computer was already running.
        If the computer is currently shutting down,
        this will cause the computer to reboot instead.
    **/
    @:luaDotMethod
    public function start(): Bool;

    /**
        Tries to stop the computer.
        Returns true on success, false otherwise.

        Also returns false if the computer is already stopped.
    **/
    @:luaDotMethod
    public function stop(): Bool;

    /**
        Returns whether the computer is currently running.
    **/
    @:luaDotMethod
    public function isRunning(): Bool;

    /**
        Plays a tone, useful to alert users via audible feedback.

        Supports frequencies from 20 to 2000Hz,
        with a duration of up to 5 seconds.
    **/
    @:luaDotMethod
    public function beep(?frequency: Int, ?duration: Int): Void;

}
