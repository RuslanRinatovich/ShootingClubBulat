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
    /// Логика взаимодействия для AddOrEditPricelistPage.xaml
    /// </summary>
    public partial class AddOrEditPricelistPage : Page
    {
        Pricelist _currentPricelist = new Pricelist();
        public AddOrEditPricelistPage(Pricelist pricelist)
        {
            InitializeComponent();

            if (pricelist != null)
            {
                _currentPricelist = pricelist;
            }
            DataContext = _currentPricelist;
            LoadAndInitData();
        }

        void LoadAndInitData()
        {
            ComboBoxService.ItemsSource = ShootingClubEntities.GetContext().Services.ToList().OrderBy(p => p.ServiceName);
            ComboBoxWeapon.ItemsSource = ShootingClubEntities.GetContext().Weapons.ToList().OrderBy(p => p.WeaponName);



        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            // проверка полей прошла успешно
            // если товар новый, то его ID == 0
            try
            {
                if (_currentPricelist.PricelistID == 0)
                {
                    // добавляем товар в БД
                    ShootingClubEntities.GetContext().Pricelists.Add(_currentPricelist);
                }

                ShootingClubEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                MessageBox.Show("Запись Изменена");
                Manager.MainFrame.GoBack();  // Возвращаемся на предыдущую форму
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

        }
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (ComboBoxService.SelectedItem == null)
                s.AppendLine("Выберите вид услуги");
            if (ComboBoxService.SelectedItem == null)
                s.AppendLine("Выберите оружие");
            if (_currentPricelist.Price < 0)
                s.AppendLine("Стоимость не может быть отрицательной");
            return s;
        }
    }
}