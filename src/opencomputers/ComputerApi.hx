package opencomputers;

import lua.TableTools;
import lua.Table;
import haxe.extern.Rest;
import haxe.extern.EitherType;

/**
    This API mainly provides information about the computer a Lua state is running on, such as its address and uptime.
    
    @see http://ocdoc.cil.li/api:computer
**/
@:native("_G.computer")
extern class ComputerApi {
    /**
        The component address of this computer.
    **/
    public static function address(): String;
    
    #if openos
    /**
        The amount of memory currently unused, in bytes. 
        
        If this gets close to zero your computer will probably soon crash with an out of memory error. 
        
        Note that for OpenOS, it is highly recommended to at least have 1x tier 1.5 RAM stick or more. The os will boot on a single tier 1 ram stick, but quickly and easily run out of memory.
    **/
    #else
    /**
        The amount of memory currently unused, in bytes. 
        
        If this gets close to zero your computer will probably soon crash with an out of memory error. 
    **/
    #end
    public static function freeMemory(): Int;

    /**
        The total amount of memory installed in this computer, in bytes.
    **/
    public static function totalMemory(): Int;

    /**
        The amount of energy currently available in the network the computer is in.
        
        For a robot this is the robot's own energy / fuel level.
    **/
    public static function energy(): Int;

    /**
        The maximum amount of energy that can be stored in the network the computer is in.
        
        For a robot this is the size of the robot's internal buffer (what you see in the robot's GUI).
    **/
    public static function maxEnergy(): Int;

    /**
        The time in real world seconds this computer has been running, measured based on the world time that passed since it was started - meaning this will not increase while the game is paused, for example.
    **/
    public static function uptime(): Int;

    /**
        Shuts down the computer.
        
        Optionally reboots the computer, if reboot is `true`, i.e. shuts down, then starts it again automatically.
    **/
    public static function shutdown(?reboot: Bool): Void;

    /**
        Get the address of the filesystem component from which to try to boot first.
        
        @since 1.3
    **/
    public static function getBootAddress(): Int;

    /**
        Set the address of the filesystem component from which to try to boot first.
        
        Call with nil / no arguments to clear. 
        
        @since 1.3
    **/
    public static function setBootAddress(?address: String): Int;

    /**
        Plays a tone, useful to alert users via audible feedback.
        
        Supports frequencies from 20 to 2000Hz, with a duration of up to 5 seconds.
    **/
    public static function beep(?frequency: Int, ?duration: Int): Void;

    /**
        A list of all users registered on this computer, as a tuple.
        
        To get the result as a table, use ComputerApi.usersTable() instead.
        
        Please see the user rights documentation.

        @see http://ocdoc.cil.li/computer_users
    **/
    public static function users(): Dynamic;

    /**
        Gets the users of the computer as a table.
        
        Please see the user rights documentation.

        @see http://ocdoc.cil.li/computer_users
    **/
    public static inline function usersTable(): Table<Int, String> {
        return TableTools.pack(users());
    }

    #if openos
    /**
        Registers a new user with this computer. 
        
        Returns `true` if the user was successfully added. 
        Returns nil and an error message otherwise.
        
        The user must be currently in the game.
        The user will gain full access rights on the computer.
        
        In the shell, `useradd USER` is a command line option to invoke this method.
    **/
    #else
    /**
        Registers a new user with this computer. 
        
        Returns `true` if the user was successfully added. 
        Returns nil and an error message otherwise.
        
        The user must be currently in the game.
        The user will gain full access rights on the computer.
    **/
    #end
    public static function addUser(name: String): AddUserResult;

    #if openos
    /**
        Unregisters a user from this computer. 
        
        Returns `true` if the user was removed, `false` if they weren't registered in the first place.
        
        The user will lose all access to this computer.
        When the last user is removed from the user list, the computer becomes accessible to all players. 
        
        `userdel USER` is a command line option to invoke this method.
    **/
    #else
    /**
        Unregisters a user from this computer. 
        
        Returns `true` if the user was removed, `false` if they weren't registered in the first place.
        
        The user will lose all access to this computer.
        When the last user is removed from the user list, the computer becomes accessible to all players. 
    **/
    #end
    public static function removeUser(name: String): AddUserResult;

    /**
        Pushes a new signal into the queue.
        
        Signals are processed in a FIFO order.
        The signal has to at least have a name.
        Arguments to pass along with it are optional.
        
        Note that the types supported as signal parameters are limited to the basic types nil, boolean, number and string: tables and functions are not supported. 
    **/
    public static function pushSignal(name: String, arguments: Rest<Null<EitherType<Bool, EitherType<String, EitherType<Int, Float>>>>>): Dynamic;

    /**
        Tries to pull a signal from the queue, waiting up to the specified amount of time before failing and returning `nil`. If no timeout is specified waits forever.

        The first returned result is the signal name, following results correspond to what was pushed in `pushSignal`, for example. These vary based on the even type. 
    **/
    public static function pullSignal(?timeout: Int): Dynamic;

    #if openos
    /**
        The component address of the computer's temporary file system (if any), used for mounting it on startup.
    **/
    public static function tmpAddress(): String;

    /**
        Returns the current runlevel the computer is in.
        
        Current Runlevels in OpenOS are:

        - `S`: Single-User mode, no components or filesystems initialized yet
        - `1`: Single-User mode, filesystems and components initialized - OpenOS finished booting
    **/
    public static function runlevel(?address: String): Int;
    #end
}

@:multiReturn
extern class AddUserResult {
    var success : Int;
    var error : String;
}