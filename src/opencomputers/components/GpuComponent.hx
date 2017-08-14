package opencomputers.components;

import opencomputers.lua.LuaIndex;

/**
    The gpu component

    @see http://ocdoc.cil.li/component:gpu?s[]=gpu
**/
extern class GpuComponent extends Component {
    /**
        Tries to bind the GPU to a screen with the specified address. 
        Resets the screen's settings if reset is `true`. 
        
        A GPU can only be bound to one screen at a time. 
        If you wish to control multiple screens at once, you'll need to put more than one graphics card into your computer.
        
        Returns true on success, false and an error message on failure. 
    **/
    @:luaDotMethod
    public function bind(address: String, ?reset: Bool): BindResult;

    /**
        Get the address of the screen the GPU is bound to. 
        
        @since 1.3.2
    **/
    @:luaDotMethod
    public function getScreen(): String;

    /**
        Gets the current background color. This background color is applied to all “pixels” that get changed by other operations.

        Note that the returned number is either an RGB value in hexadecimal format, i.e. `0xRRGGBB`, or a palette index. The second returned value indicates which of the two it is (`true` for palette color, `false` for RGB value).
    **/
    @:luaDotMethod
    public function getBackground(): ColorResult;

    /**
        Sets the background color to apply to “pixels” modified by other operations from now on. 
        
        The returned value is the old foreground color, as the actual value it was set to (i.e. not compressed to the color space currently set). 
        The first value is the previous color as an RGB value. 
        If the color was from the palette, the second value will be the index in the palette. Otherwise it will be `null`. 
        
        Note that the color is expected to be specified in hexadecimal RGB format, i.e. `0xRRGGBB`. This is to allow uniform color operations regardless of the color depth supported by the screen and GPU.
    **/
    @:luaDotMethod
    private function setBackground(color: Int, isPaletteColor: Bool): Dynamic;

    /**
        Sets the background color to apply to “pixels” modified by other operations from now on. 
        
        The returned value is the old foreground color, as the actual value it was set to (i.e. not compressed to the color space currently set). 
        The first value is the previous color as an RGB value. 
        If the color was from the palette, the second value will be the index in the palette. Otherwise it will be `null`. 
        
        Note that the color is expected to be specified in hexadecimal RGB format, i.e. `0xRRGGBB`. This is to allow uniform color operations regardless of the color depth supported by the screen and GPU.
    **/
    public inline function setBackgroundColor(color: Int): SetColorResult {
        return setBackground(color, false);
    }

    /**
        Sets the background color to apply to “pixels” modified by other operations from now on. 
        
        The returned value is the old foreground color, as the actual value it was set to (i.e. not compressed to the color space currently set). 
        The first value is the previous color as an RGB value. 
        If the color was from the palette, the second value will be the index in the palette. Otherwise it will be `null`. 
    **/
    public inline function setBackgroundPalette(index: LuaIndex): SetColorResult {
        return setBackground(cast index, true);
    }

    /**
        Gets the current foreground color. This foreground color is applied to all “pixels” that get changed by other operations.

        Note that the returned number is either an RGB value in hexadecimal format, i.e. `0xRRGGBB`, or a palette index. The second returned value indicates which of the two it is (`true` for palette color, `false` for RGB value).
    **/
    @:luaDotMethod
    public function getForeground(): ColorResult;

    /**
        Sets the forground color to apply to “pixels” modified by other operations from now on. 
        
        The returned value is the old foreground color, as the actual value it was set to (i.e. not compressed to the color space currently set). 
        The first value is the previous color as an RGB value. 
        If the color was from the palette, the second value will be the index in the palette. Otherwise it will be `null`. 
        
        Note that the color is expected to be specified in hexadecimal RGB format, i.e. `0xRRGGBB`. This is to allow uniform color operations regardless of the color depth supported by the screen and GPU.
    **/
    @:luaDotMethod
    private function setForeground(color: Int, isPaletteColor: Bool): Dynamic;

    /**
        Sets the forground color to apply to “pixels” modified by other operations from now on. 
        
        The returned value is the old foreground color, as the actual value it was set to (i.e. not compressed to the color space currently set). 
        The first value is the previous color as an RGB value. 
        If the color was from the palette, the second value will be the index in the palette. Otherwise it will be `null`. 
        
        Note that the color is expected to be specified in hexadecimal RGB format, i.e. `0xRRGGBB`. This is to allow uniform color operations regardless of the color depth supported by the screen and GPU.
    **/
    public inline function setForegroundColor(color: Int): SetColorResult {
        return setForeground(color, false);
    }

    /**
        Sets the forground color to apply to “pixels” modified by other operations from now on. 
        
        The returned value is the old foreground color, as the actual value it was set to (i.e. not compressed to the color space currently set). 
        The first value is the previous color as an RGB value. 
        If the color was from the palette, the second value will be the index in the palette. Otherwise it will be `null`. 
    **/
    public inline function setForegroundPalette(index: LuaIndex): SetColorResult {
        return setForeground(cast index, true);
    }

    /**
        Gets the RGB value of the color in the palette at the specified index.
    **/
    @:luaDotMethod
    public function getPaletteColor(index: LuaIndex): Int;

    /**
        Sets the RGB value of the color in the palette at the specified index.
    **/
    @:luaDotMethod
    public function setPaletteColor(index: LuaIndex, color: Int): Int;

    /**
        Gets the maximum supported color depth supported by the GPU and the screen it is bound to (minimum of the two).
    **/
    @:luaDotMethod
    public function maxDepth(): Int;

    /**
        The currently set color depth of the GPU/screen, in bits. Can be 1, 4 or 8.
    **/
    @:luaDotMethod
    public function getDepth(): Int;

    /**
        Sets the color depth to use. Can be up to the maximum supported color depth.
        
        If a larger or invalid value is provided it will throw an error. Returns true if the depth was set, false otherwise.
    **/
    @:luaDotMethod
    public function setDepth(depth: Int): Bool;

    /**
        Gets the maximum resolution supported by the GPU and the screen it is bound to (minimum of the two).
    **/
    @:luaDotMethod
    public function maxResolution(): ResolutionResult;

    /**
        Gets the currently set resolution.
    **/
    @:luaDotMethod
    public function getResolution(): ResolutionResult;

    /**
        Sets the specified resolution.
        
        Can be up to the maximum supported resolution. If a larger or invalid resolution is provided it will throw an error. 
        
        Returns `true` if the resolution was set, `false` otherwise.
    **/
    @:luaDotMethod
    public function setResolution(width: Int, height: Int): Bool;

    /**
        Gets the character currently being displayed at the specified coordinates.
        
        The second and third returned values are the fore- and background color, as hexvalues.
        If the colors are from the palette, the fourth and fifth values specify the palette index of the color, otherwise they are nil.
    **/
    @:luaDotMethod
    public function get(x: LuaIndex, y: LuaIndex): GetResult;

    /**
        Writes a string to the screen, starting at the specified coordinates. 
        
        The string will be copied to the screen's buffer directly, in a single row. 
        This means even if the specified string contains line breaks, these will just be printed as special characters, the string will not be displayed over multiple lines. 
        
        The optional fourth argument makes the specified text get printed vertically instead, if true.

        Returns `true` if the string was set to the buffer, `false` otherwise.
    **/
    @:luaDotMethod
    public function set(x: LuaIndex, y: LuaIndex, value: String, ?vertical: Bool): Bool;

    /**
        Copies a portion of the screens buffer to another location.
        
        The source rectangle is specified by the `x`, `y`, `width` and `height` parameters.
        The target rectangle is defined by `x + tx`, `y + ty`, `width` and `height`.
        
        Returns `true` on success, `false` otherwise.
    **/
    @:luaDotMethod
    public function copy(x: LuaIndex, y: LuaIndex, width: Int, height: Int, tx: Int, ty: Int): Bool;

    /**
        Fills a rectangle in the screen buffer with the specified character. 
        
        The target rectangle is specified by the `x` and `y` coordinates and the rectangle's `width` and `height`. 
        The fill character `char` must be a string of length one, i.e. a single character.
        
        Note that filling screens with spaces (` `) is usually less expensive, i.e. consumes less energy, because it is considered a “clear” operation (see config).
        
        Returns `true` on success, `false` otherwise.
    **/
    @:luaDotMethod
    public function fill(x: LuaIndex, y: LuaIndex, width: Int, height: Int, char: String): Bool;
}

