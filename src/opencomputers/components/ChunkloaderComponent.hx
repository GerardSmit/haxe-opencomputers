package opencomputers.components;

/**
    The chunkloader component

    @see http://ocdoc.cil.li/component:chunkloader
**/
extern class ChunkloaderComponent extends Component {

    /**
        Returns whether the chunkloader is currently active.
    **/
    @:luaDotMethod
    public function isActive(): Bool;

    /**
        Enables or disables the chunkloader.
        
        Returns the new state, which may be `false` if no chunk loading ticket could be acquired.
    **/
    @:luaDotMethod
    public function setActive(enabled: Bool): Bool;
}
