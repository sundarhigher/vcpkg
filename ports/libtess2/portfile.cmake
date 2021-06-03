vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sundarhigher/libtess2
    REF v1.0.0
    SHA512 8290419dc4cae208ead4e58a5c112b2bc1a1e1f3c185993b1ec9cb6344f269e38547c15683682253963faf3cb9e618b30f58bf7bc82575836c31b1cfb3a76c65
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

#vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/libtess2 TARGET_PATH share/libtess2)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

# Moves all .cmake files from /debug/share/lodepng/ to /share/lodepng/
vcpkg_fixup_cmake_targets()

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)