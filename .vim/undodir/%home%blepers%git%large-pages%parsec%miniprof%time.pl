Vim�UnDo� @�?
��O�5�X4�Q�"S�^Oɤf{Z�$&�^   &      next if($f =~ m/loc/);                             P��    _�                            ����                                                                                                                                                                                                                                                                                                                                                             P��)     �         D         next if($f =~ m/is.|hwc$/);5�_�                            ����                                                                                                                                                                                                                                                                                                                               '       !   (       V   (    P��5     �                (   my $file = File::CachedFile::new($f);   W   #my $result = $file->miniprof_parse( miniprof_mintime => 1, miniprof_maxtime => 1 );      if($f =~ m/loc2/) {   ;      $results{$basename}->{loc} = $file->miniprof_parse();      } elsif($f =~ m/loc/) {   <      #$results{$basename}->{loc} = $file->miniprof_parse();      } elsif($f =~ m/lat/) {   ;      $results{$basename}->{lat} = $file->miniprof_parse();      } elsif($f =~ m/tlbl1/) {   >      #$results{$basename}->{tlbl1} = $file->miniprof_parse();      } elsif($f =~ m/tlb2/) {   <      #$results{$basename}->{tlb} = $file->miniprof_parse();      } elsif($f =~ m/tlb3/) {   ;      $results{$basename}->{tlb} = $file->miniprof_parse();      } elsif($f =~ m/tlb/) {   <      #$results{$basename}->{tlb} = $file->miniprof_parse();      } elsif($f =~ m/l12/) {   :      $results{$basename}->{l1} = $file->miniprof_parse();5�_�                       W    ����                                                                                                                                                                                                                                                                                                                               '          (       V   (    P��6     �         2      W   my $basename = $f; $basename =~ s/(.loc|.lat|.tlbl1|.tlb|.l12|.tlb2|.tlb3|.loc2)$//;5�_�                           ����                                                                                                                                                                                                                                                                                                                               '          (       V   (    P�۳     �                Vprint "Bench\tLocalAR\ttLocalAR\tLat\tLat\tL1M\tL1M\tTLBM\tTLBM\tMostLoaded%\tIdem\n";5�_�                    !       ����                                                                                                                                                                                                                                                                                                                            !          5   P       v   T    P�۹     �       "   7      q   print "\t".$results{$f}->{loc}->{avail_info}->[1]->{results}->{GLOBAL}->{'% of accesses to most loaded node'};   t   print "\t".$results{$f_2M}->{loc}->{avail_info}->[1]->{results}->{GLOBAL}->{'% of accesses to most loaded node'};       P   print "\t".$results{$f}->{lat}->{avail_info}->[0]->{results}->{ALL}; #Latency   J   print "\t".$results{$f_2M}->{lat}->{avail_info}->[0]->{results}->{ALL};       �   die("L2TLB_HIT_RATIO found ".Dumper($results{$f}->{tlb})) if($results{$f}->{tlb}->{avail_info}->[0]->{name} ne "L2TLB_HIT_RATIO");   k   print "\t".(1-$results{$f}->{tlb}->{avail_info}->[0]->{results}->{ALL}); #1 - TLB hit ratio = miss ratio   N   print "\t".(1-$results{$f_2M}->{tlb}->{avail_info}->[0]->{results}->{ALL});       T   die if($results{$f}->{tlb}->{avail_info}->[1]->{name} ne "L1TLB_MISS_PER_INSTR");   I   print "\t".($results{$f}->{tlb}->{avail_info}->[1]->{results}->{ALL});   L   print "\t".($results{$f_2M}->{tlb}->{avail_info}->[1]->{results}->{ALL});       G   die if($results{$f}->{l1}->{avail_info}->[0]->{name} ne "L1_RATIO");   Z   print "\t".($results{$f}->{l1}->{avail_info}->[0]->{results}->{ALL}//'-'); # Miss ratio   P   print "\t".($results{$f_2M}->{l1}->{avail_info}->[0]->{results}->{ALL}//'-');       L   die if($results{$f}->{l1}->{avail_info}->[1]->{name} ne "L1_MISS_INST2");   Y   print "\t".($results{$f}->{l1}->{avail_info}->[1]->{results}->{ALL}//'-'); #Miss/instr   P   print "\t".($results{$f_2M}->{l1}->{avail_info}->[1]->{results}->{ALL}//'-');      print "\n";5�_�                    !       ����                                                                                                                                                                                                                                                                                                                            !          !   S       v   T    P�ۺ    �       "                print "\n";5�_�      	                     ����                                                                                                                                                                                                                                                                                                                            !          !   S       v   T    P���    �         $      d      if($l =~m/398.27user 1.27system 0:56.82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)k    �         $       �         #            if($l =~m/�         "         for my $l(@lines) {5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��H     �         %      g      if($l =~m/398.27user 1.27system 0:56.82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��K     �         %      c      if($l =~m/.*user 1.27system 0:56.82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��P     �         %      a      if($l =~m/.*user .*system 0:56.82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       %    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��V     �         %      d      if($l =~m/.*user .*system (.*):56.82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       %    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��Z     �         %      d      if($l =~m/.*user .*system (.*):(..82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       %    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��[     �         %      e      if($l =~m/.*user .*system (.*):[(..82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       '    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��\     �         %      f      if($l =~m/.*user .*system (.*):([(..82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       !    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��_     �         %      e      if($l =~m/.*user .*system (.*):([..82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       (    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��d     �         %      f      if($l =~m/.*user .*system (\d+):([..82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��g    �         %      i      if($l =~m/.*user .*system (\d+):([\d\..82elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       6    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��o    �         %      i      if($l =~m/.*user .*system (\d+):([\d\.]+)elapsed 703%CPU (0avgtext+0avgdata 2505776maxresident)/) {5�_�                       :    ����                                                                                                                                                                                                                                                                                                                            $          $   S       v   T    P��r     �         %      :      if($l =~m/.*user .*system (\d+):([\d\.]+)elapsed/) {5�_�                    #       ����                                                                                                                                                                                                                                                                                                                            %          %   S       v   T    P�ݍ     �   "   $   &      b   print "\t".$results{$f}->{loc}->{avail_info}->[1]->{results}->{GLOBAL}->{'local access ratio'};5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            %          %   S       v   T    P�ݎ    �   #   %   &      e   print "\t".$results{$f_2M}->{loc}->{avail_info}->[1]->{results}->{GLOBAL}->{'local access ratio'};5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            %          %   S       v   T    P�ݛ     �               &   #!/usr/bin/perl   use strict;   use warnings;   use FindBin;   #use lib "$FindBin::Bin/../PerlLib";   use File::Utils;   use File::Sar;   use Data::Dumper;   $Data::Dumper::Maxdepth = 5;       my %results;   for my $f(@ARGV) {      next if($f =~ m/loc/);       W   my $basename = $f; $basename =~ s/(.loc|.lat|.tlbl1|.tlb|.l12|.tlb2|.tlb3|.loc2)$//;      open(F, $f);      my @lines = <F>;      close(F);          for my $l(@lines) {   :      if($l =~m/.*user .*system (\d+):([\d\.]+)elapsed/) {   !         my $time = $1 * 60 + $2;   %         %results{$basename} = $time;         }      }   }       for my $f(sort keys %results) {      next if($f =~ m/2M/);       $   my $f_2M = $f; $f_2M =~ s/4k/2M/;   %   my $bench = $f; $bench =~ s/.4k//;          print $bench;      print "\t".$results{$f};      print "\t".$results{$f_2M};      print "\n";   }5�_�                       	    ����                                                                                                                                                                                                                                                                                                                            %          %   S       v   T    P�ݝ    �         &      %         %results{$basename} = $time;5�_�                           ����                                                                                                                                                                                                                                                                                                                            %          %   S       v   T    P��     �         &         next if($f =~ m/loc/);5�_�                            ����                                                                                                                                                                                                                                                                                                                            %          %   S       v   T    P��    �         &         next if($f !~ m/loc/);5�_�                            ����                                                                                                                                                                                                                                                                                                                               '          (       V   (    P�ۯ     �      9        5��