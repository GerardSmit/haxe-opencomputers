package opencomputers.components;

import lua.Table;

/**
    This component is provided by Floppy Disks or Hard Disk Drives in Managed mode (for Unmanaged mode, see Drive)

    @see http://ocdoc.cil.li/component:filesystem
**/
extern class Filesystem extends Component {
    /**
        The currently used capacity of the file system, in bytes.
    **/
    @:luaDotMethod
    public function spaceUsed(): Int;
    
    /**
        Opens a new file descriptor and returns its handle.
    **/
    @:luaDotMethod
    public function open(path: String, ?mode: String): Int;
    
    /**
        Seeks in an open file descriptor with the specified handle.
        
        Returns the new pointer position.
    **/
    @:luaDotMethod
    public function seek(handle: Int, whence: String, offset: Int): Int;
    
    /**
        Creates a directory at the specified absolute path in the file system.
        
        Creates parent directories, if necessary.
    **/
    @:luaDotMethod
    public function makeDirectory(path: String): Bool;
    
    /**
        Returns whether an object exists at the specified absolute path in the file system.
    **/
    @:luaDotMethod
    public function exists(path: String): Bool;
    
    /**
        Returns whether the file system is read-only.
    **/
    @:luaDotMethod
    public function isReadOnly(path: String): Bool;
    
    /**
        Writes the specified data to an open file descriptor with the specified handle.
    **/
    @:luaDotMethod
    public function write(handle: Int, value: String): Bool;
    
    /**
        The overall capacity of the file system, in bytes.
    **/
    @:luaDotMethod
    public function spaceTotal(): Int;
    
    /**
        Returns whether the object at the specified absolute path in the file system is a directory.
    **/
    @:luaDotMethod
    public function isDirectory(path: String): Bool;
    
    /**
        Renames/moves an object from the first specified absolute path in the file system to the second.
    **/
    @:luaDotMethod
    public function rename(from: String, to: String): Bool;

    /**
        Renames/moves an object from the first specified absolute path in the file system to the second.
    **/
    @:luaDotMethod
    public function list(path: String): Table<Int, String>;

    /**
        Returns the (real world) timestamp of when the object at the specified absolute path in the file system was modified.
    **/
    @:luaDotMethod
    public function lastModified(path: String): Int;

    /**
        Get the current label of the file system.
    **/
    @:luaDotMethod
    public function getLabel(): String;

    /**
        Removes the object at the specified absolute path in the file system.
    **/
    @:luaDotMethod
    public function remove(path: String): Bool;

    /**
        Closes an open file descriptor with the specified handle.
    **/
    @:luaDotMethod
    public function close(handle: Int): Void;

    /**
        Returns the size of the object at the specified absolute path in the file system.
    **/
    @:luaDotMethod
    public function size(path: String): Int;

    /**
        Reads up to the specified amount of data from an open file descriptor with the specified handle.
        
        Returns nil when EOF is reached.
    **/
    @:luaDotMethod
    public function read(handle: Int, count: Int): Null<String>;

    /**
        Sets the label of the file system.
        
        Returns the new value, which may be truncated.
    **/
    @:luaDotMethod
    public function setLabel(value: String): String;
}