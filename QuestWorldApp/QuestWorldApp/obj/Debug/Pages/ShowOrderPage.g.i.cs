﻿#pragma checksum "..\..\..\Pages\ShowOrderPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "A221BEA7A92893665A67F09FE7823EBEAF6A832FEFC604B5FE1338766E8FE127"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using QuestWorldApp.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace QuestWorldApp.Pages {
    
    
    /// <summary>
    /// ShowOrderPage
    /// </summary>
    public partial class ShowOrderPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 36 "..\..\..\Pages\ShowOrderPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockOrderNumber;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\Pages\ShowOrderPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockOrderCreateDate;
        
        #line default
        #line hidden
        
        
        #line 55 "..\..\..\Pages\ShowOrderPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid DataGridOrderItems;
        
        #line default
        #line hidden
        
        
        #line 90 "..\..\..\Pages\ShowOrderPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockTotalCost;
        
        #line default
        #line hidden
        
        
        #line 96 "..\..\..\Pages\ShowOrderPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnSavePDF;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/QuestWorldApp;component/pages/showorderpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\ShowOrderPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.TextBlockOrderNumber = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 2:
            this.TextBlockOrderCreateDate = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.DataGridOrderItems = ((System.Windows.Controls.DataGrid)(target));
            
            #line 60 "..\..\..\Pages\ShowOrderPage.xaml"
            this.DataGridOrderItems.LoadingRow += new System.EventHandler<System.Windows.Controls.DataGridRowEventArgs>(this.DataGridGoodLoadingRow);
            
            #line default
            #line hidden
            return;
            case 4:
            this.TextBlockTotalCost = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 5:
            this.BtnSavePDF = ((System.Windows.Controls.Button)(target));
            
            #line 99 "..\..\..\Pages\ShowOrderPage.xaml"
            this.BtnSavePDF.Click += new System.Windows.RoutedEventHandler(this.BtnSavePDF_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

