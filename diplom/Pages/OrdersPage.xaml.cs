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
using System.Windows.Navigation;
using System.Windows.Shapes;
using ShootingClub.Entities;

namespace ShootingClub.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        public OrdersPage()
        {
            InitializeComponent();
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в CreateOrderPage
            Manager.MainFrame.Navigate(new CreateOrderPage((sender as Button).DataContext as Order));
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                DataGridOrders.ItemsSource = null;
                //загрузка обновленных данных
                ShootingClubEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                List<Order> orders = ShootingClubEntities.GetContext().Orders.OrderBy(p => p.OrderCreationDateTime).ToList();
                DataGridOrders.ItemsSource = orders;
            }
        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие CreateOrderPage для добавления новой записи
            //Manager.MainFrame.Navigate(new AddProductPage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selectedOrders = DataGridOrders.SelectedItems.Cast<Order>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedOrders.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    //// берем из списка удаляемых товаров один элемент
                    //Order x = selectedOrders[0];
                    //// проверка, есть ли у товара в таблице о продажах связанные записи
                    //// если да, то выбрасывается исключение и удаление прерывается
                    //if (x.OrderProducts.Count > 0)
                    //    throw new Exception("Есть записи в продажах");

                    //ShootingClubEntities.GetContext().Orders.Remove(x);
                    foreach (Order i in selectedOrders)
                    {
                        ShootingClubEntities.GetContext().Orders.Remove(i);
                    }
                    //сохраняем изменения
                    ShootingClubEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Order> orders = ShootingClubEntities.GetContext().Orders.OrderBy(p => p.OrderCreationDateTime).ToList();
                    DataGridOrders.ItemsSource = null;
                    DataGridOrders.ItemsSource = orders;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // отображение номеров строк в DataGrid
        private void DataGridOrdersLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

    }
}
