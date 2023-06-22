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
using ShootingClub.Pages;

namespace ShootingClub
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private User _currentUser = new User();
        public MainWindow(User user)
        {
            InitializeComponent();

            if (user != null)
            {
                Manager.UserInfo = user;
                _currentUser = user;
                TbUserName.Text = $"Вы вошли как {user.UserSurname} {user.UserName} {user.UserPatronymic}";
            }
            else 
            {
                Manager.UserInfo = new User();
            }
            MainFrame.Content = new ServicesPage();
            Manager.MainFrame = MainFrame;
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы хотите закрыть приложение?", "Exit", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (result == MessageBoxResult.Cancel)
                e.Cancel = true;
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            Close();
            Owner.Show();
            // Application.Current.Shutdown();
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            
            if (Manager.UserInfo.RoleID != 3)
            {
                BtnPricelists.Visibility = Visibility.Visible;
                BtnOrders.Visibility = Visibility.Visible;
                BtnUsers.Visibility = Visibility.Visible;
                BtnServices.Visibility = Visibility.Visible;
                BtnWeapons.Visibility = Visibility.Visible;
                
            }
            else 
            {
                BtnPricelists.Visibility = Visibility.Collapsed;
                BtnOrders.Visibility = Visibility.Collapsed;
                BtnUsers.Visibility = Visibility.Collapsed;
                BtnServices.Visibility = Visibility.Visible;
                BtnWeapons.Visibility = Visibility.Visible;
            }
            if (MainFrame.CanGoBack)
            {

                BtnBack.Visibility = Visibility.Visible;

                BtnPricelists.Visibility = Visibility.Collapsed;
                BtnOrders.Visibility = Visibility.Collapsed;
                BtnUsers.Visibility = Visibility.Collapsed;
                BtnServices.Visibility = Visibility.Collapsed;
                BtnWeapons.Visibility = Visibility.Collapsed;
            }
            else
            {
                BtnBack.Visibility = Visibility.Collapsed;

                if (Manager.UserInfo.RoleID != 3)
                {
                    BtnPricelists.Visibility = Visibility.Visible;
                    BtnOrders.Visibility = Visibility.Visible;
                    BtnUsers.Visibility = Visibility.Visible;
                    BtnServices.Visibility = Visibility.Visible;
                    BtnWeapons.Visibility = Visibility.Visible;

                }
                else
                {
                    BtnPricelists.Visibility = Visibility.Collapsed;
                    BtnOrders.Visibility = Visibility.Collapsed;
                    BtnUsers.Visibility = Visibility.Collapsed;
                    BtnServices.Visibility = Visibility.Visible;
                    BtnWeapons.Visibility = Visibility.Visible;
                }
                //BtnPricelists.Visibility = Visibility.Visible;
                //BtnOrders.Visibility = Visibility.Visible;
                //BtnUsers.Visibility = Visibility.Visible;
                //BtnServices.Visibility = Visibility.Visible;
                //BtnWeapons.Visibility = Visibility.Visible;
            }
        }

        private void BtnServices_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new ServicesPage();
        }

        private void BtnWeapons_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new WeaponsPage();
        }
        private void BtnOrders_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new OrdersPage();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.GoBack();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Manager.UserInfo = _currentUser;
        }

        private void BtnUsers_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new UsersPage();
        }

        private void BtnPricelists_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new PricelistsPage();
        }

        private void BtnBasket_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new CreateOrderPage();
        }
    }
}
