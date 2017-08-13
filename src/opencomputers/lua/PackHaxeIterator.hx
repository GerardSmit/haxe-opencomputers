package opencomputers.lua;

import lua.Table;
import lua.TableTools;

class PackHaxeIterator<T> {
    var state : Table<Int, Dynamic>;
    var f : Void->T;

    public function new(f:Void->T){
        this.f = f;
        this.state = TableTools.pack(f());
    }

    public function next(): T {
        var ret = this.state;
        this.state = TableTools.pack(this.f());
        return TableTools.unpack(ret);
    }

    public function hasNext() return TableTools.maxn(state) > 0;
}