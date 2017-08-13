package oc.lua;

import lua.NativeIterator;

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