using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;

namespace D01_homework
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            string secret = "2 3 42 !";

            textBlock1.Text = (textBox1.Text == secret) ? "You won!" : "Try again";
        }

        private void textBox1_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

    }
}