package opencomputers.components;

/**
    The Crafting component

    @see http://ocdoc.cil.li/component:crafting
**/

extern class CraftingComponent extends Component {

    /**
    Crafts up to `count` numbers or a full stack.

    If omitted then the robot will craft as many items as possible.
    robot will never craft more than one full stack at once.

    true if at least one item was crafted, false otherwise.

    Note that if `count` lower than the minimum resulting stack size
    (i.E. order to craft 1 stick, but minimum result stack size is 4),
    then nothing will be crafted, however this will still return true.
    **/
    @luaDotMethod
    public function craft(?count: Int): Bool;

}
