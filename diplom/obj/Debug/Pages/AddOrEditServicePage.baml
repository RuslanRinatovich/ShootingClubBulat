   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ShootingClub.PagesShootingClub.Pages  5      -    'ShootingClub.Pages.AddOrEditServicePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ShootingClub.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        N� Title$D  >Добавление/Редактирование услуги��5
      .��5      �� .��5   
   �  � RowDefinitions 5      �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      $
��auto �6     � ColumnDefinitions 5      �� 5      $
��auto �6#   �� 5      $��* �6#   .+�5      �� 5      �� 5      $��0��6   $+��%Наименование услуги��6%   $
��Left=�6@   $��60 0 0 0q�6[   $��center=�5      $
��Bold"�5      �� 5      $��1��6   $#��Описание услуги��6%   $
��Left=�6<   $��60 0 0 0q�6W   $��center=�5      $
��Bold"�5!      �� 5#      $��0��63   $��1��6@   ��6   �� *ServiceName+6@   �� 5$      $
��Auto=�6:    �� TextWrapping$
 Wrap=�6j   $��80��6~   $��1��6�   $��1��6�   ��6   �� *ServiceDescription+6�   �� 5&      -   5         ��Name$ BtnSave��5&      $��2��6&   $��Сохранить��6:   $��2��6N   $��Center=�6q   $	��150��6�   5'      5(      5)      