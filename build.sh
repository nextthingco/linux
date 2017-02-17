#!/bin/bash

make -j$(( 2 * $(nproc) )) multi_v7_defconfig
make -j$(( 2 * $(nproc) )) deb-pkg
mv ../*.deb ../*.gz ../*.dsc  ../*.changes artifacts/deb/
make -j$(( 2 * $(nproc) )) INSTALL_PATH=/build/artifacts/boot install
make -j$(( 2 * $(nproc) )) INSTALL_MOD_PATH=/build/artifacts modules_install
make -j$(( 2 * $(nproc) )) INSTALL_HDR_PATH=/build/artifacts/usr headers_install
make -j$(( 2 * $(nproc) )) INSTALL_FW_PATH=/build/artifacts/lib/firmware firmware_install
cp arch/arm/boot/dts/*.dtb artifacts/boot/dtbs/
