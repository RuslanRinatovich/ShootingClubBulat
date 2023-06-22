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
    /// Логика взаимодействия для CreateOrderPage.xaml
    /// </summary>
    public partial class CreateOrderPage : Page
    {
        Order _currentOrder;
        User _currentUser;
        Service _orderedService;
        public CreateOrderPage(Order order)
        {
            InitializeComponent();
            _currentOrder = order;
            LoadDataAndInit();
        }
        public CreateOrderPage(Service service)
        {
            InitializeComponent();
            _orderedService = service;
            LoadDataAndInit();
        }
        public CreateOrderPage()
        {
            InitializeComponent();
            LoadDataAndInit();
        }
        /// <summary>
        /// Загрузка и инициализация полей
        /// </summary>
        void LoadDataAndInit()
        {

            // источник данных 
            ListViewProducts.ItemsSource = Basket.GetBasket;
            // создаем новый заказ
            if (_currentOrder == null)
            {
                _currentOrder = CreateNewOrder();
            }
            // текущий пользователь
            _currentUser = Manager.UserInfo;
            if (_currentUser != null)
            {
                TextBlockOrderNumber.Text = $"Заказ №{_currentOrder.OrderID} на имя " +
                    $"{ _currentUser.UserSurname} {_currentUser.UserName} {_currentUser.UserPatronymic}";
            }
            else
            {
                TextBlockOrderNumber.Text = $"Заказ №{_currentOrder.OrderID}";
            }
            //TextBlockServiceName.Text = $"Наименование: {_orderedService.ServiceName}";
            //TextBlockServiceDescription.Text = $"Описание: {_orderedService.ServiceDescription}";
            //TextBlockServicePrice.Text = $"{_orderedService.ServicePrice:f0} р.";
            TextBlockOrderCreationDate.Text = _currentOrder.OrderCreationDateTime.ToLongDateString();
            DatePickerOrderFullfilmentDate.Text = _currentOrder.OrderFulfillmentDateTime.ToLongDateString();
            
        }

        /// <summary>
        /// Создает новый заказ
        /// </summary>
        /// <returns>новый заказ Order</returns>
        static Order CreateNewOrder()
        {
            Order order = new Order();
            //order.OrderID = ShootingClubEntities.GetContext().Orders.Max(p => p.OrderID) + 1; 
            order.OrderCreationDateTime = DateTime.Now;
            order.OrderFulfillmentDateTime = DateTime.Now;
            return order;
        }



        private void BtnCloseClick(object sender, RoutedEventArgs e)
        {

            Manager.MainFrame.GoBack();
        }
       

        // проверка данных в поле количество
       

        // В поле количество можно вводить только цифры
        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !char.IsDigit(e.Text, 0);
        }

        // кнопка оформить покупку
        private void BtnCreateOrderClick(object sender, RoutedEventArgs e)
        {

            MessageBoxResult messageBoxResult = MessageBox.Show($"Оформить покупку???",
                "Оформление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            try
            {
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    DateTime dateTime = new DateTime();
                    int hours = 0;
                    hours = ComboBoxOrderFulfillmentTime.SelectedIndex + 8;
                    dateTime = (DateTime)DatePickerOrderFullfilmentDate.SelectedDate;
                    dateTime = dateTime.AddHours(hours);
                    _currentOrder.OrderFulfillmentDateTime = dateTime;
                    _currentOrder.OrderCost = Convert.ToDecimal(Basket.GetTotalCost);
                    _currentOrder.UserID = _currentUser.UserID;
                    // добавляем товар
                    ShootingClubEntities.GetContext().Orders.Add(_currentOrder);
                    foreach (var item in Basket.GetBasket)
                    {
                        OrderService orderService = new OrderService();
                        orderService.OrderID = _currentOrder.OrderID;
                        orderService.PricelistID = item.Key.PricelistID;
                        orderService.Count = Convert.ToByte(item.Value.Count);
                        ShootingClubEntities.GetContext().OrderServices.Add(orderService);
                    }
                    ShootingClubEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                                                                      // показываем талон заказа в новом окне 


                    // очищаем корзину
                    Basket.ClearBasket();

                    ShootingClubEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                    MessageBox.Show("Успешно");
                    Manager.MainFrame.GoBack();

                }
            } catch (Exception ex) { MessageBox.Show(ex.Message); }
            
        }

        private void DatePickerOrderFullfilmentDate_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            //List<DateTime> dateTimes = new List<DateTime>();
            //List<Order> orders = new List<Order>();
            //orders = ShootingClubEntities.GetContext().Orders.ToList();

        }

    }
}


