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
using QuestWorldApp.Models;
using QuestWorldApp.Windows;

namespace QuestWorldApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для QuestCataloguePage.xaml
    /// </summary>
    public partial class QuestCataloguePage : Page
    {
        int _itemcount = 0;
        public QuestCataloguePage()
        {
            InitializeComponent();
            LoadComboBoxItems();
            LoadDataGrid();
        }

        void LoadDataGrid()
        {
            
            List<Weapon> goods = ShootingClubBDEntities.GetContext().Quests.OrderBy(p => p.Title).ToList();
            LViewGoods.ItemsSource = goods;
            _itemcount = goods.Count;
            TextBlockCount.Text = $" Результат запроса: {goods.Count} записей из {goods.Count}";
        }

        void LoadComboBoxItems()
        {
            var categories = ShootingClubBDEntities.GetContext().Categories.OrderBy(p => p.Title).ToList();
            categories.Insert(0, new Category
            {
                Title = "Все виды"
            }
            );
            ComboCategory.ItemsSource = categories;
            ComboCategory.SelectedIndex = 0;

            var ages = ShootingClubBDEntities.GetContext().Ages.OrderBy(p => p.Title).ToList();
            ages.Insert(0, new Age
            {
                Title = "Все возрастные категории"
            }
            );
            ComboAge.ItemsSource = ages;
            ComboAge.SelectedIndex = 0;

            var organizers = ShootingClubBDEntities.GetContext().Organizers.OrderBy(p => p.Title).ToList();
            organizers.Insert(0, new Organizer
            {
                Title = "Все организаторы"
            }
            );
            ComboOrganizer.ItemsSource = organizers;
            ComboOrganizer.SelectedIndex = 0;
        }


        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем текущие данные из бд
            //var currentGoods = DataBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();

            var currentData = ShootingClubBDEntities.GetContext().Quests.OrderBy(p => p.Title).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю


            if (ComboCategory.SelectedIndex > 0)
            {
                int catId = Convert.ToInt32((ComboCategory.SelectedItem as Category).Id);
                List<Weapon> quests = new List<Weapon>();
                foreach (Weapon quest in currentData)
                {
                    List<QuestCategory> questCategories = quest.QuestCategories.ToList();

                    if (questCategories.Any(elem => elem.CategoryId == catId))
                        quests.Add(quest);
                }

                currentData = quests;
            }

            if (ComboAge.SelectedIndex > 0)
                currentData = currentData.Where(p => p.AgeId == (ComboAge.SelectedItem as Age).Id).ToList();
            if (ComboOrganizer.SelectedIndex > 0)
                currentData = currentData.Where(p => p.OrganizerId == (ComboOrganizer.SelectedItem as Organizer).Id).ToList();

            // выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentData = currentData.OrderBy(p => p.Title).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentData = currentData.OrderByDescending(p => p.Title).ToList();
                if (ComboSort.SelectedIndex == 2)
                    currentData = currentData.OrderBy(p => p.GetRate).ToList();
                if (ComboSort.SelectedIndex == 3)
                    currentData = currentData.OrderByDescending(p => p.GetRate).ToList();
                // сортировка по убыванию цены
            }
            // В качестве источника данных присваиваем список данных
            LViewGoods.ItemsSource = currentData;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentData.Count} записей из {_itemcount}";
        }

        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboOrganizer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboCategory_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboAge_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnMoreInfo_Click(object sender, RoutedEventArgs e)
        {
            Weapon quest = (sender as Button).DataContext as Weapon;
            if (quest.Rewiews.Count == 0)
                return;
            //Trainer trainer = YogaFeatPilatesBDEntities.GetContext().Trainers.FirstOrDefault(p => p.Id == edu.TrainerId);
            //List<TimeTable> timeTables = YogaFeatPilatesBDEntities.GetContext().TimeTables.Where(p => p.CategoryTrainerId == edu.Id).ToList();
            //ListBoxTimeTable.ItemsSource = timeTables;
            //TbCategoryName.Text = edu.Category.Name;
            ListBoxRewiews.ItemsSource = quest.Rewiews;
            DialogHostMoreInformation.DataContext = quest;
            DialogHostMoreInformation.IsOpen = true;
        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {

            DialogHostMoreInformation.IsOpen = false;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Weapon quest = (sender as Button).DataContext as Weapon;
            BookingWindow bookingWindow = new BookingWindow(quest);
            bookingWindow.ShowDialog();
        }

        private void BtnMakeRewiew_Click(object sender, RoutedEventArgs e)
        {
            Weapon quest = (sender as Button).DataContext as Weapon;
            MakeRewiewWindow makeRewiew = new MakeRewiewWindow(new Rewiew(), quest);

            if (makeRewiew.ShowDialog() == true)
            {
                Manager.MainFrame.NavigationService.Refresh();
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                LoadDataGrid();
            }
        }

        private void RatingBarRate_MouseDown(object sender, MouseButtonEventArgs e)
        {
            //Weapon quest = (sender as Button).DataContext as Weapon;
            ////Trainer trainer = YogaFeatPilatesBDEntities.GetContext().Trainers.FirstOrDefault(p => p.Id == edu.TrainerId);
            ////List<TimeTable> timeTables = YogaFeatPilatesBDEntities.GetContext().TimeTables.Where(p => p.CategoryTrainerId == edu.Id).ToList();
            ////ListBoxTimeTable.ItemsSource = timeTables;
            ////TbCategoryName.Text = edu.Category.Name;
            //ListBoxRewiews.ItemsSource = quest.Rewiews;
            //DialogHostMoreInformation.DataContext = quest;
            //DialogHostMoreInformation.IsOpen = true;
        }
    }
}
