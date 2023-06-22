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
    /// Логика взаимодействия для AddOrEditServicePage.xaml
    /// </summary>
    public partial class AddOrEditServicePage : Page
    {
        // текущий товар
        private Service _currentService = new Service();
        // путь к файлу
        //private string _filePath = null;
        //// назание текущей главной фотографии
        //private string _photoName = null;
        //// текущая папка приложения
        //private static string _currentDirectory = Directory.GetCurrentDirectory() + @"/Images/";

        public AddOrEditServicePage(Service service)
        {
            InitializeComponent();
            if (service != null)
            {
                _currentService = service;
            }
            DataContext = _currentService;
            //_photoName = _currentService.ProductPhoto;
            //ComboPovider.ItemsSource = TradeEntities.GetContext().ProductProviders.ToList();
            //ComboProductType.ItemsSource = TradeEntities.GetContext().ProductTypes.ToList();

        }

        //private void BtnLoadPhoto_Click(object sender, RoutedEventArgs e)
        //{
        //    try
        //    {
        //        OpenFileDialog openFileDialog = new OpenFileDialog() { Title = "Загрузить", Filter = "Image Files|*.png;*.jpg;*.gif;*.jpeg" };
        //        if (openFileDialog.ShowDialog() == true)
        //        {
        //            // проверка на размерность файла
        //            FileInfo fileInfo = new FileInfo(openFileDialog.FileName);
        //            if (fileInfo.Length > 1024 * 1024 * 2)
        //                throw new Exception("Размер файла не более 2 МБ");

        //            ProductImage.Source = new BitmapImage(new Uri(openFileDialog.FileName));
        //            _photoName = openFileDialog.SafeFileName;
        //            _filePath = openFileDialog.FileName;
        //        }
        //    }
        //    catch (Exception ex) { MessageBox.Show(ex.Message); }

        //}


        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckField();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            if (_currentService.ServiceID == 0)
            {
                ShootingClubEntities.GetContext().Services.Add(_currentService);
            }
            ShootingClubEntities.GetContext().SaveChanges();
            MessageBox.Show("Запись изменена");
            Manager.MainFrame.GoBack();

            //try
            //{
            //    //if (_filePath != null)
            //    //{
            //    //    string photo = ChangePhotoName();
            //    //    // путь, куда нужно скопировать файл
            //    //    string dest = _currentDirectory + photo;
            //    //    File.Copy(_filePath, dest);
            //    //    _currentService.ProductPhoto = photo;
            //    //}
            //    if (_currentService.ServiceID == 0)
            //    {
            //        ShootingClubEntities.GetContext().Services.Add(_currentService);
            //    }
            //    ShootingClubEntities.GetContext().SaveChanges();
            //    MessageBox.Show("Запись изменена");
            //    Manager.MainFrame.GoBack();
            //}
            //catch (Exception ex) { MessageBox.Show(ex.Message); }

        }
        private StringBuilder CheckField()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentService.ServiceName))
                s.AppendLine("Введите наименование услуги");
            return s;
        }
        //private string ChangePhotoName()
        //{
        //    string x = _currentDirectory + _photoName;
        //    string photoName = _photoName;
        //    int i = 0;
        //    if (File.Exists(x))
        //    {
        //        while (File.Exists(x))
        //        {
        //            i++;
        //            x = _currentDirectory + i.ToString() + photoName;
        //        }
        //        photoName = i.ToString() + photoName;
        //    }
        //    return photoName;
        //}
    }
}