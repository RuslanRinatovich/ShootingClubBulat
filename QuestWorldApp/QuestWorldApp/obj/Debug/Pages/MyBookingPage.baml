   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      '    !QuestWorldApp.Pages.MyBookingPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuestWorldApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	      -   5          N� Title$  Мои брони��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � $��0��6   $��Stretch=�6!   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$2 ,Введите название оружия��6:   5      5      �� 5      $ 
Horizontal=�6   5      �� 5      $ 
Horizontal=�6   .+�5       �� -   5         ��Name$ 	ComboSort��5!      $	��275��5       $! Сортировать по��6(   .@�5#      �� $!��По возрастанию��6#   �� 5$      $��По убыванию��6#   5%      5&      5'      &   System.Windows.Controls.DataGrid  5(   
   -   5          Name$ DataGridGood��5(      $��1��6)      AutoGenerateColumns .     
IsReadOnly . 	   SelectionMode$	 Single=�5,      
   Columns
 5.      0  *System.Windows.Controls.DataGridTextColumn  50      ,  &System.Windows.Controls.DataGridColumn   Header$ 
Заказ��6<      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6L   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *Id+6L     51      $ Клиент��6E   $ * 6U    6%   �� *User.GetFIO+6U     52      $ Стоимость��6k   $
 auto 6~    6%   �� *Total+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��6~     53      $ Дата��6o   $
 auto 6}    6%   �� *	DateOrder+$ f��$ ru-RU��6}   4  .System.Windows.Controls.DataGridCheckBoxColumn  54         
IsReadOnly . $ Оплачен��6T   $
 auto 6e    6)   �� *Paid+6e   4  .System.Windows.Controls.DataGridTemplateColumn  55      $
 auto 6)   $ Просмотр��66      CellTemplate 56      �� 57      .R�58      ��  ��Name$ BtnShow��6%   -   5        $��0q�58   f   ��67   0	  *MaterialDesignThemes.Wpf.PackIconExtension	   	  Kind$
 Edit=�6q   59      5;        5<      $
 auto 6)   $ Удалить��66    5=      �� 5>      .R�5?      �� $ 	BtnDelete��6%   -   5        $��0q�5?   �   ��6P   	  $ Delete=�6�   5@      5B      5G      �� 5H   
   -   5         ��Name$ TextBlockCount��5H   !   $��2��6   $	��300��69   $
��Left=�6E   5K      5L      