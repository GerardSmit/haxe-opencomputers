package oc.component.components;

/**
    The gpu component

    @see http://ocdoc.cil.li/component:gpu?s[]=gpu
**/
extern class GpuComponent {
    /**
        Tries to bind the GPU to a screen with the specified address. 
        Resets the screen's settings if reset is 'true'. 
        
        A GPU can only be bound to one screen at a time. 
        If you wish to control multiple screens at once, you'll need to put more than one graphics card into your computer.
        
        Returns true on success, false and an error message on failure. 
    **/
    @:luaDotMethod
    public function bind(address: String, ?reset: Bool): BindResult;

    /**
        Get the address of the screen the GPU is bound to. 
        
        @since 1.3.2
    **/
    @:luaDotMethod
    public function getScreen(): String;
}

/**
    The bind result of GpuComponent.bind
**/
@:multiReturn
extern class BindResult {
    var success : Bool;
    var error: String;
}