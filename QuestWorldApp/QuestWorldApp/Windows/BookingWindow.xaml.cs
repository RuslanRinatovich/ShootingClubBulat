﻿using QuestWorldApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QuestWorldApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для BookingWindow.xaml
    /// </summary>
    public partial class BookingWindow : Window
    {
        Weapon currentQuest = new Weapon();
        public BookingWindow(Weapon quest)
        {
            InitializeComponent();
            currentQuest = quest;
            ComboBoxTimeSheet.ItemsSource = ShootingClubBDEntities.GetContext().TimeSheets.Where(p => p.QuestId == quest.Id && p.Orders.Count == 0).ToList();
            if (Manager.CurrentUser != null)
            {
                TbPhone.Text = Manager.CurrentUser.Phone;
                TbTitle.Text = Manager.CurrentUser.Username;
            }
        }

        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(TbTitle.Text))
                s.AppendLine("Поле имя пустое");
            if (!TbPhone.IsMaskFull)
                s.AppendLine("Укажите телефон");
             if (ComboBoxTimeSheet.SelectedIndex == -1)
                s.AppendLine("Выберите дату и время");
          
            return s;
        }
        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            try
            {

                Order booking = new Order();
                booking.TimeSheetId = Convert.ToInt32(ComboBoxTimeSheet.SelectedValue);
                booking.UserInfo = TbTitle.Text;
                booking.Phone = TbPhone.Text;
                booking.Payed = false;
                if (Manager.CurrentUser != null)

                    booking.Username = Manager.CurrentUser.Username;
                ShootingClubBDEntities.GetContext().Orders.Add(booking);
                ShootingClubBDEntities.GetContext().SaveChanges();
                MessageBox.Show("Забронировано");
                DialogResult = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void ComboBoxTimeSheet_SelectionChanged(object sender, SelectionChangedEventArgs e)

        {if (ComboBoxTimeSheet.SelectedIndex == -1)
                return;
            int id = Convert.ToInt32(ComboBoxTimeSheet.SelectedValue);
            TimeSheet timeSheet = ShootingClubBDEntities.GetContext().TimeSheets.FirstOrDefault(p => p.Id == id);
            double price = 0;
            if (timeSheet != null)
                price = timeSheet.Price;
            TextBlockPrice.Text = price.ToString("c");

        }
    }
}
