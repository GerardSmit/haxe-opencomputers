package opencomputers.lua;

import lua.NativeIterator;

/**
    Workaround for issue https://github.com/HaxeFoundation/haxe/issues/6510
**/
@:callable
abstract MultiReturnIterator<T>(Void -> T) {
    public function new(f:Void -> T) {
        this = f;
    }

    @:from
    public static function fromF<T>(f:Void -> T) {
        return new NativeIterator(f);
    }

    @:to
    public function toIterator():Iterator<T> {
        return new PackHaxeIterator(this);
    }
}