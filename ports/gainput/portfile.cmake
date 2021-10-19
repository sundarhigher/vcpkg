vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sundarhigher/gainput
    REF v1.0.1
    SHA512 353a8ddf5ca8a17d94fd9fc401cb6330bf702e4fc52552b2bd0e59462ec22b53fbb1ce85145010c60688ad7de63d71ef0a8a3d94e6cd8f8b33e46b66bf83ddd8
    HEAD_REF master
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    set(GAINPUT_BUILD_SHARED OFF)
    set(GAINPUT_BUILD_STATIC ON)
else()
    set(GAINPUT_BUILD_SHARED ON)
    set(GAINPUT_BUILD_STATIC OFF)
endif()
if(APPLE)
    set(GAINPUT_BUILD_SHARED ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DGAINPUT_BUILD_SHARED=${GAINPUT_BUILD_SHARED}
        -DGAINPUT_BUILD_STATIC=${GAINPUT_BUILD_STATIC}
        -DGAINPUT_TESTS=OFF
        -DGAINPUT_SAMPLES=OFF
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/unofficial-gainput TARGET_PATH share/unofficial-gainput)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)