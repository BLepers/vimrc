Vim�UnDo� �q�тة%RU�4��K)���혩��)��   E   P   print "\t".($results{$f_2M}->{l1}->{avail_info}->[1]->{results}->{ALL}//'-');   C         
       
   
   
    P��'    _�                            ����                                                                                                                                                                                                                                                                                                                                                             P��     �         E         } elsif($f =~ m/tlb3/) {5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             P�̅     �      !   E         } elsif($f =~ m/l12/) {5�_�                       ?    ����                                                                                                                                                                                                                                                                                                                                                             P�̉    �         E      W   my $basename = $f; $basename =~ s/(.loc|.lat|.tlbl1|.tlb|.l12|.tlb2|.tlb3|.loc2)$//;5�_�                    .       ����                                                                                                                                                                                                                                                                                                                                                             P��      �   -   /   E      e   print "\t".$results{$f_2M}->{loc}->{avail_info}->[1]->{results}->{GLOBAL}->{'local access ratio'};5�_�                    0       ����                                                                                                                                                                                                                                                                                                                                                             P��!     �   /   1   E      t   print "\t".$results{$f_2M}->{loc}->{avail_info}->[1]->{results}->{GLOBAL}->{'% of accesses to most loaded node'};5�_�                    3       ����                                                                                                                                                                                                                                                                                                                                                             P��"     �   2   4   E      J   print "\t".$results{$f_2M}->{lat}->{avail_info}->[0]->{results}->{ALL};5�_�                    7       ����                                                                                                                                                                                                                                                                                                                                                             P��#     �   6   8   E      N   print "\t".(1-$results{$f_2M}->{tlb}->{avail_info}->[0]->{results}->{ALL});5�_�      	              ;       ����                                                                                                                                                                                                                                                                                                                                                             P��$     �   :   <   E      L   print "\t".($results{$f_2M}->{tlb}->{avail_info}->[1]->{results}->{ALL});5�_�      
           	   ?       ����                                                                                                                                                                                                                                                                                                                                                             P��%     �   >   @   E      P   print "\t".($results{$f_2M}->{l1}->{avail_info}->[0]->{results}->{ALL}//'-');5�_�   	               
   C       ����                                                                                                                                                                                                                                                                                                                                                             P��&    �   B   D   E      P   print "\t".($results{$f_2M}->{l1}->{avail_info}->[1]->{results}->{ALL}//'-');5��