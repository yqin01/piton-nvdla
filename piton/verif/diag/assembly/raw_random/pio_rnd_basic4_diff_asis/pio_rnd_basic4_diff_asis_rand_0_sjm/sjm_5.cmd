# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: sjm_5.cmd
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================
CONFIG id=30 iosyncadr=0x7EF00BEEF00
TIMEOUT 10000000
IOSYNC
#==================================================
#==================================================


LABEL_0:

WRITEBLK  0x000000176b0b9fc0 +
        0x0234b63e 0xb04408a3 0x2e487302 0xea1dc93c +
        0x833a85fd 0xa3267517 0x3605ad37 0xb712b8ac +
        0x8c3de1da 0x3c47b783 0x8cf016ec 0x307a0621 +
        0x30c57b77 0x5181472c 0x67d3f0ba 0xa136568a 

WRITEBLKIO  0x0000061c41f59c40 +
        0x83603bb3 0x30908194 0x94331675 0x34a792a1 +
        0x8891f94e 0x618d76cf 0x3af455a2 0x4a9ef0ed +
        0x19b8767f 0x1759a413 0x422d099f 0x4ae99574 +
        0x9ca36992 0x4631052c 0x2a3b3bf2 0x60f97a24 

READBLKIO  0x0000061c41f59c40 +
        0x83603bb3 0x30908194 0x94331675 0x34a792a1 +
        0x8891f94e 0x618d76cf 0x3af455a2 0x4a9ef0ed +
        0x19b8767f 0x1759a413 0x422d099f 0x4ae99574 +
        0x9ca36992 0x4631052c 0x2a3b3bf2 0x60f97a24 

WRITEBLK  0x0000001523fe3580 +
        0x8cddcdc8 0x56f008eb 0xf28ac4d8 0x6f1f73fd +
        0x149ea9b9 0xce944d2d 0x19362081 0x02d0739f +
        0xd7f2e165 0x063eb815 0x46a3f8ae 0xe0297eae +
        0x125fa68b 0xbd122141 0x6483b7b5 0x4cfa3331 

READBLK  0x000000176b0b9fc0 +
        0x0234b63e 0xb04408a3 0x2e487302 0xea1dc93c +
        0x833a85fd 0xa3267517 0x3605ad37 0xb712b8ac +
        0x8c3de1da 0x3c47b783 0x8cf016ec 0x307a0621 +
        0x30c57b77 0x5181472c 0x67d3f0ba 0xa136568a 

READBLK  0x0000001523fe3580 +
        0x8cddcdc8 0x56f008eb 0xf28ac4d8 0x6f1f73fd +
        0x149ea9b9 0xce944d2d 0x19362081 0x02d0739f +
        0xd7f2e165 0x063eb815 0x46a3f8ae 0xe0297eae +
        0x125fa68b 0xbd122141 0x6483b7b5 0x4cfa3331 

WRITEBLKIO  0x00000617bd4e2500 +
        0xe8b25877 0x21e39bef 0xeab2cec2 0x4066bdc0 +
        0x9e9ebc38 0x7a68be29 0x4c267ce9 0xc3a8ece5 +
        0x5d893bf9 0xeaf6f0e4 0x152b7b66 0xf7b7242d +
        0x7b41e203 0x8b8d0717 0x0f55362d 0xfdc31055 

READBLKIO  0x00000617bd4e2500 +
        0xe8b25877 0x21e39bef 0xeab2cec2 0x4066bdc0 +
        0x9e9ebc38 0x7a68be29 0x4c267ce9 0xc3a8ece5 +
        0x5d893bf9 0xeaf6f0e4 0x152b7b66 0xf7b7242d +
        0x7b41e203 0x8b8d0717 0x0f55362d 0xfdc31055 

WRITEBLKIO  0x0000061817bf6600 +
        0x2880bef0 0xa21d7485 0x98b88eda 0x8efafcf9 +
        0x43a6e546 0x69d71c04 0x43abcbbc 0x253b4877 +
        0xed13317a 0xf86a56dc 0x0af60497 0x9a5923c5 +
        0x7bc35bb0 0xa2702cc9 0x99fcb2fd 0x1ffae0d4 

READBLKIO  0x0000061817bf6600 +
        0x2880bef0 0xa21d7485 0x98b88eda 0x8efafcf9 +
        0x43a6e546 0x69d71c04 0x43abcbbc 0x253b4877 +
        0xed13317a 0xf86a56dc 0x0af60497 0x9a5923c5 +
        0x7bc35bb0 0xa2702cc9 0x99fcb2fd 0x1ffae0d4 

WRITEBLK  0x00000001b89c3200 +
        0xde4321a7 0xe1fec7c1 0x291be131 0x60ec1252 +
        0x9a64a09e 0x79e80e8d 0x704f22b3 0x9f8ab199 +
        0xefa04578 0x61ed8847 0xf927691a 0x25de7a7f +
        0xa621de23 0xda1d8863 0xd4a4ad71 0x6fa2519f 

READBLK  0x00000001b89c3200 +
        0xde4321a7 0xe1fec7c1 0x291be131 0x60ec1252 +
        0x9a64a09e 0x79e80e8d 0x704f22b3 0x9f8ab199 +
        0xefa04578 0x61ed8847 0xf927691a 0x25de7a7f +
        0xa621de23 0xda1d8863 0xd4a4ad71 0x6fa2519f 

WRITEBLKIO  0x0000060998424380 +
        0xd2128d46 0xbc0e4c97 0xfefc6498 0x4a693e5d +
        0x2944474f 0x5c7fea4c 0xf26f9913 0x1eb4df2b +
        0x8461fef9 0x8a4a5320 0x69d71d47 0x38526e03 +
        0xdd407877 0x853839da 0x607f58cf 0xc57e5520 

READBLKIO  0x0000060998424380 +
        0xd2128d46 0xbc0e4c97 0xfefc6498 0x4a693e5d +
        0x2944474f 0x5c7fea4c 0xf26f9913 0x1eb4df2b +
        0x8461fef9 0x8a4a5320 0x69d71d47 0x38526e03 +
        0xdd407877 0x853839da 0x607f58cf 0xc57e5520 


BA LABEL_0