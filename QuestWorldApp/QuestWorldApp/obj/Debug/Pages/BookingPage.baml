   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      %    QuestWorldApp.Pages.BookingPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuestWorldApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5          N� Title$  Бронирование��5
      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � $��0��6   $��Stretch=�6!   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$B <Введите название квеста, клиента��6:   5      5      �� 5      $ 
Horizontal=�6   5      �� 5      $ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 	ComboSort��5       $	��275��5      $! Сортировать по��6(   .@�5"      �� $!��По возрастанию��6#   �� 5#      $��По убыванию��6#   5$      5%      5&      &   System.Windows.Controls.DataGrid  5'   
   -   5          Name$ DataGridGood��5'      $��1��6)      AutoGenerateColumns .     
IsReadOnly . 	   SelectionMode$	 Single=�5+      
   Columns
 5-      0  *System.Windows.Controls.DataGridTextColumn  5/      ,  &System.Windows.Controls.DataGridColumn   Header$ 
Заказ��6<   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *Id+6<     50      $ Клиент��6E      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6U    6%   �� *User.GetFIO+6U     51      $ Стоимость��6k   $ * 6~    6%   �� *Total+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��6~     52      $ Дата��6o   $ * 6}    6%   �� *	DateOrder+$ f��$ ru-RU��6}   4  .System.Windows.Controls.DataGridTemplateColumn  53      $
 auto 6)   $ Оплачен��66      CellTemplate 54      �� 55      .R�56      d� -   5        $��NO��56   -    )  %MaterialDesignActionLightToggleButton#��[  57   -    � ToolTip$ Оплачен��58       d� 	IsChecked 56   <   �� *Paid+58      59      5;        5<      $
 auto 6)   $ Просмотр��66    5=      �� 5>      .R�5?      ��  ��Name$ BtnEdit��6%   -   5        $��0q�5?   {   ��67   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$
 Edit=�6{   5@      5B        5C      $
 auto 6)   $ Удалить��66    5D      �� 5E      .R�5F      �� $ 	BtnDelete��6%   -   5        $��0q�5F   �   ��69     $ Delete=�6�   5G      5I      5M      �� 5N   
   -   5         ��Name$ TextBlockCount��5N   !   $��2��6   $	��300��69   $
��Left=�6E   5Q      5R      