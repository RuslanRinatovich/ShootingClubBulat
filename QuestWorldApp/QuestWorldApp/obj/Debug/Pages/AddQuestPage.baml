   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      &     QuestWorldApp.Pages.AddQuestPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -local!clr-namespace:QuestWorldApp.Pages  5      X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  67     N� Title$:  4Добавление и редактирование��5
      .��5      �  � RowDefinitions 5   
   �� 5      �� 5      $��30 �6   �� 5      $��80 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      $	��245 �6   �� 5      .+�5   
   �� -   5         ��Name$ BtnSave��5      $��8��6"   $��Сохранить��6/   $��Center=�5      $	��Top=�6.   $	��120��6F   $��1��5   &   $��213,3,222,0q�66   �� 5    
   $��0��6   $��0��6"   $��Фото��62   $
��20 0q�6?   �� 5!   
   $��1��6   $��0��6!   $��Название��61   $
��20 0q�6B   �� 5"   
   $��2��6   $��0��6!   $��Описание��61   $
��20 0q�6B   �� 5#   
   $��3��6   $��0��6!   $��Вес��61   $
��20 0q�6=   �� 5$   
   $��4��6   $��0��6!   $��Калибр, мм��61   $
��20 0q�6D   �� 5%   
   $��5��6   $��0��6!   $#��Размер магазина��61   $
��20 0q�6I   �� 5&   
   $��6��6   $��0��6!   $��Категория��61   $
��20 0q�6C   �� 5)   
   -   5         ��Name$ 
ImagePhoto��5)      $��0��5*      $��1��6   $��10 0 0 0q�6-   $��Stretch=�5+      $��Stretch=�6,   ��5)   $   �� *
GetPhoto+5+   ,   �� 5,   
   -   5        $ BtnLoad��5,      $��0��6"   $��0��6/   $��	120,5,0,0q�6?   $
��Left=�5-      $	��Top=�6,   $��79��5.   V   ��6&   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Upload=�6V   �� 50   
   -   5         ��Name$ TextBoxTitle��50      $��1��51      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��50   (   �� *Title+51   =   �� 53   
   -   5        $ TextBoxDescription��53      $��2��54      $��1��6   $	��0,2q�6/   $
��Auto��6=    �� TextWrapping$
 Wrap=�6K   ��53   .   �� *Description+54   K   %  Xceed.Wpf.Toolkit.IntegerUpDown  55   
   -   5          Name$ IntegerUpDownWeight��55      $
��Left=�6:   $��3��6V   $��1��6c   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]	   Minimum$	 1X�6s   $	��100��6   
   Value
 6�   �� *Weight+$  Xceed.Wpf.Toolkit.DoubleUpDown  56   
   -   5          Name$ DoubleUpDownCalibr��56      $
��Left=�68   $��4��6T   $��1��6a   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 1X�6q   $	��100��6}    J� IsManipulationEnabled .    Value 6�   �� *
Сaliber+6�     57   
   -   5        $ IntegerUpDownMagazineSize��57      $
��Left=�6@   $��5��6\   $��1��6i   $	 1X�6y   $	��100��6�   
 6�   �� *MagazineSize+�� 5;   
   -	   5         ��Name$ ComboCategory��5;      $��6��5<      $��1��6     �� DisplayMemberPath$ Title��61    �� SelectedValuePath$ Id��5=       �� SelectedItem 5;   +   �� *
Category+5=      5?      5@      