   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ShootingClub.PagesShootingClub.Pages  5      )    #ShootingClub.Pages.OrderServicePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ShootingClub.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        N� Title$  OrderServicePage��5
      .��5      �  � ColumnDefinitions 5   
   �� 5      $	��220 �6   �� 5       � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��34 �6   �� 5      $��34 �6   �� 5      $��34 �6   �� 5      $��34 �6   �� 5      $��34 �6   �� 5      $��50 �6   �� 5      $��50 �6   .+�5   
   � $��2��6   �� 5    
   $��0��6   $�� ��6!   $��2��6*   $��Center=�5!      $��Center=�5"      $��20(�5$      $
��Bold"�5%      �� 5'   
   -   5         ��Name$ TextBlockOrderNumber��5(   *   $��Заказ №��5'      $��1��6%   $��0��62   $��2��5(      $��Center=�5)      $��Center=�5*      $��20(�5+      $
��Bold"�5,      �� 5.   
   $��Вид услуги��6   $��2��6'   $��0��64   $
��Left=�5/      $��60 0 0 0q�6/   $��Center=�50      $
��Bold"�52      �� 54   
   -   5         ��Name$ ComboBoxService��54      $��2��6,   $��1��69   $��Center=�55      $
��Left=�6/   $	��140��56       �� DisplayMemberPath$ ServiceName��58       �� SelectedValuePath$ 	ServiceID��59      $
��Bold"�5:       �� SelectedItem 57      �� *	Service+5:   &   �� 5<   
   $��Тип оружия��6   $��3��6'   $��0��64   $
��Left=�5=      $��60 0 0 0q�6/   $��Center=�5>      $
��Bold"�5@      �� 5B   
   -   5        $ ComboBoxWeaponType��5B      $��3��6/   $��1��5C      $��Center=�6%   $	��140��6@   $
��Left=�5D      $ WeaponTypeName��5F      $ WeaponTypeID��5G      $
��Bold"�5I       5E      �� *
WeaponType+5I   &   �� 5J   
   $��Оружие��6   $��4��6#   $��0��60   $
��Left=�5K      $��60 0 0 0q�6/   $��center=�5L      $
��Bold"�5N      �� 5S   
   -   5        $ ComboBoxWeapon��5S      $��4��6+   $��1��68   $	��140��6H   $
��Left=�6T   $ 
WeaponName��5U      $ WeaponID��5V       5T      �� *Weapon+5X      �� 5Y   
   $.��(Арендуемое время (час)��6   $��5��63   $��0��6@   $
��Left=�5Z      $��60 0 0 0q�6/   $��Center=�5[      $
��Bold"�5]      �� 5_   
   -   5         ��Name$ TextBoxTimeAmount��5_      $��5��6-   $��1��5`      $��Center=�6%   $	��140��6@   $
��Left=�5a      $
��Bold"�5c      6&   �� 5d   
   $��6��6   $
��Left=�6!   $��60 0 0 0q�6<   $��Center=�5e      $
��Bold"�60   $��Итого:��6B   �� 5g   
   -   5        $ TextBoxTotalCost��5g      $��6��6.   $��1��6;   $
��Left=�6K   $��Center=�5h      $
��Bold"�60   $�� ��6B   �� 5z   
   	 �� Orientation$	 
Horizontal=�6   $��8��6.   $��2��5{      $��Center=�6)   .+�5|      �� -   5        
 ��Name$
 BtnClose��5~      $	��100��5|      $��Закрыть��5}      5      �� 5�      -   5        $
 BtnCreateOrder��5�      $��Добавить��6.   $	��100��5�      6"   5�      5�      5�      