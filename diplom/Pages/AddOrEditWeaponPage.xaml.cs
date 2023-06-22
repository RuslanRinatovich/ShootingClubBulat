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
using Microsoft.Win32;
using ShootingClub.Entities;
using System.IO;

namespace ShootingClub.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddOrEditWeaponPage.xaml
    /// </summary>
    public partial class AddOrEditWeaponPage : Page
    {
        // текущий товар
        private Weapon _currentWeapon = new Weapon();
        // путь к файлу
        private string _filePath = null;
        // назание текущей главной фотографии
        private string _photoName = null;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Images/";

        public AddOrEditWeaponPage(Weapon weapon)
        {
            InitializeComponent();
            if (weapon != null)
            {
                _currentWeapon = weapon;
            }
            DataContext = _currentWeapon;
            _photoName = _currentWeapon.WeaponImage;
            ComboBoxWeaponType.ItemsSource = ShootingClubEntities.GetContext().WeaponTypes.ToList();
            //ComboPovider.ItemsSource = ShootingClubEntities.GetContext().ProductProviders.ToList();
            //ComboProductType.ItemsSource = ShootingClubEntities.GetContext().ProductTypes.ToList();

        }

        private void BtnLoadPhoto_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog() { Title = "Загрузить", Filter = "Image Files|*.png;*.jpg;*.gif;*.jpeg" };
                if (openFileDialog.ShowDialog() == true)
                {
                    // проверка на размерность файла
                    FileInfo fileInfo = new FileInfo(openFileDialog.FileName);
                    if (fileInfo.Length > 1024 * 1024 * 2)
                        throw new Exception("Размер файла не более 2 МБ");

                    WeaponImage.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                    _photoName = openFileDialog.SafeFileName;
                    _filePath = openFileDialog.FileName;
                }
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }

        }


        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckField();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            try
            {
                _currentWeapon.WeaponTypeID = (ComboBoxWeaponType.SelectedItem as WeaponType).WeaponTypeID;
                if (_filePath != null)
                {
                    string photo = ChangePhotoName();
                    // путь, куда нужно скопировать файл
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentWeapon.WeaponImage = photo;
                }
                if (_currentWeapon.WeaponID == 0)
                {
                    ShootingClubEntities.GetContext().Weapons.Add(_currentWeapon);
                }
                ShootingClubEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись изменена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }

        }
        private StringBuilder CheckField()
        {
            //int countStore = 0;
            //byte discount = 0, maxDiscount = 0;
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentWeapon.WeaponName))
                s.AppendLine("Введите наименование оружия");
            if (ComboBoxWeaponType.SelectedItem == null)
                s.AppendLine("Укажите тип оружия");
            if (string.IsNullOrWhiteSpace(_currentWeapon.WeaponWeight.ToString()))
                s.AppendLine("Укажите массу оружия");
            if (_currentWeapon.WeaponWeight < 0)
                s.AppendLine("Масса оружия не может быть отрицательной");
            if (string.IsNullOrWhiteSpace(_currentWeapon.WeaponCaliber))
                s.AppendLine("Введите калибр оружия");
            if (string.IsNullOrWhiteSpace(_currentWeapon.WeaponClipSize.ToString()))
                s.AppendLine("Укажите размер обоймы");
            if (_currentWeapon.WeaponClipSize < 0)
                s.AppendLine("Размер обоймы не может быть отрицательным");


            return s;
        }
        private string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoName = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoName;
                }
                photoName = i.ToString() + photoName;
            }
            return photoName;
        }
    }
}
    

