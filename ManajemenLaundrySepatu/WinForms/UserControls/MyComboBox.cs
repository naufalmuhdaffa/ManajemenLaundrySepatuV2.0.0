using System;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Design;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    [DefaultEvent("OnSelectedIndexChanged")]
    public class MyComboBox : UserControl
    {
        private Color backColor = Color.WhiteSmoke;

        private Color iconColor = Color.MediumSlateBlue;
        private Color listBackColor = Color.FromArgb(230, 228, 245);
        private Color listTextColor = Color.DimGray;
        private Color borderColor = Color.MediumSlateBlue;
        private int borderSize = 1;
        private ComboBox cmbList;

        private Label lblText;
        private Button btnIcon;

        public event EventHandler OnSelectedIndexChanged; public MyComboBox()

        {
            cmbList = new ComboBox();
            lblText = new Label();
            btnIcon = new Button();
            this.SuspendLayout();

            cmbList.KeyDown += (s, e) => this.OnKeyDown(e);
            cmbList.BackColor = listBackColor;
            cmbList.Font = new Font(this.Font.Name, 10F);
            cmbList.ForeColor = listTextColor;
            cmbList.SelectedIndexChanged += ComboBox_SelectedIndexChanged;
            cmbList.TextChanged += ComboBox_TextChanged;
            btnIcon.Dock = DockStyle.Right;
            btnIcon.FlatStyle = FlatStyle.Flat;
            btnIcon.FlatAppearance.BorderSize = 0;
            btnIcon.BackColor = backColor;
            btnIcon.Size = new Size(30, 30);
            btnIcon.Cursor = Cursors.Hand;
            btnIcon.Click += Icon_Click;
            btnIcon.Paint += Icon_Paint;
            lblText.Dock = DockStyle.Fill;
            lblText.AutoSize = false;
            lblText.BackColor = backColor;
            lblText.TextAlign = ContentAlignment.MiddleLeft;
            lblText.Padding = new Padding(8, 0, 0, 0);
            lblText.Font = new Font(this.Font.Name, 10F);
            lblText.Click += Surface_Click;
            lblText.MouseEnter += Surface_MouseEnter;
            lblText.MouseLeave += Surface_MouseLeave;
            this.Controls.Add(lblText);
            this.Controls.Add(btnIcon);
            this.Controls.Add(cmbList);
            this.MinimumSize = new Size(200, 30);
            this.Size = new Size(200, 30);
            this.ForeColor = Color.DimGray;
            this.Padding = new Padding(borderSize);
            this.Font = new Font(this.Font.Name, 10F);
            base.BackColor = borderColor;
            this.ResumeLayout();
            AdjustComboBoxDimensions();
        }

        [Category("RJ Code - Data")]
        public bool DroppedDown
        {
            get => cmbList.DroppedDown;
            set => cmbList.DroppedDown = value;
        }

        private void AdjustComboBoxDimensions()
        {
            int fullWidth = this.Width - this.Padding.Left - this.Padding.Right;
            cmbList.Width = fullWidth;
            cmbList.Location = new Point(
                this.Padding.Left,
                lblText.Bottom - cmbList.Height
            );
            cmbList.DropDownWidth = fullWidth;
        }

        private void ComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnSelectedIndexChanged?.Invoke(sender, e);
            lblText.Text = cmbList.Text;
        }

        private void Icon_Click(object sender, EventArgs e)
        {
            cmbList.Select();
            cmbList.DroppedDown = true;
        }

        private void Surface_Click(object sender, EventArgs e)
        {
            this.OnClick(e);
            cmbList.Select();
            if (cmbList.DropDownStyle == ComboBoxStyle.DropDownList)
                cmbList.DroppedDown = true;
        }

        private void ComboBox_TextChanged(object sender, EventArgs e)
        {
            lblText.Text = cmbList.Text;
        }

        private void Icon_Paint(object sender, PaintEventArgs e)
        {
            int iconWidth = 14;
            int iconHeight = 6;
            var rectIcon = new Rectangle(
                (btnIcon.Width - iconWidth) / 2,
                (btnIcon.Height - iconHeight) / 2,
                iconWidth, iconHeight
            );
            Graphics graph = e.Graphics;
            using (GraphicsPath path = new GraphicsPath())
            using (Pen pen = new Pen(iconColor, 2))
            {
                graph.SmoothingMode = SmoothingMode.AntiAlias;
                path.AddLine(rectIcon.X, rectIcon.Y,
                             rectIcon.X + (iconWidth / 2), rectIcon.Bottom);
                path.AddLine(rectIcon.X + (iconWidth / 2), rectIcon.Bottom,
                             rectIcon.Right, rectIcon.Y);
                graph.DrawPath(pen, path);
            }
        }

        [Category("RJ Code - Appearance")]
        public override Color BackColor
        {
            get => backColor;
            set
            {
                backColor = value;
                lblText.BackColor = backColor;
                btnIcon.BackColor = backColor;
            }
        }

        [Category("RJ Code - Appearance")]
        public Color IconColor
        {
            get => iconColor;
            set
            {
                iconColor = value;
                btnIcon.Invalidate();
            }
        }

        [Category("RJ Code - Appearance")]
        public Color ListBackColor
        {
            get => listBackColor;
            set
            {
                listBackColor = value;
                cmbList.BackColor = listBackColor;
            }
        }

        [Category("RJ Code - Appearance")]
        public Color ListTextColor
        {
            get => listTextColor;
            set
            {
                listTextColor = value;
                cmbList.ForeColor = listTextColor;
            }
        }

        [Category("RJ Code - Appearance")]
        public Color BorderColor
        {
            get => borderColor;
            set
            {
                borderColor = value;
                base.BackColor = borderColor;
            }
        }

        [Category("RJ Code - Appearance")]
        public int BorderSize
        {
            get => borderSize;
            set
            {
                borderSize = value;
                this.Padding = new Padding(borderSize);
                AdjustComboBoxDimensions();
            }
        }

        [Category("RJ Code - Appearance")]
        public override Color ForeColor
        {
            get => base.ForeColor;
            set
            {
                base.ForeColor = value;
                lblText.ForeColor = value;
            }
        }

        [Category("RJ Code - Appearance")]
        public override Font Font
        {
            get => base.Font;
            set
            {
                base.Font = value;
                lblText.Font = value;
                cmbList.Font = value;
            }
        }

        [Category("RJ Code - Appearance")]
        public string Texts
        {
            get => lblText.Text;
            set => lblText.Text = value;
        }

        [Category("RJ Code - Appearance")]
        public ComboBoxStyle DropDownStyle
        {
            get => cmbList.DropDownStyle;
            set
            {
                if (value != ComboBoxStyle.Simple)
                    cmbList.DropDownStyle = value;
            }
        }

        [Category("RJ Code - Data")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [Editor("System.Windows.Forms.Design.ListControlStringCollectionEditor, System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a", typeof(UITypeEditor))]
        [Localizable(true)]
        [MergableProperty(false)]
        public ComboBox.ObjectCollection Items
        {
            get => cmbList.Items;
        }

        [Category("RJ Code - Data")]
        [AttributeProvider(typeof(IListSource))]
        [DefaultValue(null)]
        public object DataSource
        {
            get => cmbList.DataSource;
            set => cmbList.DataSource = value;
        }

        [Category("RJ Code - Data")]
        [Browsable(true)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [Editor("System.Windows.Forms.Design.ListControlStringCollectionEditor, System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a", typeof(UITypeEditor))]
        [EditorBrowsable(EditorBrowsableState.Always)]
        [Localizable(true)]
        public AutoCompleteStringCollection AutoCompleteCustomSource
        {
            get => cmbList.AutoCompleteCustomSource;
            set => cmbList.AutoCompleteCustomSource = value;
        }

        [Category("RJ Code - Data")]
        [Browsable(true)]
        [DefaultValue(AutoCompleteSource.None)]
        [EditorBrowsable(EditorBrowsableState.Always)]
        public AutoCompleteSource AutoCompleteSource
        {
            get => cmbList.AutoCompleteSource;
            set => cmbList.AutoCompleteSource = value;
        }

        [Category("RJ Code - Data")]
        [Browsable(true)]
        [DefaultValue(AutoCompleteMode.None)]
        [EditorBrowsable(EditorBrowsableState.Always)]
        public AutoCompleteMode AutoCompleteMode
        {
            get => cmbList.AutoCompleteMode;
            set => cmbList.AutoCompleteMode = value;
        }

        [Category("RJ Code - Data")]
        [Bindable(true)]
        [Browsable(false)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
        public object SelectedItem
        {
            get => cmbList.SelectedItem;
            set => cmbList.SelectedItem = value;
        }

        [Category("RJ Code - Data")]
        [Browsable(false)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
        public int SelectedIndex
        {
            get => cmbList.SelectedIndex;
            set => cmbList.SelectedIndex = value;
        }

        [Category("RJ Code - Data")]
        [DefaultValue("")]
        [Editor("System.Windows.Forms.Design.DataMemberFieldEditor, System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a", typeof(UITypeEditor))]
        [TypeConverter("System.Windows.Forms.Design.DataMemberFieldConverter, System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")]
        public string DisplayMember
        {
            get => cmbList.DisplayMember;
            set => cmbList.DisplayMember = value;
        }

        [Category("RJ Code - Data")]
        [DefaultValue("")]
        [Editor("System.Windows.Forms.Design.DataMemberFieldEditor, System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a", typeof(UITypeEditor))]
        public string ValueMember
        {
            get => cmbList.ValueMember;
            set => cmbList.ValueMember = value;
        }

        private void Surface_MouseLeave(object sender, EventArgs e)
        {
            this.OnMouseLeave(e);
        }

        private void Surface_MouseEnter(object sender, EventArgs e)
        {
            this.OnMouseEnter(e);
        }

        protected override void OnResize(EventArgs e)
        {
            base.OnResize(e);
            AdjustComboBoxDimensions();
        }
    }
}