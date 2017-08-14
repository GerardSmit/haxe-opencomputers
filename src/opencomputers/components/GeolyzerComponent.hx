package opencomputers.components;

import lua.Table;

/**
    The geolyzer component

    @see http://ocdoc.cil.li/component:geolyzer
**/
extern class GeolyzerComponent extends Component {
    /**
        Analyzes the density of the column
        at the specified relative coordinates.

        This will return a list of hardness values for the blocks
        in the specified range.
        The coordinates are relative to the location of the geolyzer.

        Hardness values for blocks further away from the geolyzer
        are more noisy than those for blocks nearby.
    **/
    @:luaDotMethod
    @:overload(function(x: Int, z: Int, ?y: Int, ?w: Int, ?d: Int, ?h: Int, ?options: Table<String, Type>): Table<String, Float> {})
    public function scan(x: Int, z: Int, ?y: Int, ?w: Int, ?d: Int, ?h: Int, ?ignoreReplaceable: Bool): Table<String, Float>;

    /**
        Get some information on a directly adjacent block.
        By default the returned table returns the string ID of the block
        (e.g. minecraft:dirt, metadata, hardness and some more information).

        Note that a single call to this consumes
        the same amount of energy a call to scan does!

        This method can be disabled
        with the misc.allowItemStackInspection setting in the config.
    **/
    @:luaDotMethod
    public function analyze(side: Int, ?options: Table<String, Type>): Table<String, Type>;

    /**
        Stores an item stack representation of the block
        on the specified side of the geolyzer
        to the specified slot of a database component
        with the specified address.

        Do not expect this to work (well) for every block in existence,
        in particular not for mod's blocks that are differentiated
        by NBT data (such as robots).
    **/
    @:luaDotMethod
    public function store(side: Int, dbAddress: String, dbSlot: Int): Bool;
}
