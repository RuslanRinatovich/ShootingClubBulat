   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      #    QuestWorldApp.Pages.UsersPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuestWorldApp.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5           MaterialDesignBody#���   5      $��Regular"�5	   	   $��14(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Пользователи��5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6   �� 5      $��50 �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      �� -   5         ��Name$ 
TBoxSearch��5   "   $	��275��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$B <Введите Имя пользователя или ФИО��68   5      �� 5       -   5         ��Name$ ComboUserType��5    #   $	��275��6   $��14(�6:   $��3q�6H   $6 0Выберите тип пользователя��5!      	 �� DisplayMemberPath$	 Title��5"      6/   �� 5%      -   5        $ 	ComboSort��5&      $	��275��5%      $ Сортировать��6#   $��10 0 0 0q�5'   H   .@�5(      �� .��5)      �� 
 �� Orientation$
 
Horizontal=�6!   .+�5*      �� $��ФИО��6$   '  !MaterialDesignThemes.Wpf.PackIcon  5+         Kind$ SortAscending=�62   $��5 0 0 0q�6G   5,      5-      �� 5.      .��5/      �� $
 
Horizontal=�6!   .+�50      �� $��ФИО��6$     51      $ SortDescending=�62   $��5 0 0 0q�6H   52      53      �� 54      .��55      �� $
 
Horizontal=�6!   .+�56      �� $��Группа��6$     57      $ SortAscending=�62   $��5 0 0 0q�6G   58      59      �� 5:      .��5;      �� $
 
Horizontal=�6!   .+�5<      �� $��Группа��6$     5=      $ SortDescending=�62   $��5 0 0 0q�6H   5>      5?      5@      5B      &   System.Windows.Controls.DataGrid  5D   
   -   5          Name$ DataGridData��5D      $��1��6)      AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�5H      ��5G      ��    Columns 5J      0  *System.Windows.Controls.DataGridTextColumn  5L      ,  &System.Windows.Controls.DataGridColumn   Header$% Имя пользователя��6B      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6\   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *
Username+6\     5M      $ Фамилия��6B   $ * 6S    6%   �� *
LastName+6S     5N      $ Имя��6C   $ * 6P    6%   �� *	FirstName+6P     5O      $ Отчество��6D   $ * 6V    6%   �� *
MiddleName+6V     5P      $ E-mail��6?   $ * 6O    6%   �� *Email+6O     5Q      $ Роль��6D   $ * 6R    6%   �� *
Role.Title+6R     5R      $ Телефон��6?   $ * 6P    6%   �� *Phone+6P   4	  .System.Windows.Controls.DataGridTemplateColumn	  5W      $
 auto 6)    	  CellTemplate 5X      �� 5Y      .R�5Z      ��  ��Name$ BtnEdit��6@   -   5        $��Center=�5Z   %     MaterialDesignFlatButton#��[ 6R    � ToolTip$ Изменить��5[   Z   $��40��6n   ��6!   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$
 Edit=� 
  Size$ 24X�6z   5\      5^      	  5_      $
 auto 6)    5`      �� 5a      .R�5b      �� $ 	BtnDelete��6@   -   5        $��Center=�5b   %   #��[ 6T   $ Удалить��5c   \   $��40��6o   ��6!   
  $ Delete=�$ 24X�6{   5d      5f      5k      �� 5l   
   -   5        $ BtnAdd��5l      $��3��6!   $	��100��6.   $��Right=�6:   $��3 0 10 0q�6V   $��Добавить��5m      6$   �� 5o   
   -	   5         ��Name$ TextBlockCount��5o   !   $��3��6   $	��300��69   $
��Left=�6F   5q      5r      