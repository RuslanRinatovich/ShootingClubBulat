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
using ShootingClub.Entities;

namespace ShootingClub.Windows
{
    /// <summary>
    /// Логика взаимодействия для LoginWIndow.xaml
    /// </summary>
    public partial class LoginWIndow : Window
    {
        public LoginWIndow()
        {
            InitializeComponent();
        }
        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                List<User> users = ShootingClubEntities.GetContext().Users.ToList();
                User user = users.FirstOrDefault(p => p.UserLogin == TBoxLogin.Text && p.UserPassword == TBoxPass.Password);
                if (user != null)
                {
                    Manager.UserInfo = user;
                    MainWindow mainWindow = new MainWindow(user);
                    mainWindow.Owner = this;
                    Hide();
                    mainWindow.Show();
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль");
                }
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void BtnGuestMode_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow(null);
            mainWindow.Owner = this;
            Hide();
            mainWindow.Show();
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
