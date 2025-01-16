set(VCPKG_BUILD_TYPE release) # header-only
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kenba/via-httplib
    REF ${VERSION}
    SHA512 9b91d27a5c1b4389beda27c80263792695b99cc6e6af46271da081e7f56d3b047ed5ff4b55cadfca3bb0e91ca285321f58c9bb685a62b8da5edc66b2e089c0c8
    HEAD_REF master    
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME ViaHttpLib CONFIG_PATH lib/cmake/ViaHttpLib)

vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/ViaHttpLib/ViaHttpLibConfig.cmake"
"find_dependency(Boost 1.51)"
[[find_dependency(Boost COMPONENTS system)]])

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE_1_0.txt")
