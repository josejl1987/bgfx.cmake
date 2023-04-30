# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

include( CMakeParseArguments )

add_library(brtshaderc 
	STATIC
	${BGFX_DIR}/tools/shaderc/shaderc.h 
	${BGFX_DIR}/tools/brtshaderc/brtshaderc.cpp
	${BGFX_DIR}/tools/brtshaderc/brtshaderc.h 
)


target_include_directories(
	brtshaderc
	PRIVATE
		"bgfx/include"
	PUBLIC
		"bgfx/tools/brtshaderc/"
		"bgfx/tools/shaderc/"
		"bgfx/3rdparty/webgpu/include/"
		"bgfx/3rdparty/dxsdk/include/"
)

install(FILES 	${BGFX_DIR}/tools/brtshaderc/brtshaderc.h  DESTINATION include)

target_link_libraries (brtshaderc 
	PRIVATE bx
			bgfx
			bimg
	PUBLIC
			bgfx-vertexlayout
			fcpp
			glslang
			glsl-optimizer
			spirv-opt
			spirv-cross
			webgpu
)

if(BGFX_INSTALL)
	install(
		TARGETS brtshaderc 			
		bgfx-vertexlayout
			fcpp
			glslang
			glsl-optimizer
			spirv-opt
			webgpu
		LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
		INCLUDES  DESTINATION include
	)
endif()