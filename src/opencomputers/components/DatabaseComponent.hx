package opencomputers.components;

import lua.Table;
import opencomputers.lua.LuaIndex;

/**
    The database componet

    @see http://ocdoc.cil.li/component:database
**/

extern class DatabaseComponent extends Component {

    /**
        Get the representation of the item stack stored in the specified slot.
    **/
    @:luaDotMethod
    public function get(slot: LuaIndex): Table<String, Type>;

    /**
        Computes a hash value for the item stack in the specified slot.
        This value is guaranteed to be the same for identical item stacks,
        allowing comparison of item stacks across a network
        (by comparing the hash values).
    **/
    @:luaDotMethod
    public function computeHash(slot: LuaIndex): String;

    /**
        Get the index of an item stack with the specified hash.
        Returns a negative value if no such stack was found.
    **/
    @:luaDotMethod
    public function indexOf(hash: String): Int;

    /**
        Clears the specified slot.
        Returns true if there was something in the slot before.
    **/
    @:luaDotMethod
    public function clear(slot: LuaIndex): Bool;

    /**
        Copies an entry to another slot, optionally to another database.
        Returns true if something was overwritten.
    **/
    @:luaDotMethod
    public function copy(fromSlot: LuaIndex, toSlot: LuaIndex, ?adress: String): Bool;

    /**
        Copies the data stored in this database to another database
        with the specified address.
    **/
    @:luaDotMethod
    public function clone(adress: String): Int;
}
