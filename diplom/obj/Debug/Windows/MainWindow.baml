   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ShootingClubShootingClub  5   	       ShootingClub.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ShootingClub     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   -   5           MaterialDesignBody#���   5   	   
�����F�$��Medium"�5
   	   $��14(�5   	   $	��450��5   =   $	��800��6J   $��5q�6V     � WindowStartupLocation$  CenterScreen=�5   9    � WindowState$ 	Maximized=�6^   ��5   	   :  4MaterialDesignThemes.Wpf.MaterialDesignFontExtension   � Title 5      ��  �� ElementName$ 	MainFrame�� �� Path$ Content.Title�.��5      �  � RowDefinitions 5   
   �� 5      $	��110 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � �� 5   
   $7��1АИС Стрелковый клуб "Булат"��6   $��Center=�67   $��25(�6T   $
��Bold"�6b   $	��Top=�6t   $��25q�6�    � 5   
   -   5          �Name$ 	MainFrame��5      $��1��6   
����ح�  � NavigationUIVisibility$ Hidden=�6G   6g   �� 5   
    �� Orientation$ 
Horizontal=�6   $
��Left=�6.   $��Bottom=�6I   $��5q�6d   .+�5      �� -   5        	 ��Name$	 	BtnBasket��5      $��Корзина��6(    " MaterialDesignRaisedDarkButton#��[ 6R   5      �� 5   
   $ 
Horizontal=�6   $��Right=�6.   $��Bottom=�6J   $��5q�6e   .+�5      �� -   5        $	 BtnServices��5      $��Услуги��6*   #��[ 6U   �� 5       -   5        $	 
BtnWeapons��5       $��Оружие��6)   #��[ 6S   �� 5!      -   5        $	 	BtnOrders��5!      $��Заказы��6(   #��[ 6Q   �� 5"      -   5        $	 BtnUsers��5"      $��Пользователи��6'   #��[ 6U   �� 5#      -   5        $	 BtnPricelists��5#      $��Расценки��6,   #��[ 6[   �� 5$      -	   5        $	 BtnBack��5$      $��
Назад��6&   #��[ 6L   5%      �� 5&   
   -
   5        
 ��Name$
 
TbUserName��5&      $��40��6(   $��Right=�64   $	��Top=�6P   � 5'   
   $��2��6   5(      5)      