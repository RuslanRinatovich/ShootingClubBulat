using Microsoft.Win32;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Word = Microsoft.Office.Interop.Word;

namespace QuestWorldApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ShowOrderPage.xaml
    /// </summary>
    public partial class ShowOrderPage : Page
    {
        Order _currentOrder; // текущий заказ
        User _currentUser;// текущий пользователь
        public ShowOrderPage(Order order)
        {
            InitializeComponent();
            _currentUser = order.User;
            LoadDataAndInit(order);
        }
        // Загрузка и инициализация данных
        void LoadDataAndInit(Order order)
        {
            _currentOrder = order;
            DataGridOrderItems.ItemsSource = null;
            DataGridOrderItems.ItemsSource = order.OrderServices;

            
             TextBlockOrderNumber.Text = $"Заказ №{_currentOrder.Id} на имя " +
                 $"{ _currentUser.LastName} {_currentUser.FirstName} оформлен";
            
            TextBlockTotalCost.Text = $"Итого {_currentOrder.Total:C}";
            TextBlockOrderCreateDate.Text = _currentOrder.DateOrder.ToString("f");
          

        }


        private void BtnSavePDF_Click(object sender, RoutedEventArgs e)
        {
            PrintInPdf(_currentOrder);
        }

        void PrintInPdf(Order order)
        {
            try
            {
                string path = null;
                // указываем файл для сохранения
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "PDF (.pdf)|*.pdf"; // Filter files by extension
                                                            // если диалог завершился успешно
                if (saveFileDialog.ShowDialog() == true)
                {
                    path = saveFileDialog.FileName;
                    Word.Application application = new Word.Application();
                    Word.Document document = application.Documents.Add();
                    Word.Paragraph paragraph = document.Paragraphs.Add();
                    Word.Range range = paragraph.Range;
                    range.Font.Bold = 1;
                    range.Text = $"Номер заказа: {order.Id}";
                    range.InsertParagraphAfter();

                    range = paragraph.Range;
                    range.Font.Bold = 0;
                    range.Text = $"Дата заказа: {order.DateOrder}\n";
                    range.InsertParagraphAfter();


                    Word.Paragraph tableParagraph = document.Paragraphs.Add();
                    Word.Range tableRange = tableParagraph.Range;


                    Word.Table table = document.Tables.Add(tableRange, order.OrderServices.Count + 1, 6);
                    //table.Range.Bold = 0;
                    table.Borders.InsideLineStyle = table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
                    table.Range.Cells.VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;
                    Word.Range cellRange;
                    cellRange = table.Cell(1, 1).Range;
                    cellRange.Text = "№";
                    cellRange = table.Cell(1, 2).Range;
                    cellRange.Text = "Оружие";
                    cellRange = table.Cell(1, 3).Range;
                    cellRange.Text = "Наименование услуги";
                    cellRange = table.Cell(1, 4).Range;
                    cellRange.Text = "Количество";
                    cellRange = table.Cell(1, 5).Range;
                    cellRange.Text = "Стоимость";

                    cellRange = table.Cell(1, 6).Range;
                    cellRange.Text = "ИТОГО";
                    table.Rows[1].Range.Bold = 1;
                    table.Rows[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    int i = 0;
                    foreach (var item in order.OrderServices)
                    {
                        cellRange = table.Cell(i + 2, 1).Range;
                        cellRange.Text = (i + 1).ToString();
                        cellRange = table.Cell(i + 2, 2).Range;
                        cellRange.Text = item.Pricelist.Weapon.Title;
                        cellRange = table.Cell(i + 2, 3).Range;
                        cellRange.Text = item.Pricelist.Service.Title;
                        cellRange = table.Cell(i + 2, 4).Range;
                        cellRange.Text = item.Count.ToString();
                        cellRange = table.Cell(i + 2, 5).Range;
                        cellRange.Text = item.Pricelist.Price.ToString("f2");

                        cellRange = table.Cell(i + 2, 6).Range;
                        cellRange.Text = item.Total.ToString("f2");
                        i++;
                    }
                    Word.Paragraph generalSumProduct = document.Paragraphs.Add();
                    Word.Range generalRange = generalSumProduct.Range;
                    generalRange.Text = $"\nОбщая сумма заказа: {order.Total:f2} руб.";
                    document.SaveAs2($@"{path}", Word.WdExportFormat.wdExportFormatPDF);
                    MessageBox.Show("Талон сохранен");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        // отображение номеров строк в DataGrid
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }
    }
}
