   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      ,    &QuestWorldApp.Pages.QuestCataloguePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuestWorldApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5          N� Title$!  Каталог оружия��5
      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��50 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � $��0��6   $��Stretch=�6!   .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$2 ,Введите название оружия��67   6p   �� 5      -   5         ��Name$ ComboCategory��5   #   $	��275��6   $��14(�6:   $��3q�6H   $ Категория��6T    �� DisplayMemberPath$ Title��5      64   �� 5      -   5        $ 	ComboSort��5       $	��275��5      $! Сортировать по��6'   $��10 0 0 0q�5!      .@�5"      �� .��5#      ��  �� Orientation$ 
Horizontal=�6%   .+�5$      �� $��Название��6(   '  !MaterialDesignThemes.Wpf.PackIcon  5%         Kind$ SortAscending=�66   $��5 0 0 0q�6K   5&      5'      �� 5(      .��5)      �� $ 
Horizontal=�6%   .+�5*      �� $��Название��6$     5+      $ SortDescending=�66   $��5 0 0 0q�6L   5,      5-      �� 5.      .��5/      �� $ 
Horizontal=�6%   .+�50      �� $��Вес��6(     51      $! SortNumericAscendingVariant=�66   $��5 0 0 0q�6Y   52      53      �� 54      .��55      �� $ 
Horizontal=�6%   .+�56      �� $��Вес��6$     57      $" SortNumericDescendingVariant=�62   $��5 0 0 0q�6V   58      59      5:      5<      �� 5>   
   -   5         ��Name$ TextBlockBasketInfo��5>   !   $��1��6   $	��200��6>   $��Right=�6J   $��	0 0 140 0q�6f   %  MaterialDesignThemes.Wpf.Badged  5?   
   -   5        	  Name$	 BadgeBasketCount��5?   I   $��1��6    $��Right=�6-   $��Center=�6c   $��2 0 10 0q�6~   .��5@      �� -   5        
 ��Name$
 	BtnBasket��5A      $
��auto��5@      $y�	Collapsed=�6[   ��6$   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ BasketUnfill=�5A   )   5B      �� 5C   
   -   5         ��Name$ 
LViewGoods��5C      $��2��6'   $��Disabled=�5D      ��5F      �� 5G      .R�5H      �  � Orientation$ 
Horizontal=�6    $��Center=�69   5I      ��5K      �� 5L      .R�5N      #  MaterialDesignThemes.Wpf.Card  $	��400��6*   $	��500��66   
�������.��5O      &   MaterialDesignThemes.Wpf.Flipper  ,  &MaterialDesignThemes.Wpf.FlipperAssist   UniformCornerRadius$ 8Q�62   $	��400��6g   $	��500��6s      FrontContent 5Q      � 5R      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ SecondaryMid=�6#    5S   "   �� 5T   &   $��* �6;   �� 5U   &   $	��340 �6;   �� 5W   *   $��60 �6?   .+�5[   "   �� $��1��6K   $	��300��6Y   $��Uniform=�5\   %   ��5[   )   ��  �� Path$ GetPhoto�5\   %   �� 5]   "   $��0��6+   $��Center=�6U    �� TextWrapping$
 Wrap=�6r   $
��Bold"�5^   2   $��10q�6D    �� 
IsReadOnly . $��Center=�6b   $��18(�5`   1   ��5]   >   �� *Title+5`   1   �� 5a   "   $��1��6.   $��20 0 0 0q�6;   $
��Left=�6Q   $��Bottom=�6l   .+�5b   &   � $
��auto��6+    5c   *   �� 5d   .   �� 5e   .   �� 5f   .    � ColumnDefinitions 5h   *   �� 5i   .   �� 5j   .   .+�5l   *     $ DiameterVariant=�6B   $��24��6Y   $��0��6f   $��3q�6s   �� 5m   *   $��0��65   $��1��6B   $��3q�6k   $��16(�6v   $
��Bold"�6�   ��6R   �� *
Сaliber+6�     5n   *   $ 
Ammunition=�6B   $��24��6T   $��1��6`   $��3q�6m   �� 5o   *   $��1��65   $��1��6B   $��3q�6p   $��16(�6{   $
��Bold"�6�   ��6R   �� *MagazineSize+6�     5p   *   $ Weight=�6B   $��24��6Q   $��2��6]   $��3q�6j   �� 5q   *   $��2��65   $��1��6B   $��3q�6k   $��16(�6v   $
��Bold"�6�   ��6R   �� *Weight+6�   5r   '   5s   #   �� 5w   &   $	��184��6-   $��8q�6:   $��2��6E      FlipCommand#��Z 5x   !   $��ПРАЙС-ЛИСТ��5y   %      MaterialDesignFlatButton#��[  5z   %   5|         BackContent 5      � 5�   "   $ SecondaryMid=�6'    5�   &   �� 5�   *   $��* �6?   �� 5�   *   $��60 �6?   .+�5�   &   &	   System.Windows.Controls.DataGrid	  $��0��6/    	  AutoGenerateColumns .   	  
IsReadOnly .  	  SelectionMode$ Single=�5�   4     MaterialDesignDataGrid#���  5�      ��5�   K   �� *
Pricelists+ 	  Columns 5�   *   0
  *System.Windows.Controls.DataGridTextColumn
  5�   .   ,  &System.Windows.Controls.DataGridColumn   Header$ Услуга��6c      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6s   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6A   �� *Service.Title+6s   
  5�   .   $ Стоимость��6�   $ * 6�    6A   �� *Price+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��6�   4  .System.Windows.Controls.DataGridTemplateColumn  5�   .   $
 auto 6E    6R     $ Basket=�    CellTemplate  5�   2   �� 5�   6   .R�5�   :   �� $
 BtnAdd��6A   -	   5        $��0q�5�   �   ��6R     $	 Add=�y�6   �� *GetVisibility+6�   5�   7   5�   /   5�   '   �� 5�   &   $	��184��62   $��8q�6C   #��Z 6S   $��GO BACK��5�   *   #��[  6A   5�   #   5�      5�      5�      5�      �� 5�   
   -
   5        $ TextBlockCount��5�   !   $��3��6   6!   5�      5�      