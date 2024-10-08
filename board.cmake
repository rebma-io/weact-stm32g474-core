#
# Copyright (c) 2024 Christopher Petrilli
#
# SPDX-License-Identifier: MIT

board_runner_args(dfu-util "--pid=0483:df11" "--alt=0" "--dfuse")

include(${ZEPHYR_BASE}/boards/common/dfu-util.board.cmake)
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/blackmagicprobe.board.cmake)