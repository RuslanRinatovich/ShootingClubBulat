   M S B A M L   `   `   `  ����H  DQuestWorldApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:QuestWorldAppQuestWorldApp  5   	       QuestWorldApp.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:QuestWorldApp     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5        $	��450��5   	   $	��800��6     � WindowStartupLocation$  CenterScreen=�5   !    � Title 5	      ��  �� ElementName$ 	MainFrame�� �� Path$ Content.Title�.��5      �  � RowDefinitions 5   
   �� 5      $��75 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � (  "MaterialDesignThemes.Wpf.ColorZone  5   
   $��16q�6&   }�.     Mode$ PrimaryDark=�5      .��5      ]� .+�5      ��  �� Orientation$ 
Horizontal=�6!   $
��Left=�6:   $
��Left=�6P   .+�5      �� $1��+/QuestWorldApp;component/Resources/logo.png��6   $
��Left=�5      $��55��6+   $��63��67   �� 5      $
��16,0q�6&   $��Center=�6:   $2��,Стрелковый клуб ''Булат''��6W    $   MaterialDesignHeadline5TextBlock#��[  6x   �� 5      -   5         ��Name$ 	BtnQuests��5       � ToolTip$ Оружие��5         MaterialDesignFlatButton#��[ 6.   $y�	Collapsed=�5!   V   ��6   0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Pistol=�
   Size$
 24X�6V   �� 5#      -   5        $ 
BtnBooking��5#      $y�	Collapsed=�6K   $ Бронирование��5$      #��[ 64   ��5%        $	 BookAccount=�$
 24X��� 5(      -   5        $ BtnUsers��5(      $ Пользователи��6G   #��[ 5)      $y�	Collapsed=�6P   ��5*        $	 People=�$
 24X��� 5.      -   5        $ BtnMyBooking��5.      $y�	Collapsed=�6N   $ Мои брони��5/      #��[ 50      ��51        $
	 Book=�$
 24X��� 54      -   5        $ BtnBack��54      $ 
Назад��6D   $y�	Collapsed=�6U   #��[ 6l   ��55        $	 	ArrowBack=�$
 24X�58      �� 59      $��Right=�6   $ 
Horizontal=�64   $��Right=�6M   .+�5;      �� -   5        $ BtnMyAccount��5;      $ Мой профиль��6O   #��[ 5<      $y�	Collapsed=�6P   ��5=        $	 Account=�$
 24X��� 5?      -   5         ��Name$ TextBlockUser��5?       $��Center=�67    $  MaterialDesignHeadline6TextBlock#��[ 6R   �� 5@      -	   5        $ BtnEnter��5@      $ 
Войти��5A      #��[ 6-   $��60��5B      .��5C      '  !MaterialDesignThemes.Wpf.PackIcon  -
   5          Name$ 
IconBtnKey��5C   2      Kind$ Login=�6G   $��0q�6T   5D      5E      5F      5G       � 5J   
   -   5          �Name$ 	MainFrame��5J      $��1��6#     � NavigationUIVisibility$ Hidden=�5K      $��1q�5L      6$   �� 5N   
   $��2��6      MaterialDesignDarkBackground#��[ 6!   5P      5Q      