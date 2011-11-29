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

namespace D01P03_hello
{
    public partial class myFirstXamlPage : PhoneApplicationPage
    {
        public myFirstXamlPage()
        {
            InitializeComponent();
        }

        private void clickMeButton_Click(object sender, RoutedEventArgs e)
        {
            myTextBlock.Text = "hello again!";
        }
    }
}