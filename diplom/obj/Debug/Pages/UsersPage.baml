   M S B A M L   `   `   `  ����G  CShootingClub, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ShootingClub.PagesShootingClub.Pages  5      "    ShootingClub.Pages.UsersPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ShootingClub.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5          N� Title$  	UsersPage��5
      .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ DataGridUsers��5      $��0��6*      AutoGenerateColumns .     
IsReadOnly .    	RowHeight$ 50Q�5         SelectionMode$ Single=�5         Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6@   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6%   �� *UserID+6@     5      $ Роль��6G   	 6%   �� *Role.RoleName+6G     5      $ Имя��6B   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 2* 6O   	 6%   �� *
UserName+6O     5      $ Фамилия��6E   $
 * 6V   	 6%   �� *UserSurname+6V     5      $ Отчество��6H   $
 * 6Z   	 6%   �� *UserPatronymic+6Z     5      $ 
Логин��6C   $
 * 6R   	 6%   �� *	UserLogin+6R     5      $ Пароль��6F   $
 * 6V   	 6%   �� *UserPassword+6V   4  .System.Windows.Controls.DataGridTemplateColumn  5      $

 auto 6)   $  Редактировать��66      CellTemplate 5      �� 5       .R�5!      ��  ��Name$ BtnEdit��6%   -   5        $	��...��5!   6   $��0q�6X   5"      5$      5&      �� 5'   
   -   5        $ BtnAdd��5'      $��1��6!   $	��100��6.   $
��Left=�6:   $��3q�6U   $��Добавить��5(      6$   �� 5)   
   -   5        $ 	BtnDelete��5)      $��1��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5*      6#   5+      5,      