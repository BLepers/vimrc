Vim�UnDo� �ְ�R�ܻ��挙gtKq�FK�9�<.�d�   �   *         if(is_callable($optionFunction) {   �   (      0       0   0   0    Q$�y    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Q/     �      	   �       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q1     �                 * Entry point5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q2     �                 */5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Q2     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Q3    �                /*5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$��     �   �   �   �         �   �   �   �         }5�_�                    �   $    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$��    �   �   �   �      0   public static function getPlugins($options) {5�_�      	              �   :    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$��    �   �   �   �      :   public static function getPluginsUserValues($options) {5�_�      
           	   �   0    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$��    �   �   �         :   public static function getPluginsUserValues($options) {5�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$�     �   �   �          '      $options = Options::getOptions();5�_�   
                 �   	    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$�     �   �   �   �    5�_�                    �   &    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$�     �   �   �         0   public static function getPlugins($options) {5�_�                    �   &    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Q$�     �   �   �         )   public static function getPlugins($) {5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �   &       v   &    Q$�     �   �   �         c            $activated = isset($options[$d->name.'_activated']) && $options[$d->name.'_activated'];5�_�                    �   G    ����                                                                                                                                                                                                                                                                                                                            �   G       �   M       v   M    Q$�     �   �   �         f            $activated = isset($new_values[$d->name.'_activated']) && $options[$d->name.'_activated'];5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �          v       Q$�#    �   �   �             =   public static function getPluginsUserValues($new_values) {         $scripts = array();       %      $dir = new File_Dir("./pages");   &      foreach($dir->getDirs() as $d) {   6         require_once ("$d->path/$d->name/index.php");   K         $optional = eval('return Pages_'.$d->name.'_Index::$isOptional;');            $activated = false;            if(!$optional) {               $activated = true;            } else {   c            $activated = isset($options[$d->name.'_activated']) && $options[$d->name.'_activated'];   
         }            if(!$activated)               continue;       F         $optionFunction = "Pages_".$d->name."_Index::getUserScripts";   +         if(is_callable($optionFunction)) {   >            $plugin_scripts = call_user_func($optionFunction);   >            $scripts = array_merge($scripts, $plugin_scripts);   
         }         }       -      return array('PLUGIN_URL' => $scripts);      }    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �          v       Q$ݢ     �   �   �   �      -      return array('PLUGIN_URL' => $scripts);5�_�                    �   4    ����                                                                                                                                                                                                                                                                                                                            �           �          v       Q$ݲ    �   �   �   �      6         'scripts' => array('PLUGIN_URL' => $scripts);5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �           �          v       Q$��     �   �   �   �      
         }5�_�                    �   #    ����                                                                                                                                                                                                                                                                                                                            �   "       �   F       v   I    Q$��    �   �   �   �      #         $optionFunction = "Pages_"5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �   "       �   F       v   I    Q$�     �   �   �   �       5�_�                    �   6    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�    �   �   �   �      F         $optionFunction = "Pages_".$d->name."_Index::getUserScripts";5�_�                    �   B    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�   	 �   �   �   �      B         $optionFunction = "Pages_".$d->name."_Index::getOptions";5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�     �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�     �   �   �   �      >            $plugin_scripts = call_user_func($optionFunction);5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�   
 �   �   �   �      6            $plugin_= call_user_func($optionFunction);5�_�                    �   >    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�     �   �   �   �      >            $plugin_options = call_user_func($optionFunction);5�_�                    �   	    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�$     �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�%     �   �   �   �            $scripts = array();5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�8     �   �   �   �            $= array();5�_�                     �        ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�>     �   �   �   �      "      $plugin_variables = array();5�_�      !               �        ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�@     �   �   �   �             $plugin_variables = array(5�_�       "           !   �        ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�M    �   �   �   �                'PLUGIN_VAL' => array()5�_�   !   #           "   �   '    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�P    �   �   �   �      '            foreach($plugin_options as 5�_�   "   $           #   �   ,    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�V    �   �   �   �      ,            foreach($plugin_options as $o) {5�_�   #   %           $   �        ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$�`     �   �   �   �       5�_�   $   &           %   �   >    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߊ     �   �   �   �      >                  $plugin_variables['PLUGIN_VAR'][] = $o['id']5�_�   %   '           &   �   >    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߋ     �   �   �   �    5�_�   &   (           '   �   ?    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߒ     �   �   �   �      ?                  $plugin_variables['PLUGIN_VAR'][] = $o['id'];5�_�   '   )           (   �   .    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߖ    �   �   �   �      ?                  $plugin_variables['PLUGIN_VAR'][] = $o['id'];5�_�   (   *           )   �   7    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߛ     �   �   �   �      ?                  $plugin_variables['PLUGIN_VAL'][] = $o['id'];5�_�   )   +           *   �   7    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߜ    �   �   �   �      7                  $plugin_variables['PLUGIN_VAL'][] = $5�_�   *   ,           +   �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$ߪ    �   �   �                5�_�   +   -           ,   �   5    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$߫     �   �   �   �      5         'scripts' => array('PLUGIN_URL' => $scripts)5�_�   ,   .           -   �   5    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$߮     �   �   �   �      5         'scripts' => array('PLUGIN_URL' => $scripts)5�_�   -   /           .   �   
    ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$߯     �   �   �   �      
         '5�_�   .   0           /   �       ����                                                                                                                                                                                                                                                                                                                            �   6       �   C       v   C    Q$��    �   �   �   �               'variables' => 5�_�   /               0   �   (    ����                                                                                                                                                                                                                                                                                                                            �   
       �          v       Q$�x    �   �   �   �      *         if(is_callable($optionFunction) {5��