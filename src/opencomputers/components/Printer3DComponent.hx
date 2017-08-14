package opencomputers.components;

/**
    The 3D Printer component

    @see http://ocdoc.cil.li/component:3d_printer
**/

extern class Printer3DComponent {

    /**
        Commit and begin printing the current configuration.
    **/
    @:luaDotMethod
    public function commit(count: Int): Bool;

    /**
        Set the label for the volume being printed.
    **/
    @:luaDotMethod
    public function setLabel(value: String): Void;

    /**
        Get the current label for the volume being printed.
    **/
    @:luaDotMethod
    public function getLabel(): String;

    /**
        Sets the tooltip for the volume being printed.
    **/
    @:luaDotMethod
    public function setTooltip(value: String): Void;

    /**
        Gets the tooltip for the volume being printed.
    **/
    @:luaDotMethod
    public function getTooltip(): String;

    /**
        Set whether the printed block
        should automatically return to its off state.
    **/
    @:luaDotMethod
    public function setButtonMode(value: Bool): Void;

    /**
        Get whether the printed block
        should automatically return to its off state.
    **/
    @:luaDotMethod
    public function isButtonMode(): Bool;

    /**
        Sets whether the printed block
        should emit a redstone signal while in its active state.
    **/
    @:luaDotMethod
    public function setRedstoneEmitter(value: Boolean): Void;

    /**
        Gets whether the printed block
        should emit a redstone signal while in its active state.
    **/
    @:luaDotMethod
    public function isRedstoneEmitter(): Boolean;

    /**
        Adds the shape to the printer's current configuration,
        optionally specifying whether it is for the off or on state.
    **/
    @:luaDotMethod
    public function addShape(minX: Int, minY: Int, minZ: Int, maxX: Int, maxY: Int, maxZ: Int, texture: String, ?state: Bool, ?tint: Int): Void;

    /**
        Gets the number of shapes in the current configuration.
    **/
    @:luaDotMethod
    public function getShapeCount(): Int;

    /**
        Gets the maximum allowed number of shapes.
    **/
    @:luaDotMethod
    public function getMaxShapeCount(): Int;

    /**
        The current state of the printer, 'busy' or 'idle' (string),
        followed by the progress (number) or
        model validity (boolean), respectively.
    **/
    @:luaDotMethod
    public function status(): Printer3DStatus;

    /**
        Resets the current job for the printer and
        stops printing (current job being printed will finish).
    **/
    @:luaDotMethod
    public function reset(): Void;
}

@:multiReturn
extern class Printer3DStatus {
    var state: String;
    var modelValid: EitherType<Int, Bool>;
}
