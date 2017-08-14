package opencomputers;

import opencomputers.Component.GetResult;

class ComponentTools {
    #if openos
    /**
        Tries to resolve an abbreviated address to a full address.
        
        Returns the full address on success, or nil and an error message otherwise.
    **/
    public static inline function get(address: String, ?componentType: String): GetResult {
        return Component.get(address, componentType);
    }
    #else
    /**
        Tries to resolve an abbreviated address to a full address.
        
        Returns the full address on success, or nil and an error message otherwise.
    **/
    public static function get(address: String, ?componentType: String): GetResult {
        for (c in Component.list(componentType, true)) {
            if (c.address.substr(0, address.length) == address) {
                return new GetResult(c.address);
            }
        }

        return new GetResult(null, "no such component");
    }
    #end
}