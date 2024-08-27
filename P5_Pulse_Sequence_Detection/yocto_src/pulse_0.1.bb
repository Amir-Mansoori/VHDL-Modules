SUMMARY = " pulse signal generation"
DESCRIPTION = "Custom recipe to build pulse.c application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# Where to find source files (can be local, Github, etc.)
SRC_URI = "file://src"

# Where to keep downloaded source files (in tmp/work/...)
S = "${WORKDIR}/src"

# Adding the gpiod.h library
DEPENDS = "libgpiod"

#pass arguments to linker
LDFLAGS := "-lgpiod"
TARGET_CC_ARCH += "${LDFLAGS}"

# Cross-compile source code
do_compile() {
 ${CC} -o pulse pulse.c
}

#Create /usr/bin in rootfs and copy program to it
do_install() {
 install -d ${D}${bindir}
 install -m 0755 pulse ${D}${bindir}
}
