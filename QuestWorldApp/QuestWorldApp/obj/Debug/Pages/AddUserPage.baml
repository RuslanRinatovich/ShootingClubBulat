   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      %    QuestWorldApp.Pages.AddUserPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuestWorldApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      -   5           MaterialDesignBody#���   5      $��Regular"�5	   	   $��14(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Пользователь��5      .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      $��40 �6    � ColumnDefinitions 5!   
   �� 5"      .+�5$   
   �� -   5         ��Name$ TextBoxUserName��5$      $��0��5%   ,   $��Center=�6<   $��0��6W   $��30��6d   $	��0,7q�6p   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$% Имя пользователя��5&      $��20 5 0 0q�6C   ��5%      �� *
Username+5&   �   �� 5(   
   $ Фамилия��6,   $��20 5 0 0q�6V   $��0��6i   $��Center=�6y   $��1��6�   $��30��6�   $	��0,7q�6�   ��6   �� *
LastName+6�   �� 5)   
   $ Имя��6-   $��20 5 0 0q�6S   $��0��6f   $��Center=�6v   $��2��6�   $��30��6�   $	��0,7q�6�   ��6   �� *	FirstName+6�   �� 5*   
   $ Отчество��6.   $��20 5 0 0q�6Y   $��0��6l   $��Center=�6|   $��3��6�   $��30��6�   $	��0,7q�6�   ��6   �� *
MiddleName+6�   �� 5+   
   -   5        	 ��Name$	 ComboUserType��5+      $% Тип пользователя��6*   $��20 5 0 0q�6\   $��4��5-      
 �� DisplayMemberPath$
 Title��5.      $��Stretch=�6-   $��Center=�6I    �� SelectedValuePath$ Id��5/       �� SelectedItem 5,      �� *Role+5/      %  Xceed.Wpf.Toolkit.MaskedTextBox  51   
   -   5          Name$ TbPhone��51         Mask$ +0 (000) 000-00-00��52        MaterialDesignTextBox#���  6,   $��20 5 0 0q�53      $��0��6%   $��Center=�65   $��5��6P   $��30��6]   $	��0,7q�6i   ��51   0   �� *Phone+53   i   �� 54   
   $ E-mail��6)   $��20 5 0 0q�55      $��0��6%   $��Center=�56      $��6��6-   $��30��6:   $	��0,7q�6F   ��54      �� *Email+56   F   �� 57   
   -   5        $ PasswordBoxPassword��58   $   $��0��57   ,   $��20,0,0,2q�58      $��Center=�6B   $ Пароль��59      $��7��6:   $��30��6G   ��57      �� *
Password+59   G   �� 5<   
   -   5         �� 	IsDefault . $	��120��5<   7   $��8��6C   $��5q�6P   .��6[   Сохранить6f   5@      5A      