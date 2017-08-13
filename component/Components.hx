package oc.component;

import oc.component.components.*;
import haxe.extern.EitherType;

typedef Components = EitherType<ScreenComponent, GpuComponent, ChunkloaderComponen>;