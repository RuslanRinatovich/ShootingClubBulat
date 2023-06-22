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
    /// Логика взаимодействия для OrderServicePage.xaml
    /// </summary>
    public partial class OrderServicePage : Page
    {
        Service _selectedService = new Service();
        Pricelist _pricelist;
        WeaponType _selectedWeaponType;
        List<Pricelist> pricelists = new List<Pricelist>();
        public OrderServicePage(Service service)
        {
            InitializeComponent();
            if (service != null)
            {
                _selectedService = service;
            }
            LoadAndInitData();
        }
        void LoadAndInitData()
        {
            ComboBoxService.ItemsSource = ShootingClubEntities.GetContext().Services.ToList().OrderBy(p => p.ServiceName);
            ComboBoxWeaponType.ItemsSource = ShootingClubEntities.GetContext().WeaponTypes.ToList().OrderBy(p => p.WeaponTypeName);
            ComboBoxWeapon.ItemsSource = ShootingClubEntities.GetContext().Weapons.ToList().OrderBy(p => p.WeaponName);
            ComboBoxService.SelectedItem = _selectedService;
        }

        private void BtnAddToBasketClick(object sender, RoutedEventArgs e)
        {
            
            Basket.AddProductInBasket(_pricelist);
            Basket.SetCount(_pricelist, int.Parse(TextBoxTimeAmount.Text));
            MessageBox.Show("Услуга добавлена в корзину");
            Manager.MainFrame.GoBack();
        }

        private void BtnCloseClick(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void TextBoxTimeAmount_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateTotalPrice();
        }
        void UpdateTotalPrice()
        {
            int x = 0;
             if (ComboBoxService.SelectedItem != null &&
                 ComboBoxWeapon.SelectedItem != null &&
                 TextBoxTimeAmount.Text != null &&
                 int.TryParse(TextBoxTimeAmount.Text, out x))
            {
                pricelists = ShootingClubEntities.GetContext().Pricelists.ToList().FindAll(p => p.ServiceID == int.Parse(ComboBoxService.SelectedValue.ToString()));
                _pricelist = pricelists.Find(p => p.WeaponID == int.Parse(ComboBoxWeapon.SelectedValue.ToString()));
                TextBoxTotalCost.Text = $"{_pricelist.Price * x}";
            }
        }

        private void ComboBoxWeaponType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboBoxWeaponType.SelectedItem != null)
            {
                _selectedWeaponType = ComboBoxWeaponType.SelectedItem as WeaponType;
                ComboBoxWeapon.ItemsSource = ShootingClubEntities.GetContext().Weapons.ToList().FindAll(p => p.WeaponTypeID == _selectedWeaponType.WeaponTypeID);
            }
            UpdateTotalPrice();
        }

        private void ComboBoxService_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateTotalPrice();
        }

        private void ComboBoxWeapon_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateTotalPrice();
        }
    }
}
