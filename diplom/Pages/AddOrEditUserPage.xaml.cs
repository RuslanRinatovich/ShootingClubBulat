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
    /// Логика взаимодействия для AddOrEditUserPage.xaml
    /// </summary>
    public partial class AddOrEditUserPage : Page
    {
        User _currentUser = new User();
        public AddOrEditUserPage(User user)
        {
            InitializeComponent();
            if (user != null)
            {
                _currentUser = user;
            }
            ComboBoxRole.ItemsSource = ShootingClubEntities.GetContext().Roles.ToList().OrderBy(p => p.RoleID);
            DataContext = _currentUser;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckField();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }

//            _currentUser. = service.ServiceID;
//;
            try
            {
                
                if (_currentUser.UserID == 0)
                {
                    ShootingClubEntities.GetContext().Users.Add(_currentUser);
                }
                ShootingClubEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись изменена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }
        private StringBuilder CheckField()
        {
        StringBuilder s = new StringBuilder();
        return s;
        }
    }
}
