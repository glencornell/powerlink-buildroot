#!/bin/bash

BOOT_TYPE=efi
BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOOT_TYPE}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage                           \
       --rootpath "${TARGET_DIR}"     \
       --tmppath "${GENIMAGE_TMP}"    \
       --inputpath "${BINARIES_DIR}"  \
       --outputpath "${BINARIES_DIR}" \
       --config "${GENIMAGE_CFG}"
status=$?
if [ $status -ne 0 ]
then
    echo "Error: genimage" >&2
    exit $status
fi

# create the swupdate image:
CONTAINER_VER="1.0"
PRODUCT_NAME="pc_x86_64-rt"
FILES="sw-description disk.img"
rm -f ${BINARIES_DIR}/sw-description
rm -f ${BINARIES_DIR}/${PRODUCT_NAME}_${CONTAINER_VER}.swu
cp ${BOARD_DIR}/sw-description ${BINARIES_DIR}
pushd ${BINARIES_DIR}
for i in $FILES;do
	echo $i;done | cpio -ov -H crc >  ${PRODUCT_NAME}_${CONTAINER_VER}.swu
popd

exit $?
