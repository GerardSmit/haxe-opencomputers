package opencomputers.components;

import haxe.extern.EitherType;

typedef Components =    EitherType<ScreenComponent,
                        EitherType<GpuComponent,
                        EitherType<GeolyzerComponent,
                        ChunkloaderComponent>>>;
