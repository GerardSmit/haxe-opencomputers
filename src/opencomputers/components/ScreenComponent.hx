package opencomputers.components;

/**
    The screen component

    @see http://ocdoc.cil.li/component:screen
**/
extern class ScreenComponent {
    /**
        Returns whether the screen is currently on.
    **/
    @:luaDotMethod
    public function isOn(): Bool;
    
    /**
        Turns the screen on. Returns `true` if it was off.
    **/
    @:luaDotMethod
    public function turnOn(): Bool;
    
    /**
        Turns off the screen. Returns `true` if it was on.
    **/
    @:luaDotMethod
    public function turnOff(): Bool;
    
    /**
        The aspect ratio of the screen.
        
        For multi-block screens this is the number of blocks, horizontal and vertical.
    **/
    @:luaDotMethod
    public function getAspectRatio(): AspectRatio;
    
    // TODO getKeyboards()

    /**
        Set whether to use high-precision mode (sub-pixel mouse event position).

        Requires Screen (Tier 3).
    **/
    @:luaDotMethod
    public function setPrecise(enabled: Bool): Bool;

    /**
        Check whether high-precision mode is enabled (sub-pixel mouse event position).

        Requires Screen (Tier 3).
    **/
    @:luaDotMethod
    public function isPrecise(): Bool;

    /**
        Sets Inverted Touch mode (Sneak-activate opens GUI if set to true).
    **/
    @:luaDotMethod
    public function setTouchModeInverted(enabled: Bool): Bool;

    /**
        Check to see if Inverted Touch mode is enabled (Sneak-activate opens GUI is set to true).
    **/
    @:luaDotMethod
    public function isTouchModeInverted(): Bool;
}

/**
    The aspect ratio result from ScreenComponent.getAspectRatio
**/
@:multiReturn
extern class AspectRatio {
    var x: Int;
    var y: Int;
}