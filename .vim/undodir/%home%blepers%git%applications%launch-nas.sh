Vim�UnDo� ר3=���ܞqp<����uR�(��'�.zX���                                      P�u�    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        P�uv    �                %echo "NAS libhugetlb with huge pages"   Ksudo /home/blepers/libhugetlbfs-2.14/obj/hugeadm --pool-pages-min 2MB:15100   Gsudo /home/blepers/libhugetlbfs-2.14/obj/hugeadm --create-global-mounts   export HUGETLB_ELFMAP=RW   export HUGETLB_MORECORE=yes   export HUGETLB_NO_PREFAULT=yes       for f in NAS-libhugetlbfs/*; do   
echo "$f";   name=`basename $f`;  �/usr/bin/time /home/blepers/carrefour/BenchBox/miniprof/miniprof-launch.pl -o /home/blepers/results/$name.2M.loc2 -e READ_CMD_LATENCY 0x1004001E0 0 0 1 -e READ_CMD_NUMBER 0x1004002E0 0 0 1 -e READ_CMD_NUMBER 0x1004004E0 0 0 1 -e READ_CMD_NUMBER 0x1004008E0 0 0 1 sudo env HUGETLB_ELFMAP=RW HUGETLB_MORECORE=yes HUGETLB_NO_PREFAULT=yes /home/blepers/likwid-2.3/likwid-pin $f &> /home/blepers/results/$name.2M.loc2.hwc   v/usr/bin/time /home/blepers/carrefour/BenchBox/miniprof/miniprof-launch.pl -o /home/blepers/results/$name.2M.tlb -e RETIRED_INSTRUCTIONS 0xC0 0 0 0 -e TLB_HIT 0xf45 0 0 0 -e TLB_MISS 0xf46 0 0 0 -e L1_TLB_HIT 0xf4d 0 0 0 sudo env HUGETLB_ELFMAP=RW HUGETLB_MORECORE=yes HUGETLB_NO_PREFAULT=yes /home/blepers/likwid-2.3/likwid-pin $f &> /home/blepers/results/$name.2M.tlb.hwc   V/usr/bin/time /home/blepers/carrefour/BenchBox/miniprof/miniprof-launch.pl -o /home/blepers/results/$name.2M.l1 -e RETIRED_INSTRUCTIONS 0xC0 0 0 0 -e l1_HIT 0x40 0 0 0 -e l1_MISS 0x41 0 0 0 sudo env HUGETLB_ELFMAP=RW HUGETLB_MORECORE=yes HUGETLB_NO_PREFAULT=yes /home/blepers/likwid-2.3/likwid-pin $f &> /home/blepers/results/$name.2M.l1.hwc   @/usr/bin/time /home/blepers/carrefour/BenchBox/miniprof/miniprof-launch.pl -o /home/blepers/results/$name.2M.lat -e LATENCY 0x10040ffe2 0 0 1 -e CMD 0x10040ffe3 0 0 1 sudo env HUGETLB_ELFMAP=RW HUGETLB_MORECORE=yes HUGETLB_NO_PREFAULT=yes /home/blepers/likwid-2.3/likwid-pin $f &> /home/blepers/results/$name.2M.lat.hwc    done5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                  V        P�u�     �               ua.C.x�                �                	#!/bin/sh5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        P�u�     �               ua.C.x5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        P�u�     �                ua.B.x�                sp.C.x�                sp.B.x�                mg.C.x�   
             mg.B.x�   	             lu.C.x�      
          lu.B.x�      	          ft.C.x�                ft.B.x�                cg.C.x�                cg.B.x�                bt.C.x�                bt.B.x5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        P�u�    �                5��