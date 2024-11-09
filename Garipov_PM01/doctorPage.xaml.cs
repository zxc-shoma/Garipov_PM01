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

namespace Garipov_PM01
{
    /// <summary>
    /// Логика взаимодействия для doctorPage.xaml
    /// </summary>
    public partial class doctorPage : Page
    {
        public doctorPage()
        {
            InitializeComponent();

            var currentDoctor = PolyclinicEntities.GetContext().DOCTORS.ToList();
            DoctorListView.ItemsSource = currentDoctor;


            DepartmentComboBox.SelectedIndex = 0;

            Update();
            DoctorListView.Items.Refresh();
        }

        private void Update()
        {
            var currentDoctor = PolyclinicEntities.GetContext().DOCTORS.ToList();

            var start_count = currentDoctor.Count;

            if (DepartmentComboBox.SelectedIndex == 0)
            {
                currentDoctor = currentDoctor;
            }
            if (DepartmentComboBox.SelectedIndex == 1)
            {
                currentDoctor = currentDoctor.Where(p => (p.DOCTOR_DEPARTAMENT_ID == 2)).ToList();
            }
            if (DepartmentComboBox.SelectedIndex == 2)
            {
                currentDoctor = currentDoctor.Where(p => (p.DOCTOR_DEPARTAMENT_ID == 3)).ToList();
            }
            if (DepartmentComboBox.SelectedIndex == 3)
            {
                currentDoctor = currentDoctor.Where(p => (p.DOCTOR_DEPARTAMENT_ID == 4)).ToList();
            }
            if (DepartmentComboBox.SelectedIndex == 4)
            {
                currentDoctor = currentDoctor.Where(p => (p.DOCTOR_DEPARTAMENT_ID == 5)).ToList();
            }
            if (DepartmentComboBox.SelectedIndex == 5)
            {
                currentDoctor = currentDoctor.Where(p => (p.DOCTOR_DEPARTAMENT_ID == 6)).ToList();
            }

            currentDoctor = currentDoctor.Where(p => p.DOCTOR_NAME.ToLower().Contains(SearchBox.Text.ToLower()) ||
            p.DOCTOR_SURNAME.ToLower().Contains(SearchBox.Text.ToLower()) ||
            p.DOCTOR_PATRONYMIC.ToLower().Contains(SearchBox.Text.ToLower())).ToList();

            if (SortAscRadioButton.IsChecked.Value)
            {
                currentDoctor = currentDoctor.OrderBy(p => p.DOCTOR_WORK).ToList();

            }
            if (SortDescRadioButton.IsChecked.Value)
            {
                currentDoctor = currentDoctor.OrderByDescending(p => p.DOCTOR_WORK).ToList();
            }

            TBCount.Text = string.Format("{0} из {1}", currentDoctor.Count, start_count);

            DoctorListView.ItemsSource = currentDoctor;




        }



        private void DepartmentComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
            DoctorListView.Items.Refresh();

        }

        private void SortAscRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
            DoctorListView.Items.Refresh();

        }

        private void SortDescRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
            DoctorListView.Items.Refresh();
        }

        private void SortAscRadioButton_Checked_1(object sender, RoutedEventArgs e)
        {
            Update();
            DoctorListView.Items.Refresh();

        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {

            Update();
            DoctorListView.Items.Refresh();

        }

        private void AddDoctor_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new AddEditPage(null));
            Update();
            DoctorListView.Items.Refresh();
        }

        private void editDoctor_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new AddEditPage((sender as Button).DataContext as DOCTORS));
            Update();
            DoctorListView.Items.Refresh();
        }

        private void deleteDoctor_Click(object sender, RoutedEventArgs e)
        {
            var currentDoctor = (sender as Button).DataContext as DOCTORS;
            var currentDoctorHistory = PolyclinicEntities.GetContext().MEDICAL_HISTORY.ToList();
            currentDoctorHistory = currentDoctorHistory.Where(p=>p.HISTORY_DOCTOR_ID ==currentDoctor.DOCTOR_ID).ToList();

            if (currentDoctorHistory.Count!=0)
            {
                MessageBox.Show("Невозможно выполнить удаление, так как врач записан на прием!");
               
                

            }
            else
            {
                if (MessageBox.Show("Вы точно хотите удалить?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    PolyclinicEntities.GetContext().DOCTORS.Remove(currentDoctor);
                    PolyclinicEntities.GetContext().SaveChanges();
                    DoctorListView.ItemsSource = PolyclinicEntities.GetContext().DOCTORS.ToList();
                    Update();
                }

            }




        }

        private void DoctorListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
            DoctorListView.Items.Refresh();
        }

        private void DoctorListView_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {

            Update();

        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {

            if (Visibility == Visibility.Visible)
            {
                PolyclinicEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DoctorListView.ItemsSource = PolyclinicEntities.GetContext().DOCTORS.ToList();
                Update();
            }

        }
    }
}
