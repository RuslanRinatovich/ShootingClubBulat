   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:QuestWorldApp.WindowsQuestWorldApp.Windows  5   	   -    'QuestWorldApp.Windows.OrderTicketWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   5local#clr-namespace:QuestWorldApp.Windows     5   	     � Title$  
Талон��5      $	��500��6   $	��600��5	   	   $	��400��6   $	��400��6%    � WindowStartupLocation$ CenterScreen=�5
   	    � Icon$1 +/QuestWorldApp;component/Resources/logo.ico��5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5       � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��34 �6   �� 5      $��34 �6   �� 5      �� 5      $��40 �6   �� 5      $��40 �6   .+�5   
   � 
�������$��2��6"   �� 5   
   $1��+/QuestWorldApp;component/Resources/logo.png��6   $��10q�5      $
��Left=�5      �� 5   
   $��0��6   $.��(Стрелковый клуб Булат��6!   $��2��6?   $��Center=�5      $��Center=�5      $��20(�5!      $
��Bold"�5"      �� 5#   
   -   5         ��Name$ TextBlockOrderNumber��5$   *   $��Заказ №��5#      $��1��6%   $��0��62   $��2��5$      $��Center=�5%      $��Center=�5&      $��20(�5'      $
��Bold"�5(      �� 5*   
   $��Дата брони��6   $��2��6'   $��0��64   $
��Left=�5+      $��60 0 0 0q�6/   $��Center=�5,       $   MaterialDesignSubtitle2TextBlock#��[  5-      $
��Bold"�5.      �� 5/   
   -   5        $ TextBlockOrderCreateDate��5/      $��2��50      $��1��6!   $��Center=�51      $
��Left=�52      #��[  53      $
��Bold"�54      &   System.Windows.Controls.DataGrid  57   
   -   5          Name$ DataGridOrderItems��57      $��3��6/      AutoGenerateColumns .     
IsReadOnly . $��2��5:      	   SelectionMode$	 Single=�5;      
   Columns
 5=      4  .System.Windows.Controls.DataGridTemplateColumn  5?      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6)      Header$ Изображение��5A   )      CellTemplate 5B      �� 5C      .R�5D      �� ��6$   ��  �� Path$ Key.Weapon.GetPhoto�5E      5G      0  *System.Windows.Controls.DataGridTextColumn  5H      $ Оружие��5J   %   $ * 65   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5H   %   �� *Key.Weapon.Title+5J   5     5K      $+ %Наименование услуги��5M   %   $ * 6B    5K   %   �� *Key.Service.Title+5M   B     5N      $ Количество��5P   %   $ * 69    5N   %   �� *Value.Count+5P   9     5Q      $ Стоимость��5S   %   $ * 68    5Q   %   �� *	Key.Price+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��5S   8     5U      $ 
ИТОГО��5W   %   $ * 64    5U   %   �� *Value.Total+$ c��$ ru-RU��5W   4   5Y      �� 5[   
   -   5        $ TextBlockTotalCost��5[      $��4��60    $  MaterialDesignHeadline6TextBlock#��[ 6=   $��20 0 0 0q�6w   $��2��5\      �� 5]   
    �� Orientation$ 
Horizontal=�6   $��5��6.   $��2��5^      $��Center=�5_      .+�5`      �� -   5         ��Name$ BtnOk��5b      $	��100��5`      $��30��6!   $��OK��5a      5c      �� 5d      -   5        $ 
BtnSavePDF��5d      $��Сохранить в PDF��5e      $	��160��6/   5f      5g      5h      5i      