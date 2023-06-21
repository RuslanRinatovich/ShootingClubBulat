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
    /// Логика взаимодействия для TimeSheetWindow.xaml
    /// </summary>
    public partial class TimeSheetWindow : Window
    {
        public Pricelist currentItem { get; private set; }
        Weapon weapon;


        public TimeSheetWindow(Pricelist p, Weapon g)
        {
            InitializeComponent();


            List<Service> services = ShootingClubBDEntities.GetContext().Services.OrderBy(x => x.Title).ToList();
            currentItem = p;
            currentItem.WeaponId = g.Id;

            ComboService.ItemsSource = services;
            DataContext = currentItem;

        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();


            if (ComboService.SelectedIndex == -1)
                s.AppendLine("Не выбрана услуга");

            return s;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }

            currentItem.ServiceId = (ComboService.SelectedItem as Service).Id;
            this.DialogResult = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if (currentItem.Id != 0)
            {
                Service s = ShootingClubBDEntities.GetContext().Services.FirstOrDefault(x => x.Id == currentItem.ServiceId);
                
                ComboService.Text = s.Title;
            }
        }

    }
}