using System;
using System.Windows;
using Google.Cloud.Translation.V2;

namespace WpfApp1
{
    /// <summary>
    /// MainWindow.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            result.Text = TranslateTextWithModel().TranslatedText;
        }
        public TranslationResult TranslateTextWithModel()
        {
            TranslationClient client = TranslationClient.Create();
            TranslationResult result = client.TranslateText(
                text: tb.Text,
                targetLanguage: "ko",  // Korean
                sourceLanguage: "en",  // English
                model: TranslationModel.NeuralMachineTranslation);
            Console.WriteLine($"Model: {result.Model}");
            Console.WriteLine(result.TranslatedText);

            return result;
        }
    }
}
