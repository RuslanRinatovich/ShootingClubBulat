   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ShootingClub.PagesShootingClub.Pages  5      *    $ShootingClub.Pages.AddOrEditUserPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ShootingClub.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        N� Title$  AddOrEditUserPage��5
      .��5      �  � RowDefinitions 5   
   �� 5      $��35 �6   �� 5      $��35 �6   �� 5      $��35 �6   �� 5      $��35 �6   �� 5      $��35 �6   �� 5      $��35 �6   �� 5      $
��auto �6    � ColumnDefinitions 5   
   �� 5      $	��130 �6   �� 5      $��* �6   .+�5   
   �� 5      �� 5   
   $��0��6   $��Имя��6!   $
��Left=�6,   $��60 0 0 0q�6G   $��center=�5      $
��Bold"�5       �� 5!   
   $��1��6   $��Фамилия��6!   $
��Left=�60   $��60 0 0 0q�6K   $��center=�5"      $
��Bold"�5$      �� 5%   
   $��2��6   $��Отчество��6!   $
��Left=�61   $��60 0 0 0q�6L   $��center=�5&      $
��Bold"�5(      �� 5)   
   $��3��6   $��
Логин��6!   $
��Left=�6.   $��60 0 0 0q�6I   $��center=�5*      $
��Bold"�5,      �� 5-   
   $��4��6   $��Пароль��6!   $
��Left=�6/   $��60 0 0 0q�6J   $��center=�5.      $
��Bold"�50      �� 51   
   $��5��6   $��Роль��6!   $
��Left=�6-   $��60 0 0 0q�6H   $��center=�52      $
��Bold"�54      �� 56   
   -   5         ��Name$ TextBoxName��56      $��0��6A   $��1��6N   $	��300��6^   $
��Left=�6j   ��6'   �� *
UserName+6j   �� 57   
   -   5        $ TextBoxSurame��57      $��1��6F   $��1��6S   $	��300��6c   $
��Left=�6o   ��6)   �� *UserSurname+6o   �� 58   
   -   5        $ TextBoxPatronymic��58      $��2��6M   $��1��6Z   $	��300��6j   $
��Left=�6v   ��6-   �� *UserPatronymic+6v   �� 59   
   -   5        $ TextBoxLogin��59      $��3��6C   $��1��6P   $	��300��6`   $
��Left=�6l   ��6(   �� *	UserLogin+6l   �� 5:   
   -   5        $ TextBoxPassword��5:      $��4��6I   $��1��6V   $	��300��6f   $
��Left=�6r   ��6+   �� *UserPassword+6r   �� 5;   
   -   5         ��Name$ ComboBoxRole��5;      $��5��6H   $��1��6U   $��Stretch=�6e    �� DisplayMemberPath$ RoleName��6�   $	��300��6�   $
��Left=�6�    �� SelectedItem 6)   �� *Role+6�   �� 5=   
   -   5         ��Name$ BtnSave��5=      $��2��6"   $��Сохранить��66   $��6��6J   $��Center=�6m   $	��150��6�   5>      5?      