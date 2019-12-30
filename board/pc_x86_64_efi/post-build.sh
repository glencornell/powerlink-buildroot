#!/bin/sh

set -e

BOARD_DIR=$(dirname "$0")

# EFI boot strategy
cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
