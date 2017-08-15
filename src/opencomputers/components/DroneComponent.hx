package opencomputers.components;


/**
    The drone componet

    @see http://ocdoc.cil.li/component:drone
**/

extern class DroneComponent extends Component {

    /**
        Get the status text currently being displayed in the GUI.
    **/
    @:luaDotMethod
    public function getStatusText(): String;

    /**
        Set the status text to display in the GUI, returns new value.
    **/
    @:luaDotMethod
    public function setStatusText(value: String): String;

    /**
        Change the target position by the specified offset.
    **/
    @:luaDotMethod
    public function move(dx: Float, dy: Float, dz: Float): Void;

    /**
        Get the current distance to the target position.
    **/
    @:luaDotMethod
    public function getOffset(): Float;

    /**
        Get the current velocity in m/s.
    **/
    @:luaDotMethod
    public function getVelocity(): Float;

    /**
        Get the maximum velocity, in m/s.
    **/
    @:luaDotMethod
    public function getMaxVelocity(): Float;

    /**
        Get the currently set acceleration.
    **/
    @:luaDotMethod
    public function getAcceleration(): Float;

    /**
        Try to set the acceleration to the specified value and
        return the new acceleration.
    **/
    @:luaDotMethod
    public function setAcceleration(value: Float): Float;

    /**
        Gets the current color of the flap lights
        as an integer encoded RGB value (0xRRGGBB).
    **/
    @:luaDotMethod
    public function getLightColor(): Int;

    /**
        Sets the color of the flap lights
        to the specified integer encoded RGB value (0xRRGGBB).
    **/
    @:luaDotMethod
    public function setLightColor(): Int;

}
