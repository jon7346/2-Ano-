namespace App_Metodo_função
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
            this.textmodelo1 = new System.Windows.Forms.TextBox();
            this.IF = new System.Windows.Forms.Button();
            this.SWITCH = new System.Windows.Forms.Button();
            this.cbbmodelo = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtnome = new System.Windows.Forms.TextBox();
            this.btnmetodo = new System.Windows.Forms.Button();
            this.btnfuncao = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textmodelo1
            // 
            this.textmodelo1.Location = new System.Drawing.Point(15, 38);
            this.textmodelo1.Name = "textmodelo1";
            this.textmodelo1.Size = new System.Drawing.Size(100, 22);
            this.textmodelo1.TabIndex = 0;
            // 
            // IF
            // 
            this.IF.Location = new System.Drawing.Point(151, 38);
            this.IF.Name = "IF";
            this.IF.Size = new System.Drawing.Size(75, 23);
            this.IF.TabIndex = 1;
            this.IF.Text = "IF";
            this.IF.UseVisualStyleBackColor = true;
            this.IF.Click += new System.EventHandler(this.IF_Click);
            // 
            // SWITCH
            // 
            this.SWITCH.Location = new System.Drawing.Point(151, 104);
            this.SWITCH.Name = "SWITCH";
            this.SWITCH.Size = new System.Drawing.Size(75, 23);
            this.SWITCH.TabIndex = 2;
            this.SWITCH.Text = "SWITCH";
            this.SWITCH.UseVisualStyleBackColor = true;
            this.SWITCH.Click += new System.EventHandler(this.button2_Click);
            // 
            // cbbmodelo
            // 
            this.cbbmodelo.FormattingEnabled = true;
            this.cbbmodelo.Items.AddRange(new object[] {
            "SKYLINE",
            "UNO(COM ESCADA)",
            "SUPRA ",
            "MONZA"});
            this.cbbmodelo.Location = new System.Drawing.Point(12, 104);
            this.cbbmodelo.Name = "cbbmodelo";
            this.cbbmodelo.Size = new System.Drawing.Size(121, 24);
            this.cbbmodelo.TabIndex = 3;
            this.cbbmodelo.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(109, 16);
            this.label1.TabIndex = 4;
            this.label1.Text = "modelo do carro ";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 82);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(184, 16);
            this.label2.TabIndex = 5;
            this.label2.Text = "Selecione o modelo do carro ";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(263, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(116, 16);
            this.label3.TabIndex = 6;
            this.label3.Text = "informe seu nome ";
            // 
            // txtnome
            // 
            this.txtnome.Location = new System.Drawing.Point(266, 28);
            this.txtnome.Name = "txtnome";
            this.txtnome.Size = new System.Drawing.Size(100, 22);
            this.txtnome.TabIndex = 7;
            // 
            // btnmetodo
            // 
            this.btnmetodo.Location = new System.Drawing.Point(291, 65);
            this.btnmetodo.Name = "btnmetodo";
            this.btnmetodo.Size = new System.Drawing.Size(75, 23);
            this.btnmetodo.TabIndex = 8;
            this.btnmetodo.Text = "METODO";
            this.btnmetodo.UseVisualStyleBackColor = true;
            this.btnmetodo.Click += new System.EventHandler(this.btnmetodo_Click);
            // 
            // btnfuncao
            // 
            this.btnfuncao.Location = new System.Drawing.Point(291, 117);
            this.btnfuncao.Name = "btnfuncao";
            this.btnfuncao.Size = new System.Drawing.Size(75, 23);
            this.btnfuncao.TabIndex = 9;
            this.btnfuncao.Text = "FUNCAO";
            this.btnfuncao.UseVisualStyleBackColor = true;
            this.btnfuncao.Click += new System.EventHandler(this.btnfuncao_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(754, 182);
            this.Controls.Add(this.btnfuncao);
            this.Controls.Add(this.btnmetodo);
            this.Controls.Add(this.txtnome);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbbmodelo);
            this.Controls.Add(this.SWITCH);
            this.Controls.Add(this.IF);
            this.Controls.Add(this.textmodelo1);
            this.Name = "Form1";
            this.Text = "  ";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textmodelo1;
        private System.Windows.Forms.Button IF;
        private System.Windows.Forms.Button SWITCH;
        private System.Windows.Forms.ComboBox cbbmodelo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtnome;
        private System.Windows.Forms.Button btnmetodo;
        private System.Windows.Forms.Button btnfuncao;
    }
}

