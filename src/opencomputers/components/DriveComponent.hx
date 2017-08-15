package opencomputers.components;

import opencomputers.lua.LuaIndex;

/**
    The drive componet

    @see http://ocdoc.cil.li/component:drive
**/

extern class DriveComponent extends Component {

    /**
        Read a single byte at the specified offset.
    **/
    @:luaDotMethod
    public function readByte(offset: LuaIndex): Int;

    /**
        Write a single byte to the specified offset.
    **/
    @:luaDotMethod
    public function writeByte(offset: LuaIndex, value: Int): Void;

    /**
        Returns the size of a single sector on the drive, in bytes.
    **/
    @:luaDotMethod
    public function getSectorSize(): Int;

    /**
        Get the current label of the drive.
    **/
    @:luaDotMethod
    public function getLabel(): String;

    /**
        Sets the label of the drive.
        Returns the new value, which may be truncated.
    **/
    @:luaDotMethod
    public function setLabel(value: String): String;

    /**
        Read the current contents of the specified sector.
    **/
    @:luaDotMethod
    public function readSector(sector: LuaIndex): String;

    /**
        Write the specified contents to the specified sector.
    **/
    @:luaDotMethod
    public function writeSector(sector: LuaIndex, value: String): Void;

    /**
        Returns the number of platters in the drive.
    **/
    @:luaDotMethod
    public function getPlatterCount(): Int;

    /**
        Returns the total capacity of the drive, in bytes.
    **/
    @:luaDotMethod
    public function getCapacity(): Int;
}
