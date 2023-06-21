using QuestWorldApp.Models;
using QuestWorldApp.Windows;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace QuestWorldApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для TimeSheetPage.xaml
    /// </summary>
    public partial class TimeSheetPage : Page
    {
        List<Pricelist> timeSheets = new List<Pricelist>();
        public TimeSheetPage(Weapon weapon)
        {
            InitializeComponent();
            LoadData(weapon);

        }
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        // загрузка данных в DataGrid и ComboBox
        void LoadData(Weapon weapon)
        {
            timeSheets = ShootingClubBDEntities.GetContext().Pricelists.Where(p => p.WeaponId == weapon.Id).OrderBy(p => p.Weapon.Title).ThenBy(p => p.Price).ToList();
            DtData.ItemsSource = timeSheets;
            ComboQuests.ItemsSource = ShootingClubBDEntities.GetContext().Weapons.OrderBy(p => p.Title).ToList(); ;
            ComboQuests.SelectedIndex = 0;
            ComboQuests.SelectedValue = weapon.Id;
            GridGood.DataContext = weapon;
        }
        // фильтрация продаж по товару
        private void ComboGoodsSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboQuests.SelectedIndex >= 0)
            {
                int questId = Convert.ToInt32(ComboQuests.SelectedValue);
              timeSheets = ShootingClubBDEntities.GetContext().Pricelists.Where(p => p.WeaponId == questId).OrderBy(p => p.Weapon.Title).ThenBy(p => p.Price).ToList();
                DtData.ItemsSource = timeSheets;
                GridGood.DataContext = ComboQuests.SelectedItem;
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (ComboQuests.SelectedIndex == -1)
                {
                    return;
                }
            
                // Открываем окно добавления новой продажи
                Weapon weapon = ComboQuests.SelectedItem as Weapon;
                TimeSheetWindow window = new TimeSheetWindow(new Pricelist(), weapon);
                // если в окне добавления продажи нажата кнопка ОК
                if (window.ShowDialog() == true)
                {
                    // добавляем новую продажу

                    ShootingClubBDEntities.GetContext().Pricelists.Add(window.currentItem);
                    ShootingClubBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    // после добавления продажи
                    // подгружаем измененные данные
                    LoadData(weapon);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void btnChange_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Weapon g = ComboQuests.SelectedItem as Weapon;
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                Pricelist selected = DtData.SelectedItem as Pricelist;

                //    double k = selected.Count;

                TimeSheetWindow window = new TimeSheetWindow(selected, g);

                if (window.ShowDialog() == true)
                {
                    selected = ShootingClubBDEntities.GetContext().Pricelists.Find(window.currentItem.Id);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        ShootingClubBDEntities.GetContext().Entry(selected).State = EntityState.Modified;
                        ShootingClubBDEntities.GetContext().SaveChanges();
                        // LoadData(g);

                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                        LoadData(g);
                        //ComboGoods.SelectedIndex = -1;
                    }
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }


        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Weapon weapon = ComboQuests.SelectedItem as Weapon;

                // если ни одного объекта не выделено, выходим
                if(DtData.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    Pricelist deletedItem = DtData.SelectedItem as Pricelist;
                    ShootingClubBDEntities.GetContext().Pricelists.Remove(deletedItem);
                    ShootingClubBDEntities.GetContext().SaveChanges();


                    LoadData(weapon);
                    MessageBox.Show("Запись удалена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

    }
}