/**
    The bind result of GpuComponent.bind
**/
@:multiReturn
extern class BindResult {
    /**
        True if the bind is successful.
    **/
    var success : Bool;
    
    /**
        The error if succes is false
    **/
    var error: String;
}

/**
    The color result of GpuComponent.getBackground and GpuComponent.getForeground
**/
@:multiReturn
extern class ColorResult {
    /**
        The color code or a palette index depending on `isPaletteColor`.
    **/
    var code : Int;

    /**
        True if the code is the palette index instead of the RGB color.
    **/
    var isPaletteColor: Bool;
}

/**
    The color result of GpuComponent.setBackground and GpuComponent.setForeground
**/
@:multiReturn
extern class SetColorResult {
    /**
        The old color.
    **/
    var code : Int;

    /**
        The palette index if set, otherwise `null`.
    **/
    var paletteIndex: Null<Int>;
}

/**
    The bind result of GpuComponent.bind
**/
@:multiReturn
extern class ResolutionResult {
    /**
        The width of the resolution.
    **/
    var width : Int;
    
    /**
        The height of the resolution.
    **/
    var height : Int;
}

/**
    The bind result of GpuComponent.get
**/
@:multiReturn
extern class GetResult {
    /**
        The character.
    **/
    var character : String;

    /**
        The foreground color.
    **/
    var foregroundColor: Int;

    /**
        The background color.
    **/
    var backgroundColor: Int;

    /**
        The foreground palette index.
    **/
    var foregroundPaletteIndex: Null<Int>;

    /**
        The background palette index.
    **/
    var backgroundPaletteIndex: Null<Int>;
}