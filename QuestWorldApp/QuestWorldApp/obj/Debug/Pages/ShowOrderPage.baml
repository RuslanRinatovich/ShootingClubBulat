   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuestWorldApp.PagesQuestWorldApp.Pages  5      '    !QuestWorldApp.Pages.ShowOrderPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -local!clr-namespace:QuestWorldApp.Pages  5        N� Title$  
Бронь��5
      .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5       � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��34 �6   �� 5      $��34 �6   �� 5      �� 5      $��40 �6   �� 5      $��40 �6   .+�5   
   � 
�������$��2��6"   �� 5   
   $1��+/QuestWorldApp;component/Resources/logo.png��6   $��10q�5      $
��Left=�5      �� 5   
   $��0��6   $.��(Стрелковый клуб Булат��6!   $��2��6?   $��Center=�5      $��Center=�5      $��20(�5!      $
��Bold"�5"      �� 5#   
   -   5         ��Name$ TextBlockOrderNumber��5$   *   $��Бронь №��5#      $��1��6%   $��0��62   $��2��5$      $��Center=�5%      $��Center=�5&      $��20(�5'      $
��Bold"�5(      �� 5*   
   $��Дата брони��6   $��2��6'   $��0��64   $
��Left=�5+      $��60 0 0 0q�6/   $��Center=�5,       $   MaterialDesignSubtitle2TextBlock#��[  5-      $
��Bold"�5.      �� 5/   
   -   5        $ TextBlockOrderCreateDate��5/      $��2��50      $��1��6!   $��Center=�51      $
��Left=�52      #��[  53      $
��Bold"�54      &   System.Windows.Controls.DataGrid  57   
   -   5          Name$ DataGridOrderItems��57      $��3��6/      AutoGenerateColumns .     
IsReadOnly . $��2��5:         SelectionMode$ Single=�5;         Columns 5=      4  .System.Windows.Controls.DataGridTemplateColumn  5>      ,  &System.Windows.Controls.DataGridColumn	   Width5  /System.Windows.Controls.DataGridLengthConverter$		 100 6)   
   Header$
 Изображение��5@   )      CellTemplate 5A      �� 5B      .R�5C      �� ��6$   ��  �� Path$ Pricelist.Weapon.GetPhoto�5D      5F      0  *System.Windows.Controls.DataGridTextColumn  5G      $
 Оружие��5I   %   $	 * 65   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5G   %   �� *Pricelist.Weapon.Title+5I   5     5J      $+
 %Наименование услуги��5L   %   $	 * 6B    5J   %   �� *Pricelist.Service.Title+5L   B     5M      $
 Количество��5O   %   $	 * 69    5M   %   �� *Count+5O   9     5P      $
 Стоимость��5R   %   $	 * 68    5P   %   �� *Pricelist.Price+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��5R   8     5T      $
 
ИТОГО��5V   %   $	 * 64    5T   %   �� *Total+$ c��$ ru-RU��5V   4   5X      �� 5Z   
   -   5        $ TextBlockTotalCost��5Z      $��4��60    $  MaterialDesignHeadline6TextBlock#��[ 6=   $��20 0 0 0q�6w   $��2��5[      �� 5\   
    �� Orientation$ 
Horizontal=�6   $��5��6.   $��2��5]      $��Center=�5^      .+�5`      �� -   5         ��Name$ 
BtnSavePDF��5`       � ToolTip$ Сохранить в PDF��5a      $	��160��5b   D   ��6   0  *MaterialDesignThemes.Wpf.PackIconExtension  *
FilePdfBox+5c      5d      5e      5f      