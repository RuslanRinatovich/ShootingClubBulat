   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:ShootingClub.WindowsShootingClub.Windows  5   	   &     ShootingClub.Windows.LoginWIndow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:ShootingClub.Windows     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	      MaterialDesignBody#���   5   	     MaterialDesignPaper#���  5	   	   $��Medium"�5
   	   $��14(�5   	     � Title$  Вход��5   	   $	��230��6   $	��400��5   	   $	��230��6   $	��400��6%    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	   ��5   	   :  4MaterialDesignThemes.Wpf.MaterialDesignFontExtension  .��5      �  � ColumnDefinitions 5   
   �� 5   
    � RowDefinitions 5      �� 5   
   $��40 �6   �� 5   
   $��34 �6   �� 5   
   $��34 �6   �� 5    
   $��60 �6   .+�5"   
   � �� 5'      $��0��6   $#��Стрелковый клуб��6   $��Center=�5(      $��Center=�5)      $��20(�5+      $
��Bold"�5,      �� 5-       �� Orientation$ 
Horizontal=�6   $��1��6*   .+�5/      �� $��1��50      $��
Логин��51      $
��20 0q�52      $��Center=�53      $	��120��63   �� 54      -   5         ��Name$ 	TBoxLogin��54      $��1��55      $	��200��56      $��admin��6"   57      �� 58      $ 
Horizontal=�6   $��2��6*   .+�5:      �� $��2��5;      $��0��6   $��Пароль��5<      $
��20 0q�6   $��Center=�5=      $	��120��6,   G� 5>      -   5         G�Name$ TBoxPass��5>      $��30��6,   $	��200��68    G� Password$ admin��6D   5?      �� 5P      $ 
Horizontal=�6   $��4��6*   $��Center=�67   $��Bottom=�6T   .+�5Q   
   �� -   5        	 ��Name$	 BtnOk��5S      $	��100��5Q      $��35��6   $��OK��5R      
 �� 	IsDefault
 . 5T   )   �� 5U   
   -   5        $	 	BtnCancel��5X      $	��100��5U      $��35��5V      $��Cancel��5W      5Y      5_      5e      5f      