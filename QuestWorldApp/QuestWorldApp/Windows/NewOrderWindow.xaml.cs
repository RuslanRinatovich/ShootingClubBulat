using QuestWorldApp.Models;
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
    /// Логика взаимодействия для NewOrderWindow.xaml
    /// </summary>
    public partial class NewOrderWindow : Window
    {
        public struct BuyItem
        {
            public int Count { get; set; }
            public double Total { get; set; }
        }
        Order _currentOrder;
        User _currentUser;
        public NewOrderWindow()
        {
            InitializeComponent();
            LoadDataAndInit();
        }

        /// <summary>
        /// Загрузка и инициализация полей
        /// </summary>
        void LoadDataAndInit()
        {
            // источник данных корзина
            ListBoxOrderProducts.ItemsSource = Basket.GetBasket;
            // создаем новый заказ
            _currentOrder = CreateNewOrder();
            // текущий пользователь
            _currentUser = Manager.CurrentUser;
            TextBlockOrderNumber.Text = $"Бронь №{_currentOrder.Id} на имя " +
                    $"{ _currentUser.LastName} {_currentUser.FirstName}";
           
           
            TextBlockTotalCost.Text = $"Итого {Basket.GetTotalCost:C}";
            DatePickerDate.SelectedDate = DateTime.Today;
            TimePickerTime.SelectedTime = DateTime.Now;
            //TextBlockOrderCreateDate.Text = _currentOrder.DateOrder.ToLongDateString();
            
        }

        /// <summary>
        /// Создает новый заказ
        /// </summary>
        /// <returns>новый заказ Order</returns>
        static Order CreateNewOrder()
        {
            Order order = new Order();
            int k = ShootingClubBDEntities.GetContext().Orders.Count();
            order.Id = 1;
            if (k > 0)
                order.Id = ShootingClubBDEntities.GetContext().Orders.Max(p => p.Id) + 1;

        
            order.DateOrder = DateTime.Now;


            return order;
        }



        private void BtnOkClick(object sender, RoutedEventArgs e)
        {

            this.Close();
        }
        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить товар из корзины???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                if (ListBoxOrderProducts.SelectedIndex >= 0)
                {
                    var x = (ListBoxOrderProducts.SelectedValue as Pricelist);
                    Basket.DeleteProductFromBasket(x);
                    ListBoxOrderProducts.Items.Refresh();
                    TextBlockTotalCost.Text = $"Итого {Basket.GetTotalCost:C}";
                }
            }

        }

        // проверка данных в поле количество
        private void TextBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Return) // при нажатии на кнопку Enter
            {
                TextBox textBox = sender as TextBox;
                int k = ListBoxOrderProducts.SelectedIndex;

                if (!string.IsNullOrWhiteSpace(textBox.Text))
                {
                    int x = 0;
                    if (!int.TryParse(textBox.Text, out x))
                    {
                        MessageBox.Show("Количество только число");
                        return;
                    }
                    x = Convert.ToInt32(textBox.Text);
                    if (x < 0)
                    {
                        MessageBox.Show("Количество не может быть отрицательным");
                    }
                    else if (x == 0)
                    {
                        Pricelist product = textBox.Tag as Pricelist;
                        MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {product.Service.Title} из корзины???",
                            "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
                        if (messageBoxResult == MessageBoxResult.OK)
                        {
                            Basket.DeleteProductFromBasket(product);
                            ListBoxOrderProducts.Items.Refresh();
                            ListBoxOrderProducts.SelectedIndex = k;
                        }

                    }
                    else
                    {
                        Pricelist product = textBox.Tag as Pricelist;
                        Basket.SetCount(product, x);
                        ListBoxOrderProducts.Items.Refresh();
                        ListBoxOrderProducts.SelectedIndex = k;
                    }
                }
            }
            if (e.Key == Key.Escape) // клавиша ESC
            {
                int k = ListBoxOrderProducts.SelectedIndex;
                ListBoxOrderProducts.Items.Refresh();
                ListBoxOrderProducts.SelectedIndex = k;
            }
            TextBlockTotalCost.Text = $"Итого {Basket.GetTotalCost:C}";

        }

        // В поле количество можно вводить только цифры
        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !char.IsDigit(e.Text, 0);
        }

        // кнопка оформить покупку
        private void BtnBuyItem_Click(object sender, RoutedEventArgs e)
        {
            
            if (ListBoxOrderProducts.Items.Count == 0)
            {
                MessageBox.Show("Корзина пуста");
                return;
            }

            int day = DatePickerDate.SelectedDate.Value.Date.Day;
            int month = DatePickerDate.SelectedDate.Value.Date.Month;
            int year = DatePickerDate.SelectedDate.Value.Date.Year;

            int hours = TimePickerTime.SelectedTime.Value.Hour;
            int minutes = TimePickerTime.SelectedTime.Value.Minute;
            int seconds = TimePickerTime.SelectedTime.Value.Second;
            DateTime date = new DateTime(year, month, day, hours, minutes, seconds);
            _currentOrder.DateOrder = date;
            _currentOrder.Username = Manager.CurrentUser.Username;
            _currentOrder.Total = Convert.ToInt32(Basket.GetTotalCost);
            MessageBoxResult messageBoxResult = MessageBox.Show($"Оформить бронь???",
                "Оформление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {

                ShootingClubBDEntities.GetContext().Orders.Add(_currentOrder);
                //формируем данные в OrderProduct (товары заказа)
                foreach (var item in Basket.GetBasket)
                {
                    OrderService orderService = new OrderService();
                    orderService.OrderId = _currentOrder.Id;
                    orderService.PriceListId = item.Key.Id;
                    orderService.Count = item.Value.Count;

                    ShootingClubBDEntities.GetContext().OrderServices.Add(orderService);
                }
                ShootingClubBDEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                // показываем талон заказа в новом окне 
                OrderTicketWindow orderTicketWindow = new OrderTicketWindow(_currentOrder);
                orderTicketWindow.ShowDialog();

                // очищаем корзину
                Basket.ClearBasket();
                this.Close();
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары

            // вывод сообщения с вопросом Удалить запись?
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить услугу из корзины???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                Button button = sender as Button;

                Pricelist product = button.Tag as Pricelist;

                Basket.DeleteProductFromBasket(product);
                ListBoxOrderProducts.Items.Refresh();
                TextBlockTotalCost.Text = $"Итого {Basket.GetTotalCost:C}";

            }
        }

       
    }
}
