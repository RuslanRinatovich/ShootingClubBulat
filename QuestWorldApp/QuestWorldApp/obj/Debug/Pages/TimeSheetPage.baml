   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      '    !QuestWorldApp.Pages.TimeSheetPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuestWorldApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        N� Title$  Прайс-лист��5
   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5      �� $#��Выберите оружие��6    $   MaterialDesignSubtitle2TextBlock#��[  63   �� 5      -   5         ��Name$ ComboQuests��5   5   $��Stretch=�6   $	��400��6J    �� SelectedValuePath$ Id��5       �� DisplayMemberPath$ Title��5      5      � 5   
   -   5         �Name$ GridGood��5      $	��300��6!   $��1��6-   $��0��6:    5      �� 5       $��80 �6    �� 5!      $	��260 �6    .+�5&      �� $��1��6   $��Uniform=�6"   $	��Top=�64   $��Center=�5'       ��5(       ��  �� Path$ GetPhoto��� 5)      $��1��6   $��20 0 0 0q�6'   $
��Left=�6=   $��Bottom=�6X   .+�5*      � $
��auto��6    5+      �� 5,      �� 5-      �� 5.       50      �� 51      �� 52      .+�54      '  !MaterialDesignThemes.Wpf.PackIcon  	   Kind$	 DiameterVariant=�6.   $��24��6E   $��0��6R   $��3q�6_   �� 55      $��0��6!   $��1��6.   $��3q�6o   $��16(�6z   $
��Bold"�6�   ��6>   �� *
Сaliber+
 �� StringFormat$
 	{0} мм.��6�     56      $	 
Ammunition=�6.   $��24��6@   $��1��6L   $��3q�6Y   �� 57      $��1��6!   $��1��6.   $��3q�6y   $��16(�6�   $
��Bold"�6�   ��6>   �� *MagazineSize+$
 {0} патронов��6�     58      $	 Weight=�6.   $��24��6=   $��2��6I   $��3q�6V   �� 59      $��2��6!   $��1��6.   $��3q�6n   $��16(�6y   $
��Bold"�6�   ��6>   �� *Weight+$
 {0} г.��6�   5:      5;      �� 5<      $��0��6   $��Center=�6=    �� TextWrapping$
 Wrap=�6Z   $
��Bold"�5=   2   $��10q�6D    �� 
IsReadOnly . $��Center=�6b   $��18(�5?   1   ��5<   &   �� *Title+5?   1   5B      &   System.Windows.Controls.DataGrid  5C   
   -   5          Name$ DtData��5C         AutoGenerateColumns .  $��1��6@   $��1��6M      
IsReadOnly .    SelectionMode$ Single =�5E         Columns 5F      0  *System.Windows.Controls.DataGridTextColumn  5G      ,  &System.Windows.Controls.DataGridColumn   Header$ № п��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *Id+  5J      $ Услуга��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6W    65   �� *Service.Title+6W     5K      $ Стоимость��6%    68   �� *Price+$
 c�� �� ConverterCulture$ ru-RU��5N      �� 5O   
   $��2��6   $��1��6"   $ 
Horizontal=�62   $��Center=�6K   $��Center=�6f   .+�5P      �� -   5         ��Name$ btnAdd��5P      $��Добавить��6%   68   �� 5Q      -   5        $ 	btnChange��5Q      $��Изменить��6(   6;   �� 5R      -   5        $ 	btnDelete��5R      $��Удалить��6(   6:   5S      5U      5V      