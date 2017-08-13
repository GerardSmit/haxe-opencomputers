package opencomputers.component;

import opencomputers.component.components.*;
import haxe.extern.EitherType;

typedef Components = EitherType<ScreenComponent, EitherType<GpuComponent, ChunkloaderComponent>>;
