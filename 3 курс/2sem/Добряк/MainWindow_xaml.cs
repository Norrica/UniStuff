using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //ObservableCollection<Table> ObservableCollection { get; set; }
        public MainWindow()
        {
            var observableCollection = new ObservableCollection<Table>();
            observableCollection.Add(new Table { ID = 1, City = "Екатеринбург", Head = 1, Level = "Маникюр", Name = "Анастасия", Salary = 200000 });
            observableCollection.Add(new Table { ID = 2, City = "Москва", Head = 2, Level = "Педикюр", Name = "Александра", Salary = 30000 });
            observableCollection.Add(new Table { ID = 3, City = "Екатеринбург", Head = 1, Level = "Колорист", Name = "Марина", Salary = 260000 });
            observableCollection.Add(new Table { ID = 4, City = "Екатеринбург", Head = 1, Level = "Наращивание ресниц", Name = "Ирина", Salary = 270000 });
            observableCollection.Add(new Table { ID = 5, City = "Москва", Head = 2, Level = "Наращивание волос", Name = "Клавдия", Salary = 34000 });
            InitializeComponent();
            data.ItemsSource = observableCollection;
        }
        
    }
}
