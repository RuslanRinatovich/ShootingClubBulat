   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:QuestWorldApp.WindowsQuestWorldApp.Windows  5   	   *    $QuestWorldApp.Windows.NewOrderWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   5local#clr-namespace:QuestWorldApp.Windows     5   	   X TXceed.Wpf.Toolkit, Version=4.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        � Title$'  !Оформление заказа��5	      $	��500��6&   $	��600��5
   	   $	��400��6   $	��400��6%    � WindowStartupLocation$ CenterScreen=�5   	    � Icon$1 +/QuestWorldApp;component/Resources/logo.ico��5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5       � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��34 �6   �� 5      $��60 �6   �� 5      �� 5      $��40 �6   �� 5      $��40 �6   .+�5   
   � 
�������$��2��6"   �� 5   
   $1��+/QuestWorldApp;component/Resources/logo.png��6   $��10q�5      $
��Left=�5      �� 5   
   $��0��6   $.��(Стрелковый клуб Булат��6!   $��2��6?   $��Center=�5       $��Center=�5!      $��20(�5#      $
��Bold"�5$      �� 5%   
   -   5         ��Name$ TextBlockOrderNumber��5&   *   $��Бронь №��5%      $��1��6%   $��0��62   $��2��5&      $��Center=�5'      $��Center=�5(      $��20(�5)      $
��Bold"�5*      �� 5,   
   $'��!Дата бронирования��6   $��2��6.   $��0��6;   $
��Left=�5-      $��60 0 0 0q�6/   $��Center=�5.       $   MaterialDesignSubtitle2TextBlock#��[  5/      $
��Bold"�50      �� 55   
   $��2��6   $��1��6"    �� Orientation$ 
Horizontal=�62   $��Center=�6K   .+�56      (  "System.Windows.Controls.DatePicker  -   5          Name$ DatePickerDate��56   %   $	��200��6   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Выберите дату��57       $  MaterialDesignOutlinedDatePicker#��[ 58      )  #MaterialDesignThemes.Wpf.TimePicker  59      -   5        	  Name$	 TimePickerTime��59   (   $	��200��6@   $" Выберите время ��5:   $    $  MaterialDesignOutlinedTimePicker#��[ 5;   $   
   	Is24Hours
 . 6^   �� 5<      -   5        $ TextBlockAnswer��5<      $��Center=�61    " MaterialDesignCaptionTextBlock#���  6L   5=      �� 5?   
   $ 
Horizontal=�6   $��3��6.   �� 5@   
   -   5         ��Name$ ListBoxOrderProducts��5@      $��Visible=�5A       �� SelectedValuePath$	 Key��5B      $��3��5C      $��0��6   $��2��5D       " MaterialDesignCardsListBoxItem#��[ 5E      ��5F      �� 5G      .R�5H      � $��Stretch=�6    � UseLayoutRounding .  5I      �� 5K      $��60 �6/   �� 5L      $��* �6/   �� 5M      $��80 �6/   �� 5N      $��60 �6/   .+�5P      ��  ��Name$ 	BtnDelete��6!   -   5        $��3��5P   5   $��0q�6E     MaterialDesignFlatButton#��[ 6Q   $��0q�5T   !   ��5Q   !   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Delete=�
 � Tag 5S   !   ��  �� Path$	 Key�5T   !   �� 5U      $��0��6    $��60��60   $��40��6;   $��Uniform=�5V       $��5 0 5 0q�5X       ��5W       �� $ Key.Weapon.GetPhoto�5X       �� 5Y      $��1��6%   .+�5Z      �� $��2q�6(   $��16(�63   #��[  5[   k   $
��Auto��5\   (   $
��Left=�65   ��5[   (   �� $ Key.Weapon.Title� �� StringFormat$ Оружие: {0}��5\   5   �� 5]      $��2q�6(   $��16(�63   #��[  5^   l   $
��Auto��5_   (   $
��Left=�65   ��5^   (   �� $ Key.Service.Title�$ Услуга: {0}��5_   5   �� 5a      $��2q�6(   $��16(�63   $
��Auto��5c   ,   $
��Left=�69   ��5b   ,   �� $ 	Key.Price�$  Стоимость: {0:с}�� �� ConverterCulture$ ru-RU��5c   9   �� 5f      $ 
Horizontal=�6)   .+�5g   "   �� $��14(�6,   $��количество:��6:   $
��Left=�5h   ,   �� 5i   "   -   5        $��16(�5i   *   $
��Bold"�6[   $��60��5j   *   $
��Left=�65   ��5i   8   �� $ Value.Count� 5k   *   �� $	 Key�5m   *   5n      �� 5p      $��16(�6(   $	��300��5r   (   $
��Left=�64   ��5q   (   �� $ Value.Total�$  итого: {0:F2} руб.��5r   4   5s      5u      5v      5x      �� 5z   
   -   5        $ TextBlockTotalCost��5z      $��4��60   $��2��6=    $  MaterialDesignHeadline6TextBlock#��[ 6Q   $��20 0 0 0q�6�   �� 5{   
   $ 
Horizontal=�6   $��5��6.   $��2��5|      $��Center=�6)   .+�5}      �� -	   5        $ BtnOk��5      $	��100��5}      $��30��6!   $��Закрыть��5~      5�      �� 5�      -
   5        $ 
BtnBuyItem��5�      $��Оформить��6*   $	��110��5�      6"   5�      5�      5�      