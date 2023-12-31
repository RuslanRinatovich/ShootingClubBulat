﻿using QuestWorldApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QuestWorldApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для BookingPage.xaml
    /// </summary>
    public partial class BookingPage : Page
    {
        int _itemcount = 0;
        public BookingPage()
        {
            InitializeComponent();
        }



        void LoadData()
        {
            try
            {
                DataGridGood.ItemsSource = null;
                //загрузка обновленных данных
                ShootingClubBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                List<Order> goods = ShootingClubBDEntities.GetContext().Orders.OrderBy(p => p.DateOrder).ToList();
                DataGridGood.ItemsSource = goods;
                _itemcount = goods.Count;
                TextBlockCount.Text = $" Результат запроса: {goods.Count} записей из {goods.Count}";
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }


        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

     

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            Order selected = (sender as Button).DataContext as Order;
           
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {

                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    ShootingClubBDEntities.GetContext().OrderServices.RemoveRange(selected.OrderServices);

                    ShootingClubBDEntities.GetContext().Orders.Remove(selected);
                    //сохраняем изменения
                    ShootingClubBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // отображение номеров строк в DataGrid
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }
        // Поиск товаров конкретного производителя
        private void ComboTypeSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем текущие данные из бд
            string username = Manager.CurrentUser.Username;
            var currentGoods = ShootingClubBDEntities.GetContext().Orders.Where(p => p.Username == username).OrderBy(p => p.DateOrder).ToList();
            // выбор только тех товаров, по определенному диапазону скидки

            currentGoods = currentGoods.Where(p => p.User.GetFIO.ToLower().Contains(TBoxSearch.Text.ToLower()) ||
            p.Id.ToString().ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            // сортировка
            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentGoods = currentGoods.OrderBy(p => p.DateOrder).ToList();
                // сортировка по убыванию цены
                if (ComboSort.SelectedIndex == 1)
                    currentGoods = currentGoods.OrderByDescending(p => p.DateOrder).ToList();
            }
            // В качестве источника данных присваиваем список данных
            DataGridGood.ItemsSource = currentGoods;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentGoods.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnShow_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ShowOrderPage((sender as Button).DataContext as Order));



        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            //    //  если ни одного объекта не выделено, выходим
            //    if (DataGridGood.SelectedItem == null) return;
            //    // получаем выделенный объект
            //    Organizer selected = DataGridGood.SelectedItem as Organizer;

            //    OrganizerWindow window = new OrganizerWindow(selected);


            //    if (window.ShowDialog() == true)
            //    {
            //        if (window.currentItem != null)
            //        {
            //            ShootingClubBDEntities.GetContext().Entry(window.currentItem).State = EntityState.Modified;
            //            ShootingClubBDEntities.GetContext().SaveChanges();
            //            LoadData();
            //            MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
            //        }
            //    }
            //    else
            //    {
            //        ShootingClubBDEntities.GetContext().Entry(window.currentItem).Reload();
            //        LoadData();
            //    }
            //}
            //catch
            //{
            //    MessageBox.Show("Ошибка");
            //}
        }

        private void ToggleButton_Click(object sender, RoutedEventArgs e)
        {
            Order selected = (sender as ToggleButton).DataContext as Order;

            if ((sender as ToggleButton).IsChecked == true)
            {
                selected.Paid = true;
                ShootingClubBDEntities.GetContext().SaveChanges();

            }
            else
            {
                selected.Paid = false;
                ShootingClubBDEntities.GetContext().SaveChanges();
            }

        }
    }
}