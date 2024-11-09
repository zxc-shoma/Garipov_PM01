using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {

        private DOCTORS _currentDoctor = new DOCTORS();
        public AddEditPage(DOCTORS selectedDoctor)
        {
            InitializeComponent();
            if (selectedDoctor != null)
            {
                _currentDoctor = selectedDoctor;
                ComboType.SelectedIndex = _currentDoctor.DOCTOR_DEPARTAMENT_ID - 2 ;
            }


            DataContext = _currentDoctor;
        }

        private void UploadPhotoButton_Click(object sender, RoutedEventArgs e)
        {

            OpenFileDialog myOpenFileDialog = new OpenFileDialog();
            if (myOpenFileDialog.ShowDialog() == true)
            {

                FileInfo fileInfo = new FileInfo(myOpenFileDialog.FileName);


                if (fileInfo.Length < 2 * 1024 * 1024)
                {
                    _currentDoctor.DOCTOR_PHOTO = myOpenFileDialog.FileName;
                    _photo.Source = new BitmapImage(new Uri(myOpenFileDialog.FileName));
                }
                else
                {

                    MessageBox.Show("Размер файла превышает 2 мегабайта. Выберите другой файл.");
                }
            }

        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder err = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentDoctor.DOCTOR_NAME))
                err.AppendLine("Укажите имя врача");
            if (string.IsNullOrWhiteSpace(_currentDoctor.DOCTOR_SURNAME))
                err.AppendLine("Укажите фамилию врача");
            if (string.IsNullOrWhiteSpace(_currentDoctor.DOCTOR_PATRONYMIC))
                err.AppendLine("Укажите отчество врача");
            if (string.IsNullOrWhiteSpace(_currentDoctor.DOCTOR_POST))
                err.AppendLine("Укажите должность врача");
            if (string.IsNullOrWhiteSpace(_currentDoctor.DOCTOR_SCIENTIFIC))
                err.AppendLine("Укажите образование врача");
            if (_currentDoctor.DOCTOR_EXPERIENCE == DateTime.MinValue)

                err.AppendLine("Укажите дату выхода на работу врача");

            if (string.IsNullOrWhiteSpace(_currentDoctor.DOCTOR_ADRESS))
                err.AppendLine("Укажите адрес врача");
            if (ComboType.SelectedItem == null)
                err.AppendLine("Укажите отделение ");
              else
                {

                    _currentDoctor.DOCTOR_DEPARTAMENT_ID = ComboType.SelectedIndex + 2 ;
                }

            if (err.Length > 0)
            {
                MessageBox.Show(err.ToString());
                return;
            }

            if (_currentDoctor.DOCTOR_ID == 0)
               PolyclinicEntities.GetContext().DOCTORS.Add(_currentDoctor);

            try
            {
                PolyclinicEntities.GetContext().SaveChanges();
                MessageBox.Show("информация сохранена");
                manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }


        }
    }
}
