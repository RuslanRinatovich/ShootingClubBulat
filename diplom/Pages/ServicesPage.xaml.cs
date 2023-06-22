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
    /// Логика взаимодействия для ServicesPage.xaml
    /// </summary>
    public partial class ServicesPage : Page
    {
        int itemCount = 0;
        //List<Product> selectedProducts = new List<Product>();
        public ServicesPage()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            ShootingClubEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            ListViewProducts.ItemsSource = ShootingClubEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
            itemCount = ListViewProducts.Items.Count;
            if (Manager.UserInfo.RoleID == 1)
            {
                BtnAdd.Visibility = Visibility.Visible;
                BtnDelete.Visibility = Visibility.Visible;
            }
            else
            {
                BtnAdd.Visibility = Visibility.Collapsed;
                BtnDelete.Visibility = Visibility.Collapsed;
            }
            TbResultCount.Text = $"Результат запроса: {itemCount} из {itemCount}";
        }

        private void TBoxProductName_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateDate();
        }

        private void ComboSortPrice_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateDate();
        }

        private void ComboSortDiscount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateDate();
        }
        private void UpdateDate()
        {
            List<Service> services = ShootingClubEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
            // фильтрация
            //if (ComboSortDiscount.SelectedIndex == 1)
            //    products = products.Where(p => p.ProductDiscountAmount < 10).ToList();
            //if (ComboSortDiscount.SelectedIndex == 2)
            //    products = products.Where(p => p.ProductDiscountAmount >= 10 && p.ProductDiscountAmount < 15).ToList();
            //if (ComboSortDiscount.SelectedIndex == 3)
            //    products = products.Where(p => p.ProductDiscountAmount >= 15).ToList();
            // поиск товаров по названию
            services = services.Where(p => p.ServiceName.ToLower().Contains(TBoxProductName.Text.ToLower())).ToList();
            // сорировка
            //if (ComboSortPrice.SelectedIndex >= 0)
            //{
            //    if (ComboSortPrice.SelectedIndex == 0)
            //        services = services.OrderBy(p => p.ServicePrice).ToList();
            //    if (ComboSortPrice.SelectedIndex == 1)
            //        services = services.OrderByDescending(p => p.ServicePrice).ToList();
            //}

            ListViewProducts.ItemsSource = services;
            TbResultCount.Text = $"Результат запроса: {services.Count} из {itemCount}";
        }

        private void BtnOrderServiceClick(object sender, RoutedEventArgs e)
        {
            Service service = ListViewProducts.SelectedItem as Service;
            Manager.MainFrame.Content = new OrderServicePage(service);
        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddOrEditServicePage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selectedServices = ListViewProducts.SelectedItems.Cast<Service>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedServices.Count()} записей???",
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
                    foreach (Service i in selectedServices)
                    {
                        ShootingClubEntities.GetContext().Services.Remove(i);
                    }
                    //сохраняем изменения
                    ShootingClubEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Service> services = ShootingClubEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
                    ListViewProducts.ItemsSource = null;
                    ListViewProducts.ItemsSource = services;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

            //private void BtnOrder_Click(object sender, RoutedEventArgs e)
            //{
            //    OrderProductsWindow orderProductsWindow = new OrderProductsWindow(selectedProducts, BtnOrder);
            //    orderProductsWindow.Show();
            //}
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddOrEditServicePage((sender as Button).DataContext as Service));
        }
    }
}

