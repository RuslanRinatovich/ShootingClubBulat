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
    /// Логика взаимодействия для WeaponsPage.xaml
    /// </summary>
    public partial class WeaponsPage : Page
    {
        int itemCount = 0;
        //List<Product> selectedProducts = new List<Product>();
        public WeaponsPage()
        {
            InitializeComponent();
            List<WeaponType> weaponTypes = ShootingClubEntities.GetContext().WeaponTypes.OrderBy(p => p.WeaponTypeName).ToList();
            weaponTypes.Insert(0, new WeaponType { WeaponTypeID = 0, WeaponTypeName = "Все типы" });
            ComboSortWeaponType.ItemsSource = weaponTypes;
        }

        private void WeaponsPage_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            ShootingClubEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            ListViewProducts.ItemsSource = ShootingClubEntities.GetContext().Weapons.OrderBy(p => p.WeaponName).ToList();
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
            itemCount = ListViewProducts.Items.Count;
            TbResultCount.Text = $"Результат запроса: {itemCount} из {itemCount}";
        }

        private void TextBoxWeaponName_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateDate();
        }

        private void ComboSortWeaponType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateDate();
        }
        private void UpdateDate()
        {
            List<Weapon> weapons = ShootingClubEntities.GetContext().Weapons.OrderBy(p => p.WeaponName).ToList();
            // фильтрация
            if (ComboSortWeaponType.SelectedIndex != 0 && ComboSortWeaponType.SelectedItem != null)
                weapons = weapons.Where(p => p.WeaponTypeID == int.Parse(ComboSortWeaponType.SelectedValue.ToString())).ToList();
            // поиск товаров по названию
            weapons = weapons.Where(p => p.WeaponName.ToLower().Contains(TextBoxWeaponName.Text.ToLower())).ToList();
            ListViewProducts.ItemsSource = weapons;
            TbResultCount.Text = $"Результат запроса: {weapons.Count} из {itemCount}";
        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddOrEditWeaponPage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selectedWeapons = ListViewProducts.SelectedItems.Cast<Weapon>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedWeapons.Count()} записей???",
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
                    foreach (Weapon i in selectedWeapons)
                    {
                        ShootingClubEntities.GetContext().Weapons.Remove(i);
                    }
                    //сохраняем изменения
                    ShootingClubEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Weapon> weapons = ShootingClubEntities.GetContext().Weapons.OrderBy(p => p.WeaponName).ToList();
                    ListViewProducts.ItemsSource = null;
                    ListViewProducts.ItemsSource = weapons;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddOrEditWeaponPage((sender as Button).DataContext as Weapon));
        }

        private void ListViewProducts_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {

        }


        //    private void BtnAddProduct_Click(object sender, RoutedEventArgs e)
        //    {
        //        Product product = ListViewProducts.SelectedItem as Product;
        //        if (selectedProducts.FirstOrDefault(p => p.ProductId == product.ProductId) == null)
        //        {
        //            selectedProducts.Add(product);
        //            BtnOrder.Visibility = Visibility.Visible;
        //        }

        //    }

        //    private void BtnOrder_Click(object sender, RoutedEventArgs e)
        //    {
        //        OrderProductsWindow orderProductsWindow = new OrderProductsWindow(selectedProducts, BtnOrder);
        //        orderProductsWindow.Show();
        //    }
    }
}

