package opencomputers.lua;

abstract LuaIndex(Int) {
    function new(v:Int) {
        this = v;
    }
    
    @:from static function fromInt(i:Int):LuaIndex {
        return new LuaIndex(i + 1);
    }
}