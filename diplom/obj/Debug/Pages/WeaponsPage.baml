   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ShootingClub.PagesShootingClub.Pages  5      $    ShootingClub.Pages.WeaponsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ShootingClub.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5	   	     MaterialDesignPaper  N� 
Background#  �  5
   	   $��Medium"�5   	   $��14(�5   	    N� Title$! Каталог оружия��5       N� 
FontFamily 5   	   :  4MaterialDesignThemes.Wpf.MaterialDesignFontExtension  .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��30 �6   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � .+�5      ��  �� Orientation$ 
Horizontal=�6   $��3q�62   .+�5      �� $;��5Введите наименование оружия:��6   �� 5      -   5         ��Name$ TextBoxWeaponName��5      $	��250��65   6A   5      �� 5      $ 
Horizontal=�6   $��3q�62   .+�5      �� $)��#Фильтрация по типу:��6   �� 5       -   5         ��Name$ ComboSortWeaponType��5       $	��250��68   $��4��5"      $��1��6     �� DisplayMemberPath$ WeaponTypeName��5#       �� SelectedValuePath$ WeaponTypeID��5$      	 �� SelectedItem	 5!      �� *
WeaponType+5%      5&      5'      �� 5(   
   -   5        
 ��Name$
 TbResultCount��5(   !   $��1��6   6!   �� 5*   
   -   5         ��Name$ ListViewProducts��5*       $��3��6   $��0q�6:   $��Stretch=�6N   $��Disabled=�5+   H   ��5,      �� 5-      .R�5.      �  � ColumnDefinitions 5/      �� 50      $	��100 �6/   �� 51      $��* �6/   �� 52      $
��auto �6/   .+�54      �� $��10q�6<   ��6    �� *
GetPhoto+6<   �� 55      $��1��6%   $��Center=�65   .+�56      �� $��3q�6f   $��16(�6q   ��6(   �� *
WeaponName+ �� StringFormat$# Наименование: {0}��6q   �� 57      $
��Wrap=�6h   $��3q�6|   $��16(�6�   ��6(   �� *WeaponDescription+$ Описание: {0}��6�   �� 58      $ 
Horizontal=�6)   .+�59   "   �� $��3q�6c   $��16(�6n   ��6,   �� *WeaponWeight+$ Вес: {0}��6n   �� 5:   "   $��3q�6g   $��16(�6r   ��6,   �� *WeaponCaliber+$ Калибр: {0}��6r   �� 5;   "   $��3q�6o   $��16(�6z   ��6,   �� *WeaponClipSize+$$ Размер обоймы: {0}��6z   5<      5=      �� 5>      $��2��6%   .+�5?      ��  ��Name$ BtnEdit��6%   -   5        $��Center=�5?   |   $��Center=�6�   ��66   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Pencil=�y�6�   �� *GetVisibility+5@      5B      5C      5E      �� 5N   
   -   5        $ BtnAdd��5N      $��4��6!   $	��100��6.   $
��Left=�6:   $��3q�6U   $��Добавить��5O      6$   �� 5P   
   -   5        $ 	BtnDelete��5P      $��4��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5Q      6#   5R      5S      