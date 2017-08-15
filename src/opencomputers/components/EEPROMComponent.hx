package opencomputers.components;

/**
    The eeprom componet

    @see http://ocdoc.cil.li/component:eeprom
**/

extern class EEPROMComponent extends Component {

    /**
        Get the currently stored byte array.
    **/
    @:luaDotMethod
    public function get(): String;

    /**
        Overwrite the currently stored byte array.
    **/
    @:luaDotMethod
    public function set(data: String): ;

    /**
        Get the label of the EEPROM.
    **/
    @:luaDotMethod
    public function getLabel(): String;

    /**
        Set the label of the EEPROM.
    **/
    @:luaDotMethod
    public function setLabel(data: String): ;

    /**
        Gets the maximum storage capacity of the EEPROM.
    **/
    @:luaDotMethod
    public function getSize(): Int;

    /**
        Gets the maximum data storage capacity of the EEPROM.
    **/
    @:luaDotMethod
    public function getDataSize(): Int;

    /**
        Gets currently stored byte-array
        (usually the component address of the main boot device).
    **/
    @:luaDotMethod
    public function getData(): String;

    /**
        Overwrites currently stored byte-array with specified string.
    **/
    @:luaDotMethod
    public function setData(data:String): Void;

    /**
        Gets Checksum of data on EEPROM.
    **/
    @:luaDotMethod
    public function getChecksum(): String;

    /**
        Makes the EEPROM Read-only if it isn't.
        This process cannot be reversed.
    **/
    @:luaDotMethod
    public function makeReadonly(checksum: String): Bool;
}
