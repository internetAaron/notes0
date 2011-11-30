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
            string myvalue;
            myvalue = "you typed" + textBox1.Text;
            myTextBlock.Text = myvalue;
        }

        private void textBox1_TextChanged(object sender, TextChangedEventArgs e)
        {
            myTextBlock.Text = "you typed" + textBox1.Text;
        }

        private void LayoutRoot_Loaded(object sender, RoutedEventArgs e)
        {
            textBox1.Focus();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            myTextBlock.Text = myMethod("Adam");
        }

        private string myMethod(string name)
        {
            return String.Format("hello from method {0}", name);
        }
    }
}