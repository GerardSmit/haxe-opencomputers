package opencomputers;

import lua.Table;
import opencomputers.components.Components;
import opencomputers.lua.MultiReturnIterator;

/**
    The component API is used to access and interact with components available to a computer.
**/
#if openos
@:luaRequire("component")
#else
@:native("_G.component")
#end
extern class Component {
    /**
        Returns the documentation string for the method with the specified name of the component with the specified address, if any.
        
        Note that you can also get this string by using toString on a method in a proxy.
    **/
    public static function doc(address: String, method: String): String;

    /**
        Calls the method with the specified name on the component with the specified address, passing the remaining arguments as arguments to that method. 
        
        Returns the result of the method call, i.e. the values returned by the method. Depending on the called method's implementation this may throw.
    **/
    public static function invoke(address: String, method: String, parameters: Array<Dynamic>): Dynamic;
    
    /**
        Returns an iterator over all components currently attached to the computer, providing tuples of address and component type.

        If filter is set this will only return components that contain the filter string.

        If exact is true the exact matching is enforced, e.g. `red` will not match `redstone`.
    **/
    public static function list(?filter: String, ?exact: Bool): MultiReturnIterator<ListItem>;

    /**
        Returns a table with the names of all methods provided by the component with the specified address.
        
        The names are the keys in the table, the values indicate whether the method is called directly or not.
    **/
    public static function methods(address: String): Table<String, Bool>;

    /**
        Gets a 'proxy' object for a component that provides all methods the component provides as fields, so they can be called more directly (instead of via invoke).
    **/
    public static function proxy(address: String): Components;

    /**
        Get the component type of the component with the specified address.
    **/
    public static function type(address: String): String;

    #if openos
    /**
        Tries to resolve an abbreviated address to a full address.
        
        Returns the full address on success, or nil and an error message otherwise.
    **/
    public static function get(address: String, ?componentType: String): GetResult;

    /**
        Tries to resolve an abbreviated address to a full address.
        
        Returns the full address on success, or nil and an error message otherwise.
    **/
    public static function isAvailable(type: String): Bool;

    /**
        Gets the proxy for the primary component of the specified type.
        
        Throws an error if there is no primary component of the specified type.
    **/
    public static function getPrimary(type: String): Components;

    /**
        Sets a new primary component for the specified component type.
        
        The address may be abbreviated, but must be valid if it is not nil.

        Triggers the component_unavailable and component_available signals if set to nil or a new value, respectively. 
    **/
    public static function setPrimary(type: String, address: String): Void;
    #end
}

@:multiReturn
extern class ListItem {
    /**
        The address.
    **/
    var address : String;

    /**
        The type.
    **/
    var type : String;
}

@:multiReturn
extern class GetResult {
    /**
        The full address.
    **/
    var address : Null<String>;

    /**
        The error if available is false.
    **/
    var error : Null<String>;

    public function new(?address : String, ?error: String) {
        this.address = available;
        this.error = error;
    }
}