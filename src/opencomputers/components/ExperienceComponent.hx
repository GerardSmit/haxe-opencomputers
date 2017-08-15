package opencomputers.components;

import lua.Table;
import opencomputers.lua.LuaIndex;

/**
    The experience componet

    @see http://ocdoc.cil.li/component:experience
**/

extern class ExperienceComponent extends Component {

    /**
        Gets the level of experience stored in the experience upgrade.
    **/
    @:luaDotMethod
    public function level(): Float;
}
