namespace AppCadastro
{
    partial class Form1
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblData = new System.Windows.Forms.Label();
            this.lblHora = new System.Windows.Forms.Label();
            this.btnCadProduto = new System.Windows.Forms.Button();
            this.btnCadCliente = new System.Windows.Forms.Button();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.cadastrosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.clientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.produtosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.utilitáriosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ajudaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.atualizarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sairToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.btnListar = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.panel1.Controls.Add(this.lblData);
            this.panel1.Controls.Add(this.lblHora);
            this.panel1.Controls.Add(this.btnCadProduto);
            this.panel1.Controls.Add(this.btnCadCliente);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 24);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(500, 56);
            this.panel1.TabIndex = 0;
            // 
            // lblData
            // 
            this.lblData.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblData.ForeColor = System.Drawing.Color.White;
            this.lblData.Location = new System.Drawing.Point(232, 29);
            this.lblData.Name = "lblData";
            this.lblData.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.lblData.Size = new System.Drawing.Size(261, 19);
            this.lblData.TabIndex = 3;
            this.lblData.Text = "label2";
            // 
            // lblHora
            // 
            this.lblHora.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHora.ForeColor = System.Drawing.Color.White;
            this.lblHora.Location = new System.Drawing.Point(227, 3);
            this.lblHora.Name = "lblHora";
            this.lblHora.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.lblHora.Size = new System.Drawing.Size(270, 26);
            this.lblHora.TabIndex = 2;
            this.lblHora.Text = "label1";
            // 
            // btnCadProduto
            // 
            this.btnCadProduto.FlatAppearance.BorderSize = 0;
            this.btnCadProduto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCadProduto.Image = global::AppCadastro.Properties.Resources.icons8_Product_36px;
            this.btnCadProduto.Location = new System.Drawing.Point(63, 12);
            this.btnCadProduto.Name = "btnCadProduto";
            this.btnCadProduto.Size = new System.Drawing.Size(36, 36);
            this.btnCadProduto.TabIndex = 1;
            this.toolTip1.SetToolTip(this.btnCadProduto, "Cadastro de Produto");
            this.btnCadProduto.UseVisualStyleBackColor = true;
            this.btnCadProduto.Click += new System.EventHandler(this.btnCadProduto_Click);
            // 
            // btnCadCliente
            // 
            this.btnCadCliente.FlatAppearance.BorderSize = 0;
            this.btnCadCliente.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCadCliente.Image = global::AppCadastro.Properties.Resources.icons8_customer_36px;
            this.btnCadCliente.Location = new System.Drawing.Point(12, 12);
            this.btnCadCliente.Name = "btnCadCliente";
            this.btnCadCliente.Size = new System.Drawing.Size(36, 36);
            this.btnCadCliente.TabIndex = 0;
            this.toolTip1.SetToolTip(this.btnCadCliente, "Cadastro de Cliente");
            this.btnCadCliente.UseVisualStyleBackColor = true;
            this.btnCadCliente.Click += new System.EventHandler(this.btnCadCliente_Click_1);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cadastrosToolStripMenuItem,
            this.utilitáriosToolStripMenuItem,
            this.sairToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(500, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // cadastrosToolStripMenuItem
            // 
            this.cadastrosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.clientesToolStripMenuItem,
            this.produtosToolStripMenuItem});
            this.cadastrosToolStripMenuItem.Name = "cadastrosToolStripMenuItem";
            this.cadastrosToolStripMenuItem.Size = new System.Drawing.Size(71, 20);
            this.cadastrosToolStripMenuItem.Text = "Cadastros";
            // 
            // clientesToolStripMenuItem
            // 
            this.clientesToolStripMenuItem.Name = "clientesToolStripMenuItem";
            this.clientesToolStripMenuItem.Size = new System.Drawing.Size(122, 22);
            this.clientesToolStripMenuItem.Text = "Clientes";
            this.clientesToolStripMenuItem.Click += new System.EventHandler(this.clientesToolStripMenuItem_Click);
            // 
            // produtosToolStripMenuItem
            // 
            this.produtosToolStripMenuItem.Name = "produtosToolStripMenuItem";
            this.produtosToolStripMenuItem.Size = new System.Drawing.Size(122, 22);
            this.produtosToolStripMenuItem.Text = "Produtos";
            this.produtosToolStripMenuItem.Click += new System.EventHandler(this.produtosToolStripMenuItem_Click);
            // 
            // utilitáriosToolStripMenuItem
            // 
            this.utilitáriosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ajudaToolStripMenuItem,
            this.atualizarToolStripMenuItem});
            this.utilitáriosToolStripMenuItem.Name = "utilitáriosToolStripMenuItem";
            this.utilitáriosToolStripMenuItem.Size = new System.Drawing.Size(69, 20);
            this.utilitáriosToolStripMenuItem.Text = "Utilitários";
            // 
            // ajudaToolStripMenuItem
            // 
            this.ajudaToolStripMenuItem.Name = "ajudaToolStripMenuItem";
            this.ajudaToolStripMenuItem.Size = new System.Drawing.Size(120, 22);
            this.ajudaToolStripMenuItem.Text = "Ajuda";
            // 
            // atualizarToolStripMenuItem
            // 
            this.atualizarToolStripMenuItem.Name = "atualizarToolStripMenuItem";
            this.atualizarToolStripMenuItem.Size = new System.Drawing.Size(120, 22);
            this.atualizarToolStripMenuItem.Text = "Atualizar";
            // 
            // sairToolStripMenuItem
            // 
            this.sairToolStripMenuItem.Name = "sairToolStripMenuItem";
            this.sairToolStripMenuItem.Size = new System.Drawing.Size(38, 20);
            this.sairToolStripMenuItem.Text = "Sair";
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // btnListar
            // 
            this.btnListar.Location = new System.Drawing.Point(12, 86);
            this.btnListar.Name = "btnListar";
            this.btnListar.Size = new System.Drawing.Size(75, 23);
            this.btnListar.TabIndex = 2;
            this.btnListar.Text = "Listar";
            this.btnListar.UseVisualStyleBackColor = true;
            this.btnListar.Click += new System.EventHandler(this.btnListar_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.ClientSize = new System.Drawing.Size(500, 181);
            this.Controls.Add(this.btnListar);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Sistema de Cadastros";
            this.panel1.ResumeLayout(false);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnCadCliente;
        private System.Windows.Forms.Button btnCadProduto;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem cadastrosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem clientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem produtosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem utilitáriosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ajudaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem atualizarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sairToolStripMenuItem;
        private System.Windows.Forms.Label lblData;
        private System.Windows.Forms.Label lblHora;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Button btnListar;
    }
}

