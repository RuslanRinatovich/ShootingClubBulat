   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ShootingClub.PagesShootingClub.Pages  5      /    )ShootingClub.Pages.AddOrEditPricelistPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      ,local clr-namespace:ShootingClub.Pages  5        N� Title$  AddOrEditPricelistPage��5
      .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $	��150 �6   �� 5      $��* �6   .+�5   
   �� $��0��6   $��Вид услуги��6!   $
��Left=�63   $��60 0 0 0q�6N   $��center=�5      $
��Bold"�5      �� 5   
   $��1��6   $��Оружие��6!   $
��Left=�6/   $��60 0 0 0q�6J   $��center=�5      $
��Bold"�5      �� 5    
   $��2��6   $��Стоимость (p.)��6!   $
��Left=�67   $��60 0 0 0q�6R   $��center=�5!      $
��Bold"�5#      �� 5%   
   -   5         ��Name$ ComboBoxService��5%       �� DisplayMemberPath$ ServiceName��6M    �� SelectedValuePath$ 	ServiceID��6m   $��0��6�   $��1��6�   $	��300��6�   $
��Left=�6�    �� SelectedItem 6,   �� *	Service+6�   �� 5&   
   -   5        $ ComboBoxWeapon��5&      $ 
WeaponName��6K   $ WeaponID��6j   $��1��6�   $��1��6�   $	��300��6�   $
��Left=�6�    6+   �� *Weapon+6�   �� 5'   
   -   5         ��Name$ TextBoxPrice��5'      $��2��6?   $��1��6L   $	��300��6\   $
��Left=�6h   ��6(   �� *Price+6h   �� 5*   
   -   5         ��Name$ BtnSave��5*      $��2��6"   $��Сохранить��66   $��3��6J   $��Center=�6m   $	��150��6�   5+      5,      