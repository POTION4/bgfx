bgfx
====

https://github.com/bkaradzic/bgfx

What is it?
-----------

Cross-platform rendering library ([API](https://github.com/bkaradzic/bgfx/blob/master/include/bgfx.h)).

Supported rendering backends:

 * OpenGL 2.1
 * OpenGL 3.1
 * OpenGL ES 2
 * OpenGL ES 3
 * Direct3D 9
 * Direct3D 11

Platforms:

 * Android
 * iOS
 * Linux
 * Native Client
 * OSX
 * Windows

Who is using it?
----------------

http://airmech.com/ AirMech is a free-to-play futuristic action real-time
strategy video game developed and published by Carbon Games.

http://theengine.co/ Loom Game Engine developed by The Engine Company. Loom
is a powerful 2D game engine with live reloading of code and assets, a friendly
scripting language, and an efficient command-line workflow. Here is video where
they explain why they choose bgfx over alternatives:  
<a href="http://www.youtube.com/watch?feature=player_embedded&v=PHY_XHkMGIM&t=1m53s" target="_blank"><img src="http://img.youtube.com/vi/PHY_XHkMGIM/0.jpg" alt="Why did you choose bgfx?" width="240" height="180" border="10" /></a>

Dependencies
------------

[https://github.com/bkaradzic/bx](https://github.com/bkaradzic/bx)

Optional:  
[https://github.com/mendsley/tinystl](https://github.com/mendsley/tinystl)

Building
--------

### Prerequisites

Premake 4.4 beta4  
[http://industriousone.com/premake/download](http://industriousone.com/premake/download)

GNU make and CoreUtils  
Windows users download GNU utilities from:  
[http://gnuwin32.sourceforge.net/packages/make.htm](http://gnuwin32.sourceforge.net/packages/make.htm)  
[http://gnuwin32.sourceforge.net/packages/coreutils.htm](http://gnuwin32.sourceforge.net/packages/coreutils.htm)

### Getting source

	git clone git://github.com/bkaradzic/bx.git
	git clone git://github.com/bkaradzic/bgfx.git
	cd bgfx
	make

After calling `make`, .build/projects/* directory will be generated. All
intermediate files generated by compiler will be inside .build directory
structure. Deleting .build directory at any time is safe.

### Prerequisites for Android

Download AndroidNDK from:  
[https://developer.android.com/tools/sdk/ndk/index.html](https://developer.android.com/tools/sdk/ndk/index.html)

	setx ANDROID_NDK_ROOT <path to AndroidNDK directory>
	setx ANDROID_NDK_ARM <path to AndroidNDK directory>\toolchains\arm-linux-androideabi-4.7\prebuilt\windows-x86_64

### Prerequisites for Linux

	sudo apt-get install libgl1-mesa-dev

### Prerequisites for Native Client on Windows

Download Native Client SDK from:  
[https://developers.google.com/native-client/sdk/download](https://developers.google.com/native-client/sdk/download)

	setx NACL_SDK_ROOT <path to Native Client SDK directory>

### Prerequisites for Windows

When building on Windows, you have to set DXSDK_DIR environment variable to
point to DirectX SDK directory.

	setx DXSDK_DIR <path to DirectX SDK directory>

If you're building with Visual Studio 2008, you'll need TR1 support from:  
[Visual C++ 2008 Feature Pack Release](https://www.microsoft.com/en-us/download/details.aspx?id=6922)

If you're building with MinGW/TDM compiler on Windows make DirectX SDK
directory link to directory without spaces in the path.

	mklink /D c:\dxsdk <path to DirectX SDK directory>
	setx DXSDK_DIR c:\dxsdk

Apply this [patch](https://github.com/bkaradzic/bx/blob/master/include/compat/mingw/dxsdk.patch)
to DXSDK from June 2010 to be able to use it with MinGW/TDM.

### Building

Visual Studio 2008 command line:

	make vs2008-release64

Visual Studio 2008 IDE:

	start .build/projects/vs2008/bgfx.sln

Linux 64-bit:

	make linux-release64

Other platforms:

	make <configuration>

Configuration is `<platform>-<debug/release>[32/64]`. For example:

	linux-release32, nacl-debug64, nacl-arm-debug, pnacl-release, 
	android-release, etc.

Examples
--------

Most of the examples require shader/texture/mesh data to be loaded. When running
examples your current directory should be examples/runtime.

	<bgfx_path>/examples/runtime $ ../../.build/<config>/bin/example-00-helloworldDebug

### 00-helloworld
Initialization and debug text.

### 01-cubes
Rendering simple static mesh.

![example-01-cubes](https://github.com/bkaradzic/bgfx/raw/master/examples/01-cubes/screenshot.png)

### 02-metaballs
Rendering with transient buffers and embedding shaders.

![example-02-metaballs](https://github.com/bkaradzic/bgfx/raw/master/examples/02-metaballs/screenshot.png)

### 03-raymarch
Updating shader uniforms.

![example-03-raymarch](https://github.com/bkaradzic/bgfx/raw/master/examples/03-raymarch/screenshot.png)

### 04-mesh
Loading meshes.

![example-04-mesh](https://github.com/bkaradzic/bgfx/raw/master/examples/04-mesh/screenshot.png)

### 05-instancing
Geometry instancing.

![example-05-instancing](https://github.com/bkaradzic/bgfx/raw/master/examples/05-instancing/screenshot.png)

### 06-bump
Loading textures.

![example-06-bump](https://github.com/bkaradzic/bgfx/raw/master/examples/06-bump/screenshot.png)

### 07-callback
Implementing application specific callbacks for taking screen shots, caching
OpenGL binary shaders, and video capture.

### 08-update
Updating textures.

### 09-hdr
Using multiple views and render targets.

![example-09-hdr](https://github.com/bkaradzic/bgfx/raw/master/examples/09-hdr/screenshot.png)

### 10-font
Use the font system to display text and styled text.

![example-10-font](https://github.com/bkaradzic/bgfx/raw/master/examples/10-font/screenshot.png)

### 11-fontsdf
Use a single distance field font to render text of various size.

![example-11-fontsdf](https://github.com/bkaradzic/bgfx/raw/master/examples/11-fontsdf/screenshot.png)

Internals
---------

bgfx is using sort-based draw call bucketing. This means that submission order
doesn't necessarily match the rendering order, but on the low-level they
will be sorted and ordered correctly. On the high level this allows
more optimal way of submitting draw calls for all passes at one place, and on
the low-level this allows better optimization of rendering order. This sometimes
creates undesired results usually for GUI rendering, where draw order should
usually match submit order. bgfx provides way to enable sequential rendering for
these cases (see `bgfx::setViewSeq`).

Internally all low-level rendering draw calls are issued inside single function
`Context::rendererSubmit`. This function exist inside each renderer backend
implementation.

More detailed description of sort-based draw call bucketing can be found at:  
[Order your graphics draw calls around!](http://realtimecollisiondetection.net/blog/?p=86)

Customization
-------------

By default each platform has sane default values. For example on Windows default
renderer is DirectX9, and on Linux it is OpenGL 2.1. On Windows platform all
rendering backends are available. For OpenGL ES on desktop you can find more 
information at:- 
[OpenGL ES 2.0 and EGL on desktop](http://www.g-truc.net/post-0457.html)  

If you're targeting specific mobile hardware, you can find GLES support in their
official SDKs:
[Adreno SDK](http://developer.qualcomm.com/mobile-development/mobile-technologies/gaming-graphics-optimization-adreno/tools-and-resources),
[Mali SDK](http://www.malideveloper.com/),
[PowerVR SDK](http://www.imgtec.com/powervr/insider/sdkdownloads/).

All configuration settings are located inside [src/config.h](https://github.com/bkaradzic/bgfx/blob/master/src/config.h).

Every `BGFX_CONFIG_*` setting can be changed by passing defines thru compiler
switches. For example setting preprocessor define `BGFX_CONFIG_RENDERER_OPENGL=1`
on Windows will change backend renderer to OpenGL 2.1. on Windows. Since
rendering APIs are platform specific, this obviously won't work nor make sense
in all cases. Certain platforms have only single choice, for example the Native
Client works only with OpenGL ES 2.0 renderer, using anything other than that
will result in build errors.

Tools
-----

### Shader Compiler (shaderc)

bgfx cross-platform shader language is based on GLSL syntax. It's uses ANSI C
preprocessor to transform GLSL like language syntax into HLSL. This technique
has certain drawbacks, but overall it's simple and allows quick authoring of
cross-platform shaders.

### Texture Compiler (texturec)

This tool doesn't currently exist. Use nvdxt, or any other tool that produces
DDS textures for now.

### Geometry Compiler (geometryc)

Converts Wavefront .obj mesh file to format optimal for using with bgfx.

Todo
----

 - Multiple render targets.
 - BlendFuncSeparate and BlendEquationSeparate.
 - Blit between textures.
 - Occlusion queries.
 - DX11: MSAA.
 - Fullscreen mode.
 - GL/DX11: Add support for ARB_depth_clamp, DepthBiasClamp.

Contact
-------

[@bkaradzic](https://twitter.com/bkaradzic)  
http://www.stuckingeometry.com

Project page  
https://github.com/bkaradzic/bgfx

3rd Party Libraries
-------------------

All required 3rd party libraries are included in bgfx repository in [3rdparty/](https://github.com/bkaradzic/bgfx/tree/master/3rdparty)
directory.

### edtaa3 (MIT)

Contour Rendering by Distance Fields

https://github.com/OpenGLInsights/OpenGLInsightsCode/tree/master/Chapter%2012%202D%20Shape%20Rendering%20by%20Distance%20Fields

### fcpp (BSD)

Frexx C preprocessor

https://github.com/bagder/fcpp

### Forsyth Triangle Order Optimizer (Public Domain)

http://gameangst.com/?p=9

### FreeType

http://www.freetype.org/

### glsl-optimizer (MIT)

GLSL optimizer based on Mesa's GLSL compiler. Used in Unity for mobile shader
optimization.

https://github.com/aras-p/glsl-optimizer

### stb_image (Public Domain)

http://nothings.org/stb_image.c

Assets
------

Bunny  
[Stanford University Computer Graphics Laboratory](http://www-graphics.stanford.edu/data/3Dscanrep/)

Uffizi  
[Light Probe Image Gallery ](http://www.pauldebevec.com/Probes/)

Droid Sans Font  
http://www.fontsquirrel.com/license/Droid-Sans

Bleeding Cowboys Font  
http://www.dafont.com/bleeding-cowboys.font

Cheap Fire Font  
http://www.dafont.com/cheap-fire.font

Five Minutes Font  
http://www.fonts2u.com/fiveminutes.font

Mias Scribblings Font  
http://www.dafont.com/mias-scribblings.font

Ruritania Font  
http://www.dafont.com/ruritania.font

Signika Font  
http://fontfabric.com/signika-font/

Visitor Font  
http://www.dafont.com/visitor.font

Special-Elite Font
http://www.fontspace.com/astigmatic-one-eye-typographic-institute/special-elite

Sherlock Holmes text
http://www.gutenberg.org/ebooks/1661

Tree Pack 1  
http://www.turbosquid.com/3d-models/free-obj-mode-tree-pack/506851

Contributors
------------

Garett Bass ([@gtbass](https://github.com/gtbass)) - OSX port.  
Jeremie Roy ([@jeremieroy](https://github.com/jeremieroy)) - Font system and examples.  
Milos Tosic ([@milostosic](https://github.com/milostosic)) - LOD example.

License (BSD 2-clause)
----------------------

Copyright 2010-2013 Branimir Karadzic. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
EVENT SHALL COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
